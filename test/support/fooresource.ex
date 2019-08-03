defmodule FooResource do
  use Kazan.Model
  alias Kazan.Models.{ModelDesc, PropertyDesc}

  alias Kazan.Models.Apimachinery.Meta.V1.ObjectMeta

  defmodel([:a_string, :an_int])

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
