defmodule KazanIntegrationTest do
  use ExUnit.Case, async: true

  alias Kazan.Apis.Core.V1, as: CoreV1
  alias Kazan.Apis.Extensions.V1beta1, as: ExtensionsV1beta1
  alias Kazan.Apis.Rbacauthorization.V1beta1, as: RbacauthorizationV1beta1
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
      |> Kazan.run!(server: server)

    # Check that there's a default namespace.
    assert Enum.find(namespace_list.items, fn (namespace) ->
      namespace.metadata.name == @namespace
    end)
  end

  test "can list pods on an actual server", %{server: server} do
    CoreV1.list_namespaced_pod!(@namespace)
    |> Kazan.run!(server: server)
  end

  test "can list deployments on an actual server", %{server: server} do
    ExtensionsV1beta1.list_namespaced_deployment!(@namespace)
    |> Kazan.run!(server: server)
  end

  test "can create, patch and delete a pod", %{server: server} do
    created_pod =
      CoreV1.create_namespaced_pod!(
        %CoreV1.Pod{
          metadata: %ObjectMeta{name: "kazan-test"},
          spec: %CoreV1.PodSpec{
            containers: [
              %CoreV1.Container{
                args: [],
                image: "obmarg/health-proxy",
                name: "main-process",
              }
            ]
          }
        },
        @namespace
      )
      |> Kazan.run!(server: server)

    read_pod =
      CoreV1.read_namespaced_pod!(@namespace, "kazan-test")
      |> Kazan.run!(server: server)

    assert read_pod.spec == %{created_pod.spec | node_name: read_pod.spec.node_name}

    patched_pod = CoreV1.patch_namespaced_pod!(
      %CoreV1.Pod{
        metadata: %ObjectMeta{name: "kazan-test"},
        spec: %CoreV1.PodSpec{
          active_deadline_seconds: 5
        }
      },
      @namespace,
      "kazan-test"
    ) |> Kazan.run!(server: server)

    assert patched_pod.spec == %{read_pod.spec | active_deadline_seconds: 5}

    read_pod =
      CoreV1.read_namespaced_pod!(@namespace, "kazan-test")
      |> Kazan.run!(server: server)

    assert read_pod == patched_pod

    CoreV1.delete_namespaced_pod!(
      %DeleteOptions{}, @namespace, "kazan-test"
    )
    |> Kazan.run!(server: server)
  end

  test "RBAC Authorization V1 Beta 1 API", %{server: server} do
    cluster_roles =
      RbacauthorizationV1beta1.list_cluster_role!()
      |> Kazan.run!(server: server)

    assert cluster_roles.kind == "ClusterRoleList"
    assert cluster_roles.items == []
  end

  test "Can read pod logs", %{server: server} do
    on_exit fn ->
      CoreV1.delete_namespaced_pod!(%DeleteOptions{}, @namespace, "read-logs-test")
      |> Kazan.run!(server: server)
    end

    CoreV1.create_namespaced_pod!(
     %CoreV1.Pod{
       metadata: %ObjectMeta{name: "read-logs-test"},
       spec: %CoreV1.PodSpec{
         containers: [
           %CoreV1.Container{
             args: [],
             image: "alpine",
             command: ["sh", "-c", "echo hello"],
             name: "main-process"
           }
         ]
       }
     },
     @namespace
    )
    |> Kazan.run!(server: server)

    wait_for_pod_to_run("read-logs-test", 10, server: server)

    log_lines =
     CoreV1.read_namespaced_pod_log!(@namespace, "read-logs-test")
     |> Kazan.run!(server: server)

    assert log_lines == "hello\n"
  end

  defp wait_for_pod_to_run(_pod_name, 0, _) do
    flunk("Timed out waiting for pod to start")
  end

  defp wait_for_pod_to_run(pod_name, retries, [server: server]) do
    %CoreV1.Pod{status: %CoreV1.PodStatus{phase: phase}} = CoreV1.read_namespaced_pod_status!(@namespace, pod_name)
    |> Kazan.run!(server: server)
    if phase != "Running" do
      :timer.sleep(1000)
      wait_for_pod_to_run(pod_name, retries - 1, server: server)
    end
  end
end
