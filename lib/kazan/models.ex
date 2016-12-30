defmodule Kazan.Models do
  @moduledoc """
  Contains generated structs for all Kube models as defined in the OAI specs.

  See Kazan.Codegen for the actual code generation details.
  """
  require Kazan.Codegen.Models
  alias Kazan.Codegen

  Codegen.Models.from_spec("kube_specs/swagger.json")
end
