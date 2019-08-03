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
        api_version: %PropertyDesc{field: "apiVersion", type: "string"}
        a_string: %PropertyDesc{field: "a_string", type: "string"},
        an_int: %PropertyDesc{field: "an_int", type: "integer"},
      }
    }
  end
end

defmodule FooResourceList do
  use Kazan.Model
  Kazan.Model.list_of(Foo)
end
