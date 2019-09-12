defmodule K8s.Io.Apimachinery.Pkg.Util.Intstr.IntOrString do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          type: integer,
          intVal: integer,
          strVal: String.t()
        }
  defstruct [:type, :intVal, :strVal]

  field :type, 1, optional: true, type: :int64
  field :intVal, 2, optional: true, type: :int32
  field :strVal, 3, optional: true, type: :string
end
