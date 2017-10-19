defmodule KazanCodegenApisTest do
  use ExUnit.Case

  alias Kazan.Codegen.Apis

  describe "api_name" do
    test "returns nil when unknown name in safe mode" do
      assert Apis.api_name("nope") == nil
    end

    test "returns a module name when in unsafe mode" do
      mod_name = Apis.api_name("yep", unsafe: true)
      assert mod_name == Kazan.Apis.Yep
    end
  end
end
