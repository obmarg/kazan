defmodule K8s.Io.Apimachinery.Pkg.Runtime.RawExtension do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          raw: binary
        }
  defstruct [:raw]

  field :raw, 1, optional: true, type: :bytes
end

defmodule K8s.Io.Apimachinery.Pkg.Runtime.TypeMeta do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          apiVersion: String.t(),
          kind: String.t()
        }
  defstruct [:apiVersion, :kind]

  field :apiVersion, 1, optional: true, type: :string
  field :kind, 2, optional: true, type: :string
end

defmodule K8s.Io.Apimachinery.Pkg.Runtime.Unknown do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          typeMeta: K8s.Io.Apimachinery.Pkg.Runtime.TypeMeta.t() | nil,
          raw: binary,
          contentEncoding: String.t(),
          contentType: String.t()
        }
  defstruct [:typeMeta, :raw, :contentEncoding, :contentType]

  field :typeMeta, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Runtime.TypeMeta
  field :raw, 2, optional: true, type: :bytes
  field :contentEncoding, 3, optional: true, type: :string
  field :contentType, 4, optional: true, type: :string
end
