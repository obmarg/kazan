defmodule KazanIntegrationTest do
  use ExUnit.Case, async: false

  alias Kazan.Apis.Core.V1, as: CoreV1
  alias Kazan.Apis.Extensions.V1beta1, as: ExtensionsV1beta1
  alias Kazan.Apis.Rbacauthorization.V1beta1, as: RbacauthorizationV1beta1
  alias Kazan.Apis.Core.V1.{Pod, PodStatus, PodSpec, Container}
  alias Kazan.Models.Apimachinery.Meta.V1.{
    WatchEvent,
    ObjectMeta,
    DeleteOptions,
  }

  @moduletag :integration

  setup_all do
    kubeconfig = System.get_env("KUBECONFIG")
    unless kubeconfig do
      raise "KUBECONFIG environment variable must be set to run integration tests"
    end
    server = Kazan.Server.from_kubeconfig(kubeconfig)
    on_exit(nil, fn ->
      pod_names = ["kazan-test", "watch-test-pod", "read-logs-test"]
      Enum.each(pod_names, fn pod_name ->
        try do
          delete_pod(pod_name, server: server)
        rescue
          Kazan.RemoteError -> :ok
        end
      end)
    end)
    {:ok, %{server: server}}
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
    created_pod = create_pod("kazan-test", server: server)

    read_pod =
      CoreV1.read_namespaced_pod!(@namespace, "kazan-test")
      |> Kazan.run!(server: server)

    assert read_pod.spec == %{created_pod.spec | node_name: read_pod.spec.node_name}

    patched_pod = patch_pod("kazan-test", server: server)

    assert patched_pod.spec == %{read_pod.spec | active_deadline_seconds: 1}

    read_pod =
      CoreV1.read_namespaced_pod!(@namespace, "kazan-test")
      |> Kazan.run!(server: server)

    assert read_pod == patched_pod

    delete_pod("kazan-test", server: server)
  end

  test "RBAC Authorization V1 Beta 1 API", %{server: server} do
    cluster_roles =
      RbacauthorizationV1beta1.list_cluster_role!()
      |> Kazan.run!(server: server)

    assert cluster_roles.kind == "ClusterRoleList"
    assert cluster_roles.items == []
  end

  test "Can listen for namespace changes", %{server: server} do

    pod_name = "watch-test-pod"
    CoreV1.list_namespaced_pod!(@namespace, timeout_seconds: 1)
    |> Kazan.Watcher.start_link(server: server, recv_timeout: 10500)

    create_pod(pod_name, server: server)

    :timer.sleep(3000)
    assert_receive(%WatchEvent{object: %Pod{ metadata: %ObjectMeta{name: ^pod_name}} , type: "ADDED"})
    assert_receive(%WatchEvent{object: %Pod{ metadata: %ObjectMeta{name: ^pod_name},
      status: %PodStatus{phase: "Pending", container_statuses: nil}} , type: "MODIFIED"})
    assert_receive(%WatchEvent{object: %Pod{ metadata: %ObjectMeta{name: ^pod_name},
      status: %PodStatus{phase: "Pending", container_statuses: [_|_]}} , type: "MODIFIED"})

    patch_pod(pod_name, server: server)


    :timer.sleep(3000)
    assert_receive(%WatchEvent{object: %Pod{metadata: %ObjectMeta{name: ^pod_name},
                                            spec: %PodSpec{active_deadline_seconds: 1}},
                                type: "MODIFIED"})

    delete_pod(pod_name, server: server)

    assert_receive(%WatchEvent{object: %Pod{metadata: %ObjectMeta{name: ^pod_name}}, type: "DELETED"}, 3000)

  end

  test "Can read pod logs", %{server: server} do
    CoreV1.create_namespaced_pod!(
     %Pod{
       metadata: %ObjectMeta{name: "read-logs-test"},
       spec: %PodSpec{
         containers: [
           %Container{
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
    %Pod{status: %PodStatus{phase: phase}} = CoreV1.read_namespaced_pod_status!(@namespace, pod_name)
    |> Kazan.run!(server: server)
    if phase != "Running" do
      :timer.sleep(1000)
      wait_for_pod_to_run(pod_name, retries - 1, server: server)
    end
  end

  defp create_pod(pod_name, opts) do
    CoreV1.create_namespaced_pod!(
      %Pod{
        metadata: %ObjectMeta{name: pod_name},
        spec: %PodSpec{
          containers: [
            %Container{
              args: [],
              image: "obmarg/health-proxy",
              name: "main-process",
            }
          ]
        }
      },
      @namespace
    )
    |> Kazan.run!(opts)
  end

  defp patch_pod(pod_name, opts) do
    CoreV1.patch_namespaced_pod!(
      %Pod{
        metadata: %ObjectMeta{name: pod_name},
        spec: %PodSpec{
          active_deadline_seconds: 1
        }
      },
      @namespace,
      pod_name
    ) |> Kazan.run!(opts)
  end

  defp delete_pod(pod_name, opts) do
    CoreV1.delete_namespaced_pod!(
      %DeleteOptions{}, @namespace, pod_name
    )
    |> Kazan.run!(opts)
  end
end
