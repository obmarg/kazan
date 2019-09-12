defmodule K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          string: String.t()
        }
  defstruct [:string]

  field :string, 1, optional: true, type: :string
end
