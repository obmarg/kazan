defmodule Kazan.Codegen.Models.ModelDesc do
  @moduledoc false
  import Kazan.Codegen.Models, only: [module_name: 1]
  alias Kazan.Codegen.Models.{ResourceId, PropertyDesc}

  defstruct [
    :id, :resource_ids, :module_name, :description, :required, :properties
  ]

  @type property_map :: %{atom: PropertyDesc.t}
  @type t :: %{
    id: String.t,
    resource_ids: [ResourceId],
    module_name: :atom,
    description: String.t,
    required: [:atom],
    properties: property_map,
  }

  @doc """
  Creates a ModelDesc from an OAI description.

  ### Params

  * `name` is the string name of the OAI model.
  * `map` is the map description of the OAI model.
  * `refs` is a map of $ref values that we should swap in if we encounter them
    in our properties.

  Note: This function creates atoms, so is currently unsafe to call on user
  supplied data. It should only be called at build time as part of kazan
  codegen.
  """
  @spec from_oai_desc({String.t, Map.t}, Map.t) :: t
  def from_oai_desc({name, map}, refs) do
    %__MODULE__{
      id: name,
      resource_ids: ResourceId.from_oai_desc(map),
      module_name: module_name(name),
      description: map["description"],
      required: Map.get(map, "required", []) |> Enum.map(&property_name/1),
      properties: for {name, desc} <- map["properties"], into: %{} do
                    {property_name(name),
                     PropertyDesc.from_oai_desc(desc, name, refs)}
                  end
    }
  end

  # Builds an atom property name from an OAI property name.
  @spec property_name(String.t) :: atom
  defp property_name(str) do
    str |> Macro.underscore |> String.to_atom
  end
end
