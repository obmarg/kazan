defmodule K8s.Io.Api.Coordination.V1beta1.Lease do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          spec: K8s.Io.Api.Coordination.V1beta1.LeaseSpec.t() | nil
        }
  defstruct [:metadata, :spec]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :spec, 2, optional: true, type: K8s.Io.Api.Coordination.V1beta1.LeaseSpec
end

defmodule K8s.Io.Api.Coordination.V1beta1.LeaseList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [K8s.Io.Api.Coordination.V1beta1.Lease.t()]
        }
  defstruct [:metadata, :items]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta
  field :items, 2, repeated: true, type: K8s.Io.Api.Coordination.V1beta1.Lease
end

defmodule K8s.Io.Api.Coordination.V1beta1.LeaseSpec do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          holderIdentity: String.t(),
          leaseDurationSeconds: integer,
          acquireTime: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.MicroTime.t() | nil,
          renewTime: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.MicroTime.t() | nil,
          leaseTransitions: integer
        }
  defstruct [:holderIdentity, :leaseDurationSeconds, :acquireTime, :renewTime, :leaseTransitions]

  field :holderIdentity, 1, optional: true, type: :string
  field :leaseDurationSeconds, 2, optional: true, type: :int32
  field :acquireTime, 3, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.MicroTime
  field :renewTime, 4, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.MicroTime
  field :leaseTransitions, 5, optional: true, type: :int32
end
