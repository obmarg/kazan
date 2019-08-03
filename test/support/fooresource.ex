defmodule FooResource do
  use Kazan.Model
  alias Kazan.Models.{ModelDesc, PropertyDesc}

  alias Kazan.Models.Apimachinery.Meta.V1.ObjectMeta

  defstruct [:a_string, :an_int, :metadata, :kind, :api_version]

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

defmodule FooResourceList do
  use Kazan.Model
  alias Kazan.Models.{ModelDesc, PropertyDesc}

  alias Kazan.Models.Apimachinery.Meta.V1.ObjectMeta

  defstruct [:items, :metadata, :kind, :api_version]

  def model_desc() do
    %ModelDesc{
      module_name: __MODULE__,
      properties: %{
        metadata: %PropertyDesc{field: "metadata", type: nil, ref: ObjectMeta},
        kind: %PropertyDesc{field: "kind", type: "string"},
        api_version: %PropertyDesc{field: "apiVersion", type: "string"},
        items: %PropertyDesc{
          field: "items",
          type: "array",
          items: %PropertyDesc{type: nil, ref: FooResource}
        }
      }
    }
  end
end
