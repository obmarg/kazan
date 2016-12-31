defmodule Kazan.Client do
  @moduledoc """
  Kazan.Client sends requests to a kubernetes server.

  These requests should be built using the functions in the `Kazan.Apis` module.
  """
  alias Kazan.{Request, Server}

  # TODO: Tests of this (somehow) would be good.
  # Mock API server?
  @doc """
  Makes a request against a kube server.

  The server should be set in the kazan config or provided in the options.

  ### Options

  * `server` - A `Kazan.Server` struct that defines which server we should send
    this request to. This will override any server provided in the Application
    config.
  """
  @spec run(Request.t, Keyword.t) :: {:ok, struct} | {:err, term}
  def run(request, options \\ []) do
    server = find_server(options)

    res = HTTPoison.request(
      method(request.method),
      server.url <> request.path,
      request.body || "",
      [],
      params: request.query_params
    )

    with {:ok, result} <- res,
         {:ok, body} <- check_status(result),
         {:ok, data} <- Poison.decode(body),
         {:ok, model} <- Kazan.Models.decode(data, request.response_schema),
         do: {:ok, model}
  end

  @doc """
  Like `run/2`, but raises on Error.  See `run/2` for more details.
  """
  @spec run!(Request.t, Keyword.t) :: struct | no_return
  def run!(request, options \\ []) do
    case run(request, options) do
      {:ok, result} -> result
      {:err, reason} -> raise Kazan.RemoteError, reason: reason
    end
  end

  # Figures out which server we should use.  In order of preference:
  # - A server specified in the keyword arguments
  # - A server specified in the kazan config
  @spec find_server(Keyword.t) :: Server.t
  defp find_server(options) do
    case Keyword.get(options, :server) do
      nil ->
        case Application.get_env(:kazan, :server) do
          nil -> raise "No server is configured"
          details -> struct(Server, details)
        end
      server -> server
    end
  end

  defp method("get"), do: :get
  defp method("post"), do: :post
  defp method("put"), do: :put
  defp method("delete"), do: :delete
  defp method("patch"), do: :patch

  @spec check_status(HTTPoison.Response.t) :: {:ok, String.t}
  defp check_status(%{status_code: 200, body: body}) do
    {:ok, body}
  end
  defp check_status(%{status_code: other, body: body}) do
    {:err, {:http_error, other, body}}
  end
end
