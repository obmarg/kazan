defmodule RequestTest do
  use ExUnit.Case, async: true

  alias Kazan.Request
  alias Kazan.Apis.Core.V1, as: CoreV1
  alias Kazan.Models.Apimachinery.Meta.V1.ObjectMeta

  describe "Request.create" do
    test "building a get request with no parameters" do
      {:ok, request} = Request.create(
        "listCoreV1PodForAllNamespaces", %{}
      )
      assert request.method == "get"
      assert request.path == "/api/v1/pods"
      assert request.query_params == %{}
      assert request.body == nil
      assert request.content_type == nil
    end

    test "building a GET request with path parameters" do
      {:ok, request} = Request.create(
        "listCoreV1NamespacedPod", %{"namespace" => "test"}
      )
      assert request.method == "get"
      assert request.path == "/api/v1/namespaces/test/pods"
      assert request.query_params == %{}
      assert request.body == nil
      assert request.content_type == nil
    end

    test "building a GET request with query parameters" do
      {:ok, request} = Request.create(
        "listCoreV1PodForAllNamespaces", %{"pretty" => "true"}
      )
      assert request.method == "get"
      assert request.path == "/api/v1/pods"
      assert request.query_params == %{"pretty" => "true"}
      assert request.body == nil
      assert request.content_type == nil
    end

    test "building a POST request" do
      body_data = %CoreV1.Binding{target: %CoreV1.ObjectReference{}}
      {:ok, request} = Request.create(
        "createCoreV1NamespacedBinding",
        %{"namespace" => "test",
          "body" => body_data}
      )
      assert request.method == "post"
      assert request.path == "/api/v1/namespaces/test/bindings"
      assert request.query_params == %{}
      assert request.body == Poison.encode!(%{"target" => %{}})
      assert request.content_type == "application/json"
    end

    test "building a PATCH request" do
      body_data = %CoreV1.Namespace{
        metadata: %ObjectMeta{name: "test2"}
      }
      {:ok, request} = Request.create(
        "patchCoreV1Namespace",
        %{"name" => "test",
          "body" => body_data}
      )
      assert request.method == "patch"
      assert request.path == "/api/v1/namespaces/test"
      assert request.query_params == %{}
      assert request.body == Poison.encode!(
        %{"metadata" => %{"name" => "test2"}}
      )
      assert request.content_type == "application/merge-patch+json"
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
