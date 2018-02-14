defmodule Kazan.Codegen.Models.PropertyDesc do
  @moduledoc false
  import Kazan.Codegen.Models, only: [definition_ref_to_module_name: 1]

  defstruct [:type, :format, :description, :ref, :field, :items]

  @type t :: %{
          :type => String.t() | nil,
          :format => String.t() | nil,
          :description => String.t() | nil,
          :ref => atom | nil,
          :field => String.t() | nil,
          :items => t | nil
        }

  @doc """
  Builds a property from an open API property map.

  ### Params

  * `map` is the map we are parsing our property from.
  * `field` is the field name in the original structure.
  * `refs` is a map of $ref values that we should swap in.

  If this property has a $ref that is not present in `refs` then we assume that
  it is a reference to another model.
  """
  @spec from_oai_desc(Map.t(), String.t(), Map.t()) :: t
  def from_oai_desc(map, field, refs) do
    ref = definition_ref_to_module_name(map["$ref"])

    map =
      if Map.has_key?(refs, ref) do
        map |> Map.merge(refs[ref]) |> Map.delete("$ref")
      else
        map
      end

    %__MODULE__{
      type: map["type"],
      format: map["format"],
      description: map["description"],
      field: field,
      ref: ref,
      items: parse_items(map["items"], refs)
    }
  end

  defp parse_items(nil, _), do: nil
  defp parse_items(map, refs), do: from_oai_desc(map, nil, refs)
end
