defmodule K8s.Io.Apimachinery.Pkg.Apis.Meta.V1beta1.PartialObjectMetadataList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.PartialObjectMetadata.t()]
        }
  defstruct [:metadata, :items]

  field :metadata, 2, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta

  field :items, 1,
    repeated: true,
    type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.PartialObjectMetadata
end
