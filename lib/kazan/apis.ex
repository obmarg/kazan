defmodule Kazan.Apis do
  @moduledoc """
  Contains generated API modules as defined in the OAI specs.

  See Kazan.Codegen for the actual code generation details.
  """
  require Kazan.Codegen.Apis
  alias Kazan.Codegen

  Codegen.Apis.from_spec("kube_specs/swagger.json")
end
