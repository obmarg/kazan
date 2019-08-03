defmodule FooResource do
  use Kazan.Model
  alias Kazan.Models.{ModelDesc, PropertyDesc}

  alias Kazan.Models.Apimachinery.Meta.V1.ObjectMeta

  # TODO: It could be nice if we had a way to remove some of this boilerplate?
  # In particular, metadata, kind & api_version shouldn't be _needed_
  defstruct [:a_string, :an_int, :metadata, :kind, :api_version]

  defmodel %{
    a_string: %PropertyDesc{field: "kind", type: "string"}
  }

  def model_desc() do
    %ModelDesc{
      module_name: __MODULE__,
      properties: %{
        metadata: %PropertyDesc{field: "metadata", type: nil, ref: ObjectMeta},
        kind: %PropertyDesc{field: "kind", type: "string"},
        a_string: %PropertyDesc{field: "a_string", type: "string"},
        an_int: %PropertyDesc{field: "an_int", type: "integer"},
        api_version: %PropertyDesc{field: "apiVersion", type: "string"}
      }
    }
  end
end
