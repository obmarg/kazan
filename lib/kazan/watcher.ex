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

  3. In your client code you receive messages for each `%WatchEvent{}`.
    You can pattern match on the object type if you have multiple watchers configured.
    For example, if the client is a `GenServer`
  ```
    alias Kazan.Models.Apimachinery.Meta.V1.WatchEvent

    # type is "ADDED", "DELETED" or "MODIFIED"
    def handle_info(%WatchEvent{object: object, type: type}, state) do
      case object do
        %Kazan.Apis.Core.V1.Namespace{} = namespace ->
          process_namespace_event(type, namespace)

        %Kazan.Apis.Batch.V1.Job{} = job ->
          process_job_event(type, job)
      end
      {:noreply, state}
    end
  ```
  """

  use GenServer
  alias Kazan.LineBuffer
  alias Kazan.Models.Apimachinery.Meta.V1.WatchEvent
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

    defstruct id: nil, request: nil, send_to: nil, name: nil, buffer: nil, rv: nil, client_opts: []
  end

  @doc """
  Starts a watch request to the kube server

  The server should be set in the kazan config or provided in the options.

  ### Options

  * `send_to` - A `pid` to which events are sent.  Defaults to `self()`.
  * `resource_version` - The version from which to start watching.
  * `name` - An optional name for the watcher.  Displayed in logs.
  * Other options are passed directly to `Kazan.Client.run/2`
  """
  def start_link(%Kazan.Request{} = request, opts) do
    {send_to, opts} = Keyword.pop(opts, :send_to, self())
    GenServer.start_link(__MODULE__, [request, send_to, opts])
  end

  @impl GenServer
  def init([request, send_to, opts]) do
    {rv, opts} = Keyword.pop(opts, :resource_version)
    {name, opts} = Keyword.pop(opts, :name, inspect(self()))
    rv =
      case rv do
        nil ->
          Logger.info "Obtaining initial rv"
          {:ok, object} = Kazan.run(request, opts)
          extract_rv(object)
        rv ->
          rv
      end
    client_opts =
      opts
      |> Keyword.put_new(:recv_timeout, 5 * 60 * 1000)
    Logger.info "Watcher init: #{name} rv: #{rv} request: #{inspect request}"
    state =
      %State{request: request, rv: rv, send_to: send_to, name: name, client_opts: client_opts}
      |> start_request()
    {:ok, state}
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
  def handle_info(%HTTPoison.AsyncChunk{chunk: chunk, id: request_id},
                  %State{id: request_id, buffer: buffer} = state) do

    {lines, buffer} =
      buffer
      |> LineBuffer.add_chunk(chunk)
      |> LineBuffer.get_lines()

      new_rv = process_lines(state, lines)

    {:noreply, %State{state | buffer: buffer, rv: new_rv}}
  end

  @impl GenServer
  def handle_info(%HTTPoison.Error{reason: {:closed, :timeout}}, %State{name: name, rv: rv} = state) do
    Logger.info "Received Timeout: #{name} rv: #{rv}"
    {:noreply, start_request(state)}
  end

  @impl GenServer
  def handle_info(%HTTPoison.AsyncEnd{id: request_id},
                  %State{id: request_id, name: name, rv: rv} = state) do
    Logger.info "Received AsyncEnd: #{name} rv: #{rv}"
    {:noreply, start_request(state)}
  end

  # INTERNAL

  defp start_request(%State{request: request, name: name, rv: rv, client_opts: client_opts} = state) do
    query_params =
      request.query_params
      |> Map.put("watch", true)
      |> Map.put("resourceVersion", rv)
    request = %Kazan.Request{request | query_params: query_params}
    {:ok, id} = Kazan.run(request, [{:stream_to, self()} | client_opts])
    Logger.info "Started request: #{name} rv: #{rv}"
    %State{state | id: id, buffer: LineBuffer.new()}
  end

  defp process_lines(%State{name: name, send_to: send_to, rv: rv}, lines) do
    Logger.debug "Process lines: #{name}"
    Enum.reduce(lines, rv, fn(line, current_rv) ->
      {:ok, %{"type" => type, "object" => raw_object}} = Poison.decode(line)
      {:ok, model} = Kazan.Models.decode(raw_object)
      case {type, extract_rv(raw_object)} do
        {_, ^current_rv} ->
          Logger.warn "Duplicate message: #{name} type: #{type} rv: #{current_rv}"
          current_rv
        {_, new_rv} ->
          Logger.debug "Received message: #{name} type: #{type} rv: #{new_rv}"
          send(send_to, %WatchEvent{type: type, object: model})
          new_rv
      end
    end)
  end

  defp extract_rv(%{"metadata" => %{"resourceVersion" => rv}}), do: rv
  defp extract_rv(%{metadata: %{resource_version: rv}}), do: rv
end
