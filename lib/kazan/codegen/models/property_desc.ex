defmodule Kazan.Codegen.Models.PropertyDesc do
  @moduledoc false
  import Kazan.Codegen.Models, only: [module_name: 1]

  defstruct [:type, :format, :description, :ref, :field, :items]

  @type t :: %{
    :type => String.t | nil,
    :format => String.t | nil,
    :description => String.t | nil,
    :ref => atom | nil,
    :field => String.t | nil,
    :items => t | nil
  }

  @doc """
  Builds a property from an open API property map.
  """
  @spec from_oai_desc(Map.t, String.t) :: t
  def from_oai_desc(map, field) do
    %__MODULE__{
      type: map["type"],
      format: map["format"],
      description: map["description"],
      field: field,
      ref: parse_ref(map["$ref"]),
      items: parse_items(map["items"])
    }
  end

  defp parse_ref(nil), do: nil
  defp parse_ref("#/definitions/" <> model_def), do: module_name(model_def)

  defp parse_items(nil), do: nil
  defp parse_items(map), do: from_oai_desc(map, nil)
end

