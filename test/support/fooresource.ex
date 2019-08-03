defmodule FooResource do
  use Kazan.Model
  alias Kazan.Models.{ModelDesc, PropertyDesc}

  alias Kazan.Models.Apimachinery.Meta.V1.ObjectMeta

  defmodel do
    property :a_string, "a_string", :string
    property :an_int, "an_int", :int
  end

  defmodeldesc(%{
    a_string: %PropertyDesc{field: "a_string", type: "string"},
    an_int: %PropertyDesc{field: "an_int", type: "integer"}
  })
end

defmodule FooResourceList do
  use Kazan.Model

  # TODO: Add formatter rule for this Guy
  defmodellist(FooResource)
end
