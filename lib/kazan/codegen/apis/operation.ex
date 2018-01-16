defmodule Kazan.Codegen.Apis.Operation do
  @moduledoc false

  alias Kazan.Codegen.Apis.Parameter
  alias Kazan.Codegen

  defstruct [
    :function_name, :api_name, :operation_id,
    :parameters, :response_schema, :description,
    :path
  ]

  @type t :: %__MODULE__{
    function_name: :atom,
    api_name: :atom,
    operation_id: String.t,
    parameters: list,
    response_schema: struct,
    description: String.t,
    path: String.t
  }

  @spec from_oai_desc(Map.t) :: t
  def from_oai_desc(desc) do
    %__MODULE__{
      function_name: Codegen.Apis.function_name(
        desc["operationId"], desc["tag"], unsafe: true
      ),
      api_name: Codegen.Apis.api_name(desc["tag"]),
      operation_id: desc["operationId"],
      parameters: Enum.map(desc["parameters"], &Parameter.from_oai_desc/1),
      response_schema: Codegen.Models.definition_ref_to_module_name(
        desc["responses"]["200"]["schema"]["$ref"]
      ),
      description: desc["description"],
      path: desc["path"]
    }
  end
end
