defmodule KazanApiTests do
  use ExUnit.Case

  alias Kazan.Apis.{CoreV1, ExtensionsV1beta1}
  alias Kazan.Models.V1.{Namespace, ObjectMeta}

  test "request without params" do
    {:ok, res} = CoreV1.list_pod_for_all_namespaces()
    assert res.body == nil
    assert res.method == "get"
    assert res.path == "/api/v1/pods"
    assert res.query_params == %{}
  end

  test "request with option params" do
    {:ok, res} = CoreV1.list_pod_for_all_namespaces(pretty: true, timeout_seconds: 5)
    assert res.body == nil
    assert res.method == "get"
    assert res.path == "/api/v1/pods"
    assert res.query_params == %{"pretty" => true, "timeoutSeconds" => 5}
  end

  test "request with path params" do
    {:ok, res} = ExtensionsV1beta1.read_namespaced_network_policy(
      "test-namespace", "test-policy", pretty: true
    )
    assert res.body == nil
    assert res.method == "get"
    assert res.path == "/apis/extensions/v1beta1/namespaces/test-namespace/networkpolicies/test-policy"
    assert res.query_params == %{"pretty" => true}
  end

  test "request with body params" do
    {:ok, res} = CoreV1.create_namespace(
      %Namespace{
        metadata: %ObjectMeta{
          name: "test"
        }
      }
    )
    assert res.method == "post"
    assert res.path == "/api/v1/namespaces"
    assert res.query_params == %{}
    # TODO: More thorough checks of res.body would be good...
    assert res.body
  end

  test "a bang function" do
    res = CoreV1.list_pod_for_all_namespaces!()
    assert res.body == nil
    assert res.method == "get"
    assert res.path == "/api/v1/pods"
    assert res.query_params == %{}
  end
end
