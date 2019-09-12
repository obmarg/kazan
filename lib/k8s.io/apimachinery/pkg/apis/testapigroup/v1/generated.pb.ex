defmodule K8s.Io.Apimachinery.Pkg.Apis.Testapigroup.V1.Carp do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          spec: K8s.Io.Apimachinery.Pkg.Apis.Testapigroup.V1.CarpSpec.t() | nil,
          status: K8s.Io.Apimachinery.Pkg.Apis.Testapigroup.V1.CarpStatus.t() | nil
        }
  defstruct [:metadata, :spec, :status]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :spec, 2, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Testapigroup.V1.CarpSpec
  field :status, 3, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Testapigroup.V1.CarpStatus
end

defmodule K8s.Io.Apimachinery.Pkg.Apis.Testapigroup.V1.CarpCondition do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          type: String.t(),
          status: String.t(),
          lastProbeTime: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time.t() | nil,
          lastTransitionTime: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time.t() | nil,
          reason: String.t(),
          message: String.t()
        }
  defstruct [:type, :status, :lastProbeTime, :lastTransitionTime, :reason, :message]

  field :type, 1, optional: true, type: :string
  field :status, 2, optional: true, type: :string
  field :lastProbeTime, 3, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time
  field :lastTransitionTime, 4, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time
  field :reason, 5, optional: true, type: :string
  field :message, 6, optional: true, type: :string
end

defmodule K8s.Io.Apimachinery.Pkg.Apis.Testapigroup.V1.CarpList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [K8s.Io.Apimachinery.Pkg.Apis.Testapigroup.V1.Carp.t()]
        }
  defstruct [:metadata, :items]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta
  field :items, 2, repeated: true, type: K8s.Io.Apimachinery.Pkg.Apis.Testapigroup.V1.Carp
end

defmodule K8s.Io.Apimachinery.Pkg.Apis.Testapigroup.V1.CarpSpec do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          restartPolicy: String.t(),
          terminationGracePeriodSeconds: integer,
          activeDeadlineSeconds: integer,
          nodeSelector: %{String.t() => String.t()},
          serviceAccountName: String.t(),
          serviceAccount: String.t(),
          nodeName: String.t(),
          hostNetwork: boolean,
          hostPID: boolean,
          hostIPC: boolean,
          hostname: String.t(),
          subdomain: String.t(),
          schedulername: String.t()
        }
  defstruct [
    :restartPolicy,
    :terminationGracePeriodSeconds,
    :activeDeadlineSeconds,
    :nodeSelector,
    :serviceAccountName,
    :serviceAccount,
    :nodeName,
    :hostNetwork,
    :hostPID,
    :hostIPC,
    :hostname,
    :subdomain,
    :schedulername
  ]

  field :restartPolicy, 3, optional: true, type: :string
  field :terminationGracePeriodSeconds, 4, optional: true, type: :int64
  field :activeDeadlineSeconds, 5, optional: true, type: :int64

  field :nodeSelector, 7,
    repeated: true,
    type: K8s.Io.Apimachinery.Pkg.Apis.Testapigroup.V1.CarpSpec.NodeSelectorEntry,
    map: true

  field :serviceAccountName, 8, optional: true, type: :string
  field :serviceAccount, 9, optional: true, type: :string
  field :nodeName, 10, optional: true, type: :string
  field :hostNetwork, 11, optional: true, type: :bool
  field :hostPID, 12, optional: true, type: :bool
  field :hostIPC, 13, optional: true, type: :bool
  field :hostname, 16, optional: true, type: :string
  field :subdomain, 17, optional: true, type: :string
  field :schedulername, 19, optional: true, type: :string
end

defmodule K8s.Io.Apimachinery.Pkg.Apis.Testapigroup.V1.CarpSpec.NodeSelectorEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto2

  @type t :: %__MODULE__{
          key: String.t(),
          value: String.t()
        }
  defstruct [:key, :value]

  field :key, 1, optional: true, type: :string
  field :value, 2, optional: true, type: :string
end

defmodule K8s.Io.Apimachinery.Pkg.Apis.Testapigroup.V1.CarpStatus do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          phase: String.t(),
          conditions: [K8s.Io.Apimachinery.Pkg.Apis.Testapigroup.V1.CarpCondition.t()],
          message: String.t(),
          reason: String.t(),
          hostIP: String.t(),
          carpIP: String.t(),
          startTime: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time.t() | nil
        }
  defstruct [:phase, :conditions, :message, :reason, :hostIP, :carpIP, :startTime]

  field :phase, 1, optional: true, type: :string

  field :conditions, 2,
    repeated: true,
    type: K8s.Io.Apimachinery.Pkg.Apis.Testapigroup.V1.CarpCondition

  field :message, 3, optional: true, type: :string
  field :reason, 4, optional: true, type: :string
  field :hostIP, 5, optional: true, type: :string
  field :carpIP, 6, optional: true, type: :string
  field :startTime, 7, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time
end
