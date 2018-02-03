defmodule KazanCodegenApisTest do
  use ExUnit.Case

  alias Kazan.Codegen.Apis
  alias Kazan.Codegen.Apis.ApiId

  describe "api_module" do
    test "returns nil when unknown name in safe mode" do
      assert Apis.api_module(
        %ApiId{group: "core", version: "whatever_i_want"}
      ) == nil
    end

    test "returns a module name when in unsafe mode" do
      mod_name = Apis.api_module(
        %ApiId{group: "Yep", version: "Something"}, unsafe: true
      )
      assert mod_name == Kazan.Apis.Yep.Something
    end
  end
end
