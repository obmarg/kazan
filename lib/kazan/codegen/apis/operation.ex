defmodule Kazan.Codegen.Apis.Operation do
  @moduledoc false

  import Kazan.Codegen.Apis, only: [api_name: 1, function_name: 2]
  alias Kazan.Codegen.Apis.Parameter

  import Kazan.Codegen.Models, only: [parse_definition_ref: 1]

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
      function_name: function_name(desc["operationId"], desc["tag"]),
      api_name: api_name(desc["tag"]),
      operation_id: desc["operationId"],
      parameters: Enum.map(desc["parameters"], &Parameter.from_oai_desc/1),
      response_schema: parse_definition_ref(
        desc["responses"]["200"]["schema"]["$ref"]
      ),
      description: desc["description"],
      path: desc["path"]
    }
  end
end
