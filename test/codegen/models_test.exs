defmodule KazanCodegenModelsTest do
  use ExUnit.Case

  alias Kazan.Codegen.Models

  describe "module_name" do
    test "returns nil when unknown name in safe mode" do
      assert Models.module_name("io.k8s.api.core.v1.nope") == nil
    end

    test "returns a module name when in unsafe mode" do
      mod_name = Models.module_name(
        "io.k8s.api.core.v1.something", unsafe: true
      )
      assert mod_name == Kazan.Apis.Core.V1.Something
    end

    test "returns actual core module names" do
      mod_name = Models.module_name("io.k8s.api.core.v1.Binding")
      assert mod_name == Kazan.Apis.Core.V1.Binding
    end
  end
end
