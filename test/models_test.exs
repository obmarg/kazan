defmodule KazanModelsTest do
  use ExUnit.Case
  
  alias Kazan.Models
  alias Kazan.Models.Io.K8s.Kubernetes.Pkg.Api.V1
  alias Kazan.Models.Io.K8s.Kubernetes.Pkg.Apis.Extensions.V1beta1
  alias Kazan.Models.Io.K8s.Apimachinery.Pkg.Apis.Meta.V1.OwnerReference

  test "that we have some models" do
    # Not a particularly thorough test, but whatever:
    %V1.AttachedVolume{
      device_path: "test",
      name: "test"
    }
  end

  describe "Models.decode" do
    test "that we can decode a simple model when we know it's kind" do
      {:ok, result} = Models.decode(
        %{"devicePath" => "test", "name" => "test"},
        V1.AttachedVolume
      )
      assert result == %V1.AttachedVolume{
        device_path: "test",
        name: "test"
      }
    end

    test "that we can decode a model that contains a core kind" do
      {:ok, result} = Models.decode(
        %{"kind" => "OwnerReference",
          "apiVersion" => "v1",
          "controller" => false,
          "name" => "test",
          "uid" => "test"}
      )
      assert result == %OwnerReference{
        kind: "OwnerReference",
        api_version: "v1",
        controller: false,
        name: "test",
        uid: "test"
      }
    end

    test "that we can decode a model that contains a v1beta1 kind" do
      {:ok, result} = Models.decode(
        %{
          "kind" => "APIVersion",
          "apiVersion" => "extensions/v1beta1",
          "name" => "a name"
        }
      )
      assert result == %V1beta1.APIVersion{
        name: "a name"
      }
    end

    test "that we can decode nested models" do
      {:ok, result} = Models.decode(
        %{
          "status" => %{
            "availableReplicas" => 1,
            "conditions" => [],
            "observedGeneration" => 1,
            "replicas" => 1,
            "unavailableReplicas" => 0,
            "updatedReplicas" => 0
          }
        },
        V1beta1.Deployment
      )
      assert result == %V1beta1.Deployment{
        metadata: nil,
        spec: nil,
        status: %V1beta1.DeploymentStatus{
          available_replicas: 1,
          conditions: [],
          observed_generation: 1,
          replicas: 1,
          unavailable_replicas: 0,
          updated_replicas: 0
        }
      }
    end

    test "that we can decode arrays" do
      {:ok, result} = Models.decode(
        %{
          "items" => [
            %{"status" => nil}, %{"status" => nil}
          ],
        },
        V1beta1.DeploymentList
      )
      assert result == %V1beta1.DeploymentList{
        items: [
          %V1beta1.Deployment{},
          %V1beta1.Deployment{},
        ],
        metadata: nil
      }
    end

    test "that we can encode models with non-model $refs" do
      {:ok, result} = Models.decode(
        %{"startedAt" => "2016-02-29T12:30:30.120+00:00"},
        V1.ContainerStateRunning
      )
      assert result
    end
  end

  describe "Model.encode" do
    test "that we can encode a simple model" do
      {:ok, result} = Models.encode(
        %V1.AttachedVolume{
          device_path: "test",
          name: "test"
        }
      )
      assert result == %{"devicePath" => "test", "name" => "test"}
    end

    test "that we can encode nested models" do
      {:ok, result} = Models.encode(
        %V1beta1.Deployment{
          metadata: nil,
          spec: nil,
          status: %V1beta1.DeploymentStatus{
            available_replicas: 1,
            conditions: [],
            observed_generation: 1,
            replicas: 1,
            unavailable_replicas: 0,
            updated_replicas: 0
          }
        }
      )
      assert result == %{
        "status" => %{
          "availableReplicas" => 1,
          "conditions" => [],
          "observedGeneration" => 1,
          "replicas" => 1,
          "unavailableReplicas" => 0,
          "updatedReplicas" => 0
        }
      }
    end

    test "that we can encode arrays" do
      {:ok, result} = Models.encode(
        %V1beta1.DeploymentList{
          items: [
            %V1beta1.Deployment{},
          ],
          metadata: nil
        }
      )
      assert result == %{
        "items" => [
          %{},
        ],
      }
    end

    test "that nils are removed from nested models" do
      {:ok, result} = Models.encode(
        %V1.Pod{
          spec: %V1.PodSpec{
            restart_policy: "Never"
          }
        }
      )
      assert result == %{
        "spec" => %{"restartPolicy" => "Never"}
      }
    end
  end
end
