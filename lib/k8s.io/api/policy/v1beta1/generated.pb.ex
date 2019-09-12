defmodule K8s.Io.Api.Policy.V1beta1.AllowedCSIDriver do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          name: String.t()
        }
  defstruct [:name]

  field :name, 1, optional: true, type: :string
end

defmodule K8s.Io.Api.Policy.V1beta1.AllowedFlexVolume do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          driver: String.t()
        }
  defstruct [:driver]

  field :driver, 1, optional: true, type: :string
end

defmodule K8s.Io.Api.Policy.V1beta1.AllowedHostPath do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          pathPrefix: String.t(),
          readOnly: boolean
        }
  defstruct [:pathPrefix, :readOnly]

  field :pathPrefix, 1, optional: true, type: :string
  field :readOnly, 2, optional: true, type: :bool
end

defmodule K8s.Io.Api.Policy.V1beta1.Eviction do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          deleteOptions: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.DeleteOptions.t() | nil
        }
  defstruct [:metadata, :deleteOptions]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta

  field :deleteOptions, 2,
    optional: true,
    type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.DeleteOptions
end

defmodule K8s.Io.Api.Policy.V1beta1.FSGroupStrategyOptions do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          rule: String.t(),
          ranges: [K8s.Io.Api.Policy.V1beta1.IDRange.t()]
        }
  defstruct [:rule, :ranges]

  field :rule, 1, optional: true, type: :string
  field :ranges, 2, repeated: true, type: K8s.Io.Api.Policy.V1beta1.IDRange
end

defmodule K8s.Io.Api.Policy.V1beta1.HostPortRange do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          min: integer,
          max: integer
        }
  defstruct [:min, :max]

  field :min, 1, optional: true, type: :int32
  field :max, 2, optional: true, type: :int32
end

defmodule K8s.Io.Api.Policy.V1beta1.IDRange do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          min: integer,
          max: integer
        }
  defstruct [:min, :max]

  field :min, 1, optional: true, type: :int64
  field :max, 2, optional: true, type: :int64
end

defmodule K8s.Io.Api.Policy.V1beta1.PodDisruptionBudget do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          spec: K8s.Io.Api.Policy.V1beta1.PodDisruptionBudgetSpec.t() | nil,
          status: K8s.Io.Api.Policy.V1beta1.PodDisruptionBudgetStatus.t() | nil
        }
  defstruct [:metadata, :spec, :status]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :spec, 2, optional: true, type: K8s.Io.Api.Policy.V1beta1.PodDisruptionBudgetSpec
  field :status, 3, optional: true, type: K8s.Io.Api.Policy.V1beta1.PodDisruptionBudgetStatus
end

defmodule K8s.Io.Api.Policy.V1beta1.PodDisruptionBudgetList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [K8s.Io.Api.Policy.V1beta1.PodDisruptionBudget.t()]
        }
  defstruct [:metadata, :items]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta
  field :items, 2, repeated: true, type: K8s.Io.Api.Policy.V1beta1.PodDisruptionBudget
end

defmodule K8s.Io.Api.Policy.V1beta1.PodDisruptionBudgetSpec do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          minAvailable: K8s.Io.Apimachinery.Pkg.Util.Intstr.IntOrString.t() | nil,
          selector: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelector.t() | nil,
          maxUnavailable: K8s.Io.Apimachinery.Pkg.Util.Intstr.IntOrString.t() | nil
        }
  defstruct [:minAvailable, :selector, :maxUnavailable]

  field :minAvailable, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Util.Intstr.IntOrString
  field :selector, 2, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelector
  field :maxUnavailable, 3, optional: true, type: K8s.Io.Apimachinery.Pkg.Util.Intstr.IntOrString
end

defmodule K8s.Io.Api.Policy.V1beta1.PodDisruptionBudgetStatus do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          observedGeneration: integer,
          disruptedPods: %{String.t() => K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time.t() | nil},
          disruptionsAllowed: integer,
          currentHealthy: integer,
          desiredHealthy: integer,
          expectedPods: integer
        }
  defstruct [
    :observedGeneration,
    :disruptedPods,
    :disruptionsAllowed,
    :currentHealthy,
    :desiredHealthy,
    :expectedPods
  ]

  field :observedGeneration, 1, optional: true, type: :int64

  field :disruptedPods, 2,
    repeated: true,
    type: K8s.Io.Api.Policy.V1beta1.PodDisruptionBudgetStatus.DisruptedPodsEntry,
    map: true

  field :disruptionsAllowed, 3, optional: true, type: :int32
  field :currentHealthy, 4, optional: true, type: :int32
  field :desiredHealthy, 5, optional: true, type: :int32
  field :expectedPods, 6, optional: true, type: :int32
