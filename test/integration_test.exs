defmodule KazanIntegrationTest do
  use ExUnit.Case, async: true

  alias Kazan.Apis.Core.V1, as: CoreV1
  alias Kazan.Apis.Extensions.V1beta1, as: ExtensionsV1beta1
  alias Kazan.Apis.Rbacauthorization.V1beta1, as: RbacauthorizationV1beta1
  alias Kazan.Models.Core.V1
  alias Kazan.Models.Apimachinery.Meta.V1.{
    ObjectMeta,
    DeleteOptions,
  }

  @moduletag :integration

  setup_all do
    kubeconfig = System.get_env("KUBECONFIG")
    unless kubeconfig do
      raise "KUBECONFIG environment variable must be set to run integration tests"
    end
    {:ok, %{server: Kazan.Server.from_kubeconfig(kubeconfig)}}
  end

  @namespace "default"

  test "can list namespaces on an actual server", %{server: server} do
    namespace_list =
      CoreV1.list_namespace!
      |> Kazan.Client.run!(server: server)

    # Check that there's a default namespace.
    assert Enum.find(namespace_list.items, fn (namespace) ->
      namespace.metadata.name == @namespace
    end)
  end

  test "can list pods on an actual server", %{server: server} do
    CoreV1.list_namespaced_pod!(@namespace)
    |> Kazan.Client.run!(server: server)
  end

  test "can list deployments on an actual server", %{server: server} do
    ExtensionsV1beta1.list_namespaced_deployment!(@namespace)
    |> Kazan.Client.run!(server: server)
  end

  test "can create, patch and delete a pod", %{server: server} do
    created_pod =
      CoreV1.create_namespaced_pod!(
        %V1.Pod{
          metadata: %ObjectMeta{name: "kazan-test"},
          spec: %V1.PodSpec{
            containers: [
              %V1.Container{
                args: [],
                image: "obmarg/health-proxy",
                name: "main-process",
              }
            ]
          }
        },
        @namespace
      )
      |> Kazan.Client.run!(server: server)

    read_pod =
      CoreV1.read_namespaced_pod!(@namespace, "kazan-test")
      |> Kazan.Client.run!(server: server)

    assert read_pod.spec == %{created_pod.spec | node_name: read_pod.spec.node_name}

    patched_pod = CoreV1.patch_namespaced_pod!(
      %V1.Pod{
        metadata: %ObjectMeta{name: "kazan-test"},
        spec: %V1.PodSpec{
          active_deadline_seconds: 5
        }
      },
      @namespace,
      "kazan-test"
    ) |> Kazan.Client.run!(server: server)

    assert patched_pod.spec == %{read_pod.spec | active_deadline_seconds: 5}

    read_pod =
      CoreV1.read_namespaced_pod!(@namespace, "kazan-test")
      |> Kazan.Client.run!(server: server)

    assert read_pod == patched_pod

    CoreV1.delete_namespaced_pod!(
      %DeleteOptions{}, @namespace, "kazan-test"
    )
    |> Kazan.Client.run!(server: server)
  end

  test "RBAC Authorization V1 Beta 1 API", %{server: server} do
    cluster_roles =
      RbacauthorizationV1beta1.list_cluster_role!()
      |> Kazan.Client.run!(server: server)

    assert cluster_roles.kind == "ClusterRoleList"
    assert cluster_roles.items == []
  end
end
