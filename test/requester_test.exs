defmodule RequeseterTest do
  use ExUnit.Case, async: true

  alias Kazan.Request

  describe "Request.create" do
    test "building a get request with no parameters" do
      {:ok, request} = Request.create(
        "listCoreV1PodForAllNamespaces", %{}
      )
      assert request.method == "get"
      assert request.path == "/api/v1/pods"
      assert request.query_params == %{}
      assert request.body == nil
    end

    test "building a GET request with path parameters" do
      {:ok, request} = Request.create(
        "listCoreV1NamespacedPod", %{"namespace" => "test"}
      )
      assert request.method == "get"
      assert request.path == "/api/v1/namespaces/test/pods"
      assert request.query_params == %{}
      assert request.body == nil
    end

    test "building a GET request with query parameters" do
      {:ok, request} = Request.create(
        "listCoreV1PodForAllNamespaces", %{"pretty" => "true"}
      )
      assert request.method == "get"
      assert request.path == "/api/v1/pods"
      assert request.query_params == %{"pretty" => "true"}
      assert request.body == nil
    end

    test "building a POST request with body parameters" do
      body_data = %{"target" => %{}}
      {:ok, request} = Request.create(
        "createCoreV1NamespacedBinding", 
        %{"namespace" => "test",
          "body" => body_data}
      )
      assert request.method == "post"
      assert request.path == "/api/v1/namespaces/test/bindings"
      assert request.query_params == %{}
      assert request.body == Poison.encode!(body_data)
    end

    test "request for unknown operation" do
      {:err, :unknown_op} = Request.create("blarga", %{})
    end

    test "request with missing required parameters" do
      {:err, {:missing_params, ["namespace"]}} = Request.create(
        "listCoreV1NamespacedPod", %{}
      )
    end
  end
end
