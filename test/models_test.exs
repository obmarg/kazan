defmodule KazanModelsTest do
  use ExUnit.Case
  alias Kazan.Models

  test "that we have some models" do
    # Not a particularly thorough test, but whatever:
    %Models.V1.AttachedVolume{
      device_path: "test",
      name: "test"
    }
  end

  describe "Models.decode" do
    test "that we can decode a simple model when we know it's kind" do
      {:ok, result} = Models.decode(
        %{"devicePath" => "test", "name" => "test"},
        Models.V1.AttachedVolume
      )
      assert result == %Models.V1.AttachedVolume{
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
      assert result == %Models.V1.OwnerReference{
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
      assert result == %Models.V1beta1.APIVersion{
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
        Models.V1beta1.Deployment
      )
      assert result == %Models.V1beta1.Deployment{
        metadata: nil,
        spec: nil,
        status: %Models.V1beta1.DeploymentStatus{
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
        Models.V1beta1.DeploymentList
      )
      assert result == %Models.V1beta1.DeploymentList{
        items: [
          %Models.V1beta1.Deployment{},
          %Models.V1beta1.Deployment{},
        ],
        metadata: nil
      }
    end

    test "that we can encode models with non-model $refs" do
      {:ok, result} = Models.decode(
        %{"startedAt" => "2016-02-29T12:30:30.120+00:00"},
        Models.V1.ContainerStateRunning
      )
      assert result
    end
  end

  describe "Model.encode" do
    test "that we can encode a simple model" do
      {:ok, result} = Models.encode(
        %Models.V1.AttachedVolume{
          device_path: "test",
          name: "test"
        }
      )
      assert result == %{"devicePath" => "test", "name" => "test"}
    end

    test "that we can encode nested models" do
      {:ok, result} = Models.encode(
        %Models.V1beta1.Deployment{
          metadata: nil,
          spec: nil,
          status: %Models.V1beta1.DeploymentStatus{
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
        %Models.V1beta1.DeploymentList{
          items: [
            %Models.V1beta1.Deployment{},
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
  end
end
