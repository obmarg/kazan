defmodule Kazan.Client do
  @moduledoc """
  Kazan.Client sends requests to a kubernetes server.

  These requests should be built using the functions in the `Kazan.Apis` module.

  DEPRECATED: This module will become private API and/or removed in the
  future. Use `run` in the `Kazan` module instead.
  """
  alias Kazan.{Request, Server}

  @type run_result :: {:ok, struct} | {:error, term}

  @deprecated "Use Kazan.run instead"
  @spec run(Request.t, Keyword.t) :: run_result
  def run(request, options \\ []) do
    server = find_server(options)

    headers = [{"Accept", "application/json"}]
    headers = headers ++ case request.content_type do
                           nil -> []
                           type -> [{"Content-Type", type}]
                         end

    headers = headers ++ case server.auth do
      %Server.TokenAuth{token: token} -> [{"Authorization", "Bearer #{token}"}]
      _ -> []
    end

    res = HTTPoison.request(
      method(request.method),
      server.url <> request.path,
      request.body || "",
      headers,
      params: request.query_params,
      ssl: ssl_options(server)
    )

    with {:ok, result} <- res,
         {:ok, body} <- check_status(result),
         {:ok, data} <- Poison.decode(body),
         {:ok, model} <- Kazan.Models.decode(data, request.response_schema),
         do: {:ok, model}
  end

  @deprecated "Use Kazan.run! instead"
  @spec run!(Request.t, Keyword.t) :: struct | no_return
  def run!(request, options \\ []) do
    case run(request, options) do
      {:ok, result} -> result
      {:error, reason} -> raise Kazan.RemoteError, reason: reason
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
          nil ->
            raise "No server is configured"
          {:kubeconfig, filename} ->
            Server.from_kubeconfig(filename)
          {:kubeconfig, filename, opts} ->
            Server.from_kubeconfig(filename, opts)
          :in_cluster ->
            Server.in_cluster
          details ->
            struct(Server, details)
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
  defp check_status(%{status_code: code, body: body}) when code in 200..299 do
    {:ok, body}
  end
  defp check_status(%{status_code: other, body: body}) do
    data =
      case Poison.decode(body) do
        {:ok, data} -> data
        _ -> body
      end
    {:error, {:http_error, other, data}}
  end

  @spec ssl_options(Server.t) :: Keyword.t
  defp ssl_options(server) do
    auth_options = ssl_auth_options(server.auth)
    verify_options = case server.insecure_skip_tls_verify do
      true -> [verify: :verify_none]
      _ -> []
    end
    ca_options = case server.ca_cert do
      nil -> []
      cert -> [cacerts: [cert]]
    end
    auth_options ++ verify_options ++ ca_options
  end

  defp ssl_auth_options(%Server.CertificateAuth{certificate: cert, key: key}) do
    [cert: cert, key: key]
  end
  defp ssl_auth_options(_), do: []
end
