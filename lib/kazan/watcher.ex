defmodule Kazan.Watcher do
  @moduledoc """

  Watches for changes on a resource.  This works by creating a HTTPoison ASync request.
  The request will eventually timeout, however the Watcher handles recreating the request
  when this occurs and requesting new events that have occurred since the last *resource_version*
  received.

  To use:

  1. Create a request in the normal way that supports the `watch` parameter.  Alternatively
  create a watch request.
  ```
  request = Kazan.Apis.Core.V1.list_namespace!() # No need to add watch: true
  ```
  or
  ```
  request = Kazan.Apis.Core.V1.watch_namespace_list!()
  ```
  2. Start a watcher using the request, and passing the initial resource version
  and a pid to which to send received messages.
  ```
  Kazan.Watcher.start_link(request, resource_version: rv, send_to: self())
  ```
  If no `resource_version` is passed then the watcher initially makes a normal
  request to get the starting value.  This will only work if a non `watch` request
  is used. i.e. `Kazan.Apis.Core.V1.list_namespace!()`
  rather than `Kazan.Apis.Core.V1.watch_namespace_list!()`

  3. In your client code you receive messages for each `%Watcher.Event{}`.
    You can pattern match on the object type if you have multiple watchers configured.
    For example, if the client is a `GenServer`
  ```
    # type is "ADDED", "DELETED", "MODIFIED" or "GONE"
    def handle_info(%Watcher.Event{object: object, from: watcher_pid, type: type}, state) do
      case object do
        %Kazan.Apis.Core.V1.Namespace{} = namespace ->
          process_namespace_event(type, namespace)

        %Kazan.Apis.Batch.V1.Job{} = job ->
          process_job_event(type, job)
      end
      {:noreply, state}
    end
  ```

  4. In the case that a "GONE" is received, then this indicates that Kubernetes
     has sent a 410 error.  In this case the Watcher will automatically terminate
     and the consumer must clear its cache, reload any cached resources and
     restart the watcher.

  A Watcher can be terminated by calling `stop_watch/1`.
  """

  use GenServer
  alias Kazan.LineBuffer
  require Logger

  defmodule State do
    @moduledoc false

    # Stores the internal state of the watcher.
    #
    # Includes:
    #
    # resource_version:
    #
    # The K8S *resource_version* (RV) is used to version each change in the cluster.
    # When we listen for events we need to specify the RV to start listening from.
    # For each event received we also receive a new RV, which we store in state.
    # When the watch eventually times-out (it is an HTTP request with a chunked response),
    # we can then create a new request passing the latest RV that was received.
    #
    # buffer:
    #
    # Chunked HTTP responses are not always a complete line, so we must buffer them
    # until we have a complete line before parsing.

    defstruct id: nil,
              request: nil,
              send_to: nil,
              name: nil,
              buffer: nil,
              rv: nil,
              client_opts: [],
              debug: false
  end

  defmodule Event do
    defstruct [:type, :object, :from]
  end

  @doc """
  Starts a watch request to the kube server

  The server should be set in the kazan config or provided in the options.

  ### Options

  * `send_to` - A `pid` to which events are sent.  Defaults to `self()`.
  * `resource_version` - The version from which to start watching.
  * `name` - An optional name for the watcher.  Displayed in logs.
  * `debug` - A boolean indicating whether we should log debugging info.
  * Other options are passed directly to `Kazan.Client.run/2`
  """
  def start_link(%Kazan.Request{} = request, opts) do
    {send_to, opts} = Keyword.pop(opts, :send_to, self())
    GenServer.start_link(__MODULE__, [request, send_to, opts])
  end

  @doc "Stops the watch and terminates the process"
  def stop_watch(pid) do
    GenServer.call(pid, :stop_watch)
  end

  @impl GenServer
  def init([request, send_to, opts]) do
    {rv, opts} = Keyword.pop(opts, :resource_version)
    {name, opts} = Keyword.pop(opts, :name, inspect(self()))
    {debug, opts} = Keyword.pop(opts, :debug, false)

    rv =
      case rv do
        nil ->
          if debug do
            Logger.debug("Obtaining initial rv")
          end

          {:ok, object} = Kazan.run(request, Keyword.put(opts, :timeout, 500))
          extract_rv(object)

        rv ->
          rv
      end

    client_opts =
      opts
      |> Keyword.put_new(:recv_timeout, 5 * 60 * 1000)

    if debug do
      Logger.debug(
        "Watcher init: #{name} rv: #{rv} request: #{inspect(request)}"
      )
    end

    state =
      %State{
        request: request,
        rv: rv,
        send_to: send_to,
        name: name,
        client_opts: client_opts,
        debug: debug
      }
      |> start_request()

    # Monitor send_to process so we can terminate when it goes down
    Process.monitor(send_to)
    {:ok, state}
  end

  @impl GenServer
  def handle_call(:stop_watch, _from, %State{id: request_id} = state) do
    Logger.info("Stopping watch #{inspect(self())}")
    :hackney.stop_async(request_id)
    {:stop, :normal, :ok, state}
  end

  @impl GenServer
  # should not be used normally - just used for testing and debugging to force
  # a 410 error to be generated by setting the rv to a low value
  def handle_info({:set_rv, rv}, state) do
    Logger.info("Setting rv to #{rv}")
    {:noreply, %State{state | rv: rv}}
  end

  @impl GenServer
  def handle_info(%HTTPoison.AsyncStatus{code: 200}, state) do
    {:noreply, state}
  end

  @impl GenServer
  def handle_info(%HTTPoison.AsyncHeaders{}, state) do
    {:noreply, state}
  end

  @impl GenServer
  def handle_info(
        %HTTPoison.AsyncChunk{chunk: chunk, id: request_id},
        %State{id: request_id, buffer: buffer} = state
      ) do
    {lines, buffer} =
      buffer
      |> LineBuffer.add_chunk(chunk)
      |> LineBuffer.get_lines()

    case process_lines(state, lines) do
      {:ok, new_rv} ->
        {:noreply, %State{state | buffer: buffer, rv: new_rv}}

      {:error, :gone} ->
        :hackney.stop_async(request_id)
        {:stop, :normal, state}
    end
  end

  @impl GenServer
  def handle_info(
        %HTTPoison.Error{reason: {:closed, :timeout}},
        %State{name: name, rv: rv} = state
      ) do
    debug(state, "Received Timeout: #{name} rv: #{rv}")
    {:noreply, start_request(state)}
  end

  @impl GenServer
  def handle_info(
        %HTTPoison.AsyncEnd{id: request_id},
        %State{id: request_id, name: name, rv: rv} = state
      ) do
    debug(state, "Received AsyncEnd: #{name} rv: #{rv}")
    {:noreply, start_request(state)}
  end

  @impl GenServer
  def handle_info({:DOWN, _ref, :process, pid, reason}, %State{} = state) do
    %State{name: name, id: id} = state

    Logger.info(
      "#{inspect(self())} - #{name} send_to process #{inspect(pid)} :DOWN reason: #{
        reason
      }"
    )

    :hackney.stop_async(id)
    {:stop, :normal, state}
  end

  # INTERNAL

  defp start_request(
         %State{request: request, name: name, rv: rv, client_opts: client_opts} =
           state
       ) do
    query_params =
      request.query_params
      |> Map.put("watch", true)
      |> Map.put("resourceVersion", rv)

    request = %Kazan.Request{request | query_params: query_params}
    {:ok, id} = Kazan.run(request, [{:stream_to, self()} | client_opts])
    debug(state, "Started request: #{name} rv: #{rv}")
    %State{state | id: id, buffer: LineBuffer.new()}
  end

  defp process_lines(%State{name: name, rv: rv} = state, lines) do
    debug(state, "Process lines: #{name}")

    Enum.reduce(lines, {:ok, rv}, fn line, status ->
      case status do
        {:ok, current_rv} ->
          process_line(line, current_rv, state)

        # stop on error
        {:error, :gone} ->
          {:error, :gone}
      end
    end)
  end

  # Processes each line returning either {:ok, new_rv} or {:error, :gone}
  # corresponding messages are sent to the send_to process
  defp process_line(line, current_rv, %State{} = state) do
    %State{name: name, send_to: send_to} = state
    {:ok, %{"type" => type, "object" => raw_object}} = Poison.decode(line)
    {:ok, model} = Kazan.Models.decode(raw_object)

    case {type, extract_rv(raw_object)} do
      {_, {:gone, message}} ->
        Logger.warn("Received 410: #{name} message: #{message}.")
        send(send_to, %Event{type: "GONE", from: self()})
        {:error, :gone}

      {_, ^current_rv} ->
        Logger.warn(
          "Duplicate message: #{name} type: #{type} rv: #{current_rv}"
        )

        {:ok, current_rv}

      {_, new_rv} ->
        debug(state, "Received message: #{name} type: #{type} rv: #{new_rv}")

        send(send_to, %Event{type: type, object: model, from: self()})

        {:ok, new_rv}
    end
  end

  defp extract_rv(%{
         "code" => 410,
         "kind" => "Status",
         "reason" => "Gone",
         "status" => "Failure",
         "message" => message
       }),
       do: {:gone, message}

  defp extract_rv(%{"metadata" => %{"resourceVersion" => rv}}), do: rv
  defp extract_rv(%{metadata: %{resource_version: rv}}), do: rv

  defp debug(state, msg) do
    if state.debug do
      Logger.debug(msg)
    end
  end
end
