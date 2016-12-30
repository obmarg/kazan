defmodule Kazan.Codegen.Models.ModelDesc do
  @moduledoc false
  import Kazan.Codegen.Models, only: [module_name: 1, property_name: 1]
  alias Kazan.Codegen.Models.PropertyDesc

  defstruct [:id, :module_name, :description, :required, :properties]

  @type property_map :: %{atom: PropertyDesc.t}
  @type t :: %{
    id: String.t,
    module_name: :atom,
    description: String.t,
    required: [:atom],
    properties: property_map
  }


  @spec from_oai_desc({String.t, Map.t}) :: t
  def from_oai_desc({name, map}) do
    %__MODULE__{
      id: name,
      module_name: module_name(name),
      description: map["description"],
      required: Map.get(map, "required", []) |> Enum.map(&property_name/1),
      properties: for {name, desc} <- map["properties"], into: %{} do
                    {property_name(name),
                     PropertyDesc.from_oai_desc(desc, name)}
                  end
    }
  end
end

