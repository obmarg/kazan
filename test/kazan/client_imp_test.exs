defmodule Kazan.Client.ImpTest do
  use ExUnit.Case

  alias Kazan.Apis.Core.V1, as: CoreV1

  setup do
    bypass = Bypass.open
    request = CoreV1.list_namespace!()
    server = %Kazan.Server{url: "http://localhost:#{bypass.port}"}
    {:ok, %{bypass: bypass, request: request, server: server}}
  end

  describe "Client.Imp.run" do
    import Kazan.Client.Imp, only: [run: 2]

    test "returns decoded data if application/json returned", context do
      %{request: request, bypass: bypass, server: server} = context

      Bypass.expect bypass, fn conn ->
        assert conn.method == "GET"
        assert conn.request_path == "/api/v1/namespaces"

        conn
        |> Plug.Conn.resp(200, namespace_response())
        |> Plug.Conn.put_resp_header("Content-Type", "application/json")
      end

      {:ok, data} = run(request, server: server)
      assert data
      assert length(data.items) == 1
    end

    test "returns raw data if non application/json is returned", context do
      %{request: request, bypass: bypass, server: server} = context

      Bypass.expect bypass, fn conn ->
        assert conn.method == "GET"
        assert conn.request_path == "/api/v1/namespaces"

        conn
        |> Plug.Conn.resp(200, "some text")
        |> Plug.Conn.put_resp_header("Content-Type", "text/plain")
      end

      {:ok, data} = run(request, server: server)
      assert "some text" == data
    end

    test "passes on query parameters if supplied", context do
      %{request: request, bypass: bypass, server: server} = context
      request = %{request | query_params: %{"pretty" => "true"}}

      Bypass.expect bypass, fn conn ->
        conn = Plug.Conn.fetch_query_params(conn)
        assert conn.query_params["pretty"] == "true"

        conn
        |> Plug.Conn.resp(200, namespace_response())
        |> Plug.Conn.put_resp_header("Content-Type", "application/json")
      end

      {:ok, _} = run(request, server: server)
    end

    test "returns error on non-200 status", context do
      %{request: request, bypass: bypass, server: server} = context

      Bypass.expect bypass, fn conn ->
        conn
        |> Plug.Conn.resp(500, namespace_response())
        |> Plug.Conn.put_resp_header("Content-Type", "application/json")
      end

      {:error, {:http_error, 500, _}} = run(request, server: server)
    end

    test "returns error if server down", context do
      %{request: request, bypass: bypass, server: server} = context

      Bypass.down(bypass)

      {:error, _} = run(request, server: server)
    end
  end

  describe "Client.Imp.run!" do
    import Kazan.Client.Imp, only: [run!: 2]

    test "returns decoded data if everything is good", context do
      %{request: request, bypass: bypass, server: server} = context

      Bypass.expect bypass, fn conn ->
        assert conn.method == "GET"
        assert conn.request_path == "/api/v1/namespaces"

        conn
        |> Plug.Conn.resp(200, namespace_response())
        |> Plug.Conn.put_resp_header("Content-Type", "application/json")
      end

      data = run!(request, server: server)
      assert data
      assert length(data.items) == 1
    end

    test "raises if anything fails", context do
      %{request: request, bypass: bypass, server: server} = context

      Bypass.down(bypass)

      assert_raise Kazan.RemoteError, fn ->
        run!(request, server: server)
      end
    end
  end

  # An actual JSON response taken from a kube server.
  @namespace_list """
  {
    "kind": "NamespaceList",
    "apiVersion": "v1",
    "metadata": {
      "selfLink": "/api/v1/namespaces",
      "resourceVersion": "1443347"
    },
    "items": [
      {
        "metadata": {
          "name": "default",
          "selfLink": "/api/v1/namespacesdefault",
          "uid": "4c94da2d-c7b7-11e6-9da6-06fd52d1026e",
          "resourceVersion": "2465",
          "creationTimestamp": "2016-12-21T19:54:35Z"
        },
        "spec": {
          "finalizers": [
            "kubernetes"
          ]
        },
        "status": {
          "phase": "Active"
        }
      }
    ]
  }
  """

  defp namespace_response() do
    @namespace_list
  end

  # TODO: Testing SSL stuff will require an actual server for testing...
end
