defmodule FooResource do
  use Kazan.Model

  defmodel "Foo", "example.com", "v1" do
    property :a_string, "a_string", :string
    property :an_int, "an_int", :integer
  end
end

defmodule FooResourceList do
  use Kazan.Model

  defmodellist "FooList", "example.com", "v1", FooResource
end
