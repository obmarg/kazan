defmodule Kazan.Codegen.Apis.Operation do
  @moduledoc false

  alias Kazan.Codegen.Apis.{ApiId, Parameter}
  alias Kazan.Codegen

  defstruct [
    :function_name, :api_module, :api_id, :operation_id,
    :parameters, :response_schema, :description,
    :path
  ]

  @type t :: %__MODULE__{
    function_name: :atom,
    api_module: :atom,
    api_id: ApiId.t,
    operation_id: String.t,
    parameters: list,
    response_schema: struct,
    description: String.t,
    path: String.t
  }

  @spec from_oai_desc(Map.t) :: t
  @doc """
  Creates an Operation from it's open API description.

  Note: This function creates atoms, so is currently unsafe to call on user
  supplied data. It should only be called at build time as part of kazan
  codegen.
  """
  def from_oai_desc(desc) do
    api_id = ApiId.from_oai_tag(desc["tag"])

    %__MODULE__{
      function_name: Codegen.Apis.function_name(
        desc["operationId"], desc["tag"], unsafe: true
      ),
      api_module: Codegen.Apis.api_module(api_id),
      api_id: api_id,
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
