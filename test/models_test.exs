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
end