end

defmodule K8s.Io.Api.Policy.V1beta1.PodDisruptionBudgetStatus.DisruptedPodsEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto2

  @type t :: %__MODULE__{
          key: String.t(),
          value: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time.t() | nil
        }
  defstruct [:key, :value]

  field :key, 1, optional: true, type: :string
  field :value, 2, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time
end

defmodule K8s.Io.Api.Policy.V1beta1.PodSecurityPolicy do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          spec: K8s.Io.Api.Policy.V1beta1.PodSecurityPolicySpec.t() | nil
        }
  defstruct [:metadata, :spec]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :spec, 2, optional: true, type: K8s.Io.Api.Policy.V1beta1.PodSecurityPolicySpec
end

defmodule K8s.Io.Api.Policy.V1beta1.PodSecurityPolicyList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [K8s.Io.Api.Policy.V1beta1.PodSecurityPolicy.t()]
        }
  defstruct [:metadata, :items]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta
  field :items, 2, repeated: true, type: K8s.Io.Api.Policy.V1beta1.PodSecurityPolicy
end

defmodule K8s.Io.Api.Policy.V1beta1.PodSecurityPolicySpec do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          privileged: boolean,
          defaultAddCapabilities: [String.t()],
          requiredDropCapabilities: [String.t()],
          allowedCapabilities: [String.t()],
          volumes: [String.t()],
          hostNetwork: boolean,
          hostPorts: [K8s.Io.Api.Policy.V1beta1.HostPortRange.t()],
          hostPID: boolean,
          hostIPC: boolean,
          seLinux: K8s.Io.Api.Policy.V1beta1.SELinuxStrategyOptions.t() | nil,
          runAsUser: K8s.Io.Api.Policy.V1beta1.RunAsUserStrategyOptions.t() | nil,
          runAsGroup: K8s.Io.Api.Policy.V1beta1.RunAsGroupStrategyOptions.t() | nil,
          supplementalGroups:
            K8s.Io.Api.Policy.V1beta1.SupplementalGroupsStrategyOptions.t() | nil,
          fsGroup: K8s.Io.Api.Policy.V1beta1.FSGroupStrategyOptions.t() | nil,
          readOnlyRootFilesystem: boolean,
          defaultAllowPrivilegeEscalation: boolean,
          allowPrivilegeEscalation: boolean,
          allowedHostPaths: [K8s.Io.Api.Policy.V1beta1.AllowedHostPath.t()],
          allowedFlexVolumes: [K8s.Io.Api.Policy.V1beta1.AllowedFlexVolume.t()],
          allowedCSIDrivers: [K8s.Io.Api.Policy.V1beta1.AllowedCSIDriver.t()],
          allowedUnsafeSysctls: [String.t()],
          forbiddenSysctls: [String.t()],
          allowedProcMountTypes: [String.t()],
          runtimeClass: K8s.Io.Api.Policy.V1beta1.RuntimeClassStrategyOptions.t() | nil
        }
  defstruct [
    :privileged,
    :defaultAddCapabilities,
    :requiredDropCapabilities,
    :allowedCapabilities,
    :volumes,
    :hostNetwork,
    :hostPorts,
    :hostPID,
    :hostIPC,
    :seLinux,
    :runAsUser,
    :runAsGroup,
    :supplementalGroups,
    :fsGroup,
    :readOnlyRootFilesystem,
    :defaultAllowPrivilegeEscalation,
    :allowPrivilegeEscalation,
    :allowedHostPaths,
    :allowedFlexVolumes,
    :allowedCSIDrivers,
    :allowedUnsafeSysctls,
    :forbiddenSysctls,
    :allowedProcMountTypes,
    :runtimeClass
  ]

  field :privileged, 1, optional: true, type: :bool
  field :defaultAddCapabilities, 2, repeated: true, type: :string
  field :requiredDropCapabilities, 3, repeated: true, type: :string
  field :allowedCapabilities, 4, repeated: true, type: :string
  field :volumes, 5, repeated: true, type: :string
  field :hostNetwork, 6, optional: true, type: :bool
  field :hostPorts, 7, repeated: true, type: K8s.Io.Api.Policy.V1beta1.HostPortRange
  field :hostPID, 8, optional: true, type: :bool
  field :hostIPC, 9, optional: true, type: :bool
  field :seLinux, 10, optional: true, type: K8s.Io.Api.Policy.V1beta1.SELinuxStrategyOptions
  field :runAsUser, 11, optional: true, type: K8s.Io.Api.Policy.V1beta1.RunAsUserStrategyOptions
  field :runAsGroup, 22, optional: true, type: K8s.Io.Api.Policy.V1beta1.RunAsGroupStrategyOptions

  field :supplementalGroups, 12,
    optional: true,
    type: K8s.Io.Api.Policy.V1beta1.SupplementalGroupsStrategyOptions

  field :fsGroup, 13, optional: true, type: K8s.Io.Api.Policy.V1beta1.FSGroupStrategyOptions
  field :readOnlyRootFilesystem, 14, optional: true, type: :bool
  field :defaultAllowPrivilegeEscalation, 15, optional: true, type: :bool
  field :allowPrivilegeEscalation, 16, optional: true, type: :bool
  field :allowedHostPaths, 17, repeated: true, type: K8s.Io.Api.Policy.V1beta1.AllowedHostPath
  field :allowedFlexVolumes, 18, repeated: true, type: K8s.Io.Api.Policy.V1beta1.AllowedFlexVolume
  field :allowedCSIDrivers, 23, repeated: true, type: K8s.Io.Api.Policy.V1beta1.AllowedCSIDriver
  field :allowedUnsafeSysctls, 19, repeated: true, type: :string
  field :forbiddenSysctls, 20, repeated: true, type: :string
  field :allowedProcMountTypes, 21, repeated: true, type: :string

  field :runtimeClass, 24,
    optional: true,
    type: K8s.Io.Api.Policy.V1beta1.RuntimeClassStrategyOptions
end

defmodule K8s.Io.Api.Policy.V1beta1.RunAsGroupStrategyOptions do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          rule: String.t(),
          ranges: [K8s.Io.Api.Policy.V1beta1.IDRange.t()]
        }
  defstruct [:rule, :ranges]

  field :rule, 1, optional: true, type: :string
  field :ranges, 2, repeated: true, type: K8s.Io.Api.Policy.V1beta1.IDRange
end

defmodule K8s.Io.Api.Policy.V1beta1.RunAsUserStrategyOptions do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          rule: String.t(),
          ranges: [K8s.Io.Api.Policy.V1beta1.IDRange.t()]
        }
  defstruct [:rule, :ranges]

  field :rule, 1, optional: true, type: :string
  field :ranges, 2, repeated: true, type: K8s.Io.Api.Policy.V1beta1.IDRange
end

defmodule K8s.Io.Api.Policy.V1beta1.RuntimeClassStrategyOptions do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          allowedRuntimeClassNames: [String.t()],
          defaultRuntimeClassName: String.t()
        }
  defstruct [:allowedRuntimeClassNames, :defaultRuntimeClassName]

  field :allowedRuntimeClassNames, 1, repeated: true, type: :string
  field :defaultRuntimeClassName, 2, optional: true, type: :string
end

defmodule K8s.Io.Api.Policy.V1beta1.SELinuxStrategyOptions do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          rule: String.t(),
          seLinuxOptions: K8s.Io.Api.Core.V1.SELinuxOptions.t() | nil
        }
  defstruct [:rule, :seLinuxOptions]

  field :rule, 1, optional: true, type: :string
  field :seLinuxOptions, 2, optional: true, type: K8s.Io.Api.Core.V1.SELinuxOptions
end

defmodule K8s.Io.Api.Policy.V1beta1.SupplementalGroupsStrategyOptions do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          rule: String.t(),
          ranges: [K8s.Io.Api.Policy.V1beta1.IDRange.t()]
        }
  defstruct [:rule, :ranges]

  field :rule, 1, optional: true, type: :string
  field :ranges, 2, repeated: true, type: K8s.Io.Api.Policy.V1beta1.IDRange
end
