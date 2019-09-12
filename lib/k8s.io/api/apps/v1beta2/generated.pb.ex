defmodule K8s.Io.Api.Apps.V1beta2.ControllerRevision do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          data: K8s.Io.Apimachinery.Pkg.Runtime.RawExtension.t() | nil,
          revision: integer
        }
  defstruct [:metadata, :data, :revision]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :data, 2, optional: true, type: K8s.Io.Apimachinery.Pkg.Runtime.RawExtension
  field :revision, 3, optional: true, type: :int64
end

defmodule K8s.Io.Api.Apps.V1beta2.ControllerRevisionList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [K8s.Io.Api.Apps.V1beta2.ControllerRevision.t()]
        }
  defstruct [:metadata, :items]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta
  field :items, 2, repeated: true, type: K8s.Io.Api.Apps.V1beta2.ControllerRevision
end

defmodule K8s.Io.Api.Apps.V1beta2.DaemonSet do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          spec: K8s.Io.Api.Apps.V1beta2.DaemonSetSpec.t() | nil,
          status: K8s.Io.Api.Apps.V1beta2.DaemonSetStatus.t() | nil
        }
  defstruct [:metadata, :spec, :status]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :spec, 2, optional: true, type: K8s.Io.Api.Apps.V1beta2.DaemonSetSpec
  field :status, 3, optional: true, type: K8s.Io.Api.Apps.V1beta2.DaemonSetStatus
end

defmodule K8s.Io.Api.Apps.V1beta2.DaemonSetCondition do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          type: String.t(),
          status: String.t(),
          lastTransitionTime: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time.t() | nil,
          reason: String.t(),
          message: String.t()
        }
  defstruct [:type, :status, :lastTransitionTime, :reason, :message]

  field :type, 1, optional: true, type: :string
  field :status, 2, optional: true, type: :string
  field :lastTransitionTime, 3, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time
  field :reason, 4, optional: true, type: :string
  field :message, 5, optional: true, type: :string
end

defmodule K8s.Io.Api.Apps.V1beta2.DaemonSetList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [K8s.Io.Api.Apps.V1beta2.DaemonSet.t()]
        }
  defstruct [:metadata, :items]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta
  field :items, 2, repeated: true, type: K8s.Io.Api.Apps.V1beta2.DaemonSet
end

defmodule K8s.Io.Api.Apps.V1beta2.DaemonSetSpec do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          selector: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelector.t() | nil,
          template: K8s.Io.Api.Core.V1.PodTemplateSpec.t() | nil,
          updateStrategy: K8s.Io.Api.Apps.V1beta2.DaemonSetUpdateStrategy.t() | nil,
          minReadySeconds: integer,
          revisionHistoryLimit: integer
        }
  defstruct [:selector, :template, :updateStrategy, :minReadySeconds, :revisionHistoryLimit]

  field :selector, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelector
  field :template, 2, optional: true, type: K8s.Io.Api.Core.V1.PodTemplateSpec
  field :updateStrategy, 3, optional: true, type: K8s.Io.Api.Apps.V1beta2.DaemonSetUpdateStrategy
  field :minReadySeconds, 4, optional: true, type: :int32
  field :revisionHistoryLimit, 6, optional: true, type: :int32
end

defmodule K8s.Io.Api.Apps.V1beta2.DaemonSetStatus do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          currentNumberScheduled: integer,
          numberMisscheduled: integer,
          desiredNumberScheduled: integer,
          numberReady: integer,
          observedGeneration: integer,
          updatedNumberScheduled: integer,
          numberAvailable: integer,
          numberUnavailable: integer,
          collisionCount: integer,
          conditions: [K8s.Io.Api.Apps.V1beta2.DaemonSetCondition.t()]
        }
  defstruct [
    :currentNumberScheduled,
    :numberMisscheduled,
    :desiredNumberScheduled,
    :numberReady,
    :observedGeneration,
    :updatedNumberScheduled,
    :numberAvailable,
    :numberUnavailable,
    :collisionCount,
    :conditions
  ]

  field :currentNumberScheduled, 1, optional: true, type: :int32
  field :numberMisscheduled, 2, optional: true, type: :int32
  field :desiredNumberScheduled, 3, optional: true, type: :int32
  field :numberReady, 4, optional: true, type: :int32
  field :observedGeneration, 5, optional: true, type: :int64
  field :updatedNumberScheduled, 6, optional: true, type: :int32
  field :numberAvailable, 7, optional: true, type: :int32
  field :numberUnavailable, 8, optional: true, type: :int32
  field :collisionCount, 9, optional: true, type: :int32
  field :conditions, 10, repeated: true, type: K8s.Io.Api.Apps.V1beta2.DaemonSetCondition
end

defmodule K8s.Io.Api.Apps.V1beta2.DaemonSetUpdateStrategy do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          type: String.t(),
          rollingUpdate: K8s.Io.Api.Apps.V1beta2.RollingUpdateDaemonSet.t() | nil
        }
  defstruct [:type, :rollingUpdate]

  field :type, 1, optional: true, type: :string
  field :rollingUpdate, 2, optional: true, type: K8s.Io.Api.Apps.V1beta2.RollingUpdateDaemonSet
end

defmodule K8s.Io.Api.Apps.V1beta2.Deployment do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          spec: K8s.Io.Api.Apps.V1beta2.DeploymentSpec.t() | nil,
          status: K8s.Io.Api.Apps.V1beta2.DeploymentStatus.t() | nil
        }
  defstruct [:metadata, :spec, :status]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :spec, 2, optional: true, type: K8s.Io.Api.Apps.V1beta2.DeploymentSpec
  field :status, 3, optional: true, type: K8s.Io.Api.Apps.V1beta2.DeploymentStatus
end

defmodule K8s.Io.Api.Apps.V1beta2.DeploymentCondition do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          type: String.t(),
          status: String.t(),
          lastUpdateTime: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time.t() | nil,
          lastTransitionTime: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time.t() | nil,
          reason: String.t(),
          message: String.t()
        }
  defstruct [:type, :status, :lastUpdateTime, :lastTransitionTime, :reason, :message]

  field :type, 1, optional: true, type: :string
  field :status, 2, optional: true, type: :string
  field :lastUpdateTime, 6, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time
  field :lastTransitionTime, 7, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time
  field :reason, 4, optional: true, type: :string
  field :message, 5, optional: true, type: :string
end

defmodule K8s.Io.Api.Apps.V1beta2.DeploymentList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [K8s.Io.Api.Apps.V1beta2.Deployment.t()]
        }
  defstruct [:metadata, :items]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta
  field :items, 2, repeated: true, type: K8s.Io.Api.Apps.V1beta2.Deployment
end

defmodule K8s.Io.Api.Apps.V1beta2.DeploymentSpec do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          replicas: integer,
          selector: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelector.t() | nil,
          template: K8s.Io.Api.Core.V1.PodTemplateSpec.t() | nil,
          strategy: K8s.Io.Api.Apps.V1beta2.DeploymentStrategy.t() | nil,
          minReadySeconds: integer,
          revisionHistoryLimit: integer,
          paused: boolean,
          progressDeadlineSeconds: integer
        }
  defstruct [
    :replicas,
    :selector,
    :template,
    :strategy,
    :minReadySeconds,
    :revisionHistoryLimit,
    :paused,
    :progressDeadlineSeconds
  ]

  field :replicas, 1, optional: true, type: :int32
  field :selector, 2, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelector
  field :template, 3, optional: true, type: K8s.Io.Api.Core.V1.PodTemplateSpec
  field :strategy, 4, optional: true, type: K8s.Io.Api.Apps.V1beta2.DeploymentStrategy
  field :minReadySeconds, 5, optional: true, type: :int32
  field :revisionHistoryLimit, 6, optional: true, type: :int32
  field :paused, 7, optional: true, type: :bool
  field :progressDeadlineSeconds, 9, optional: true, type: :int32
end

defmodule K8s.Io.Api.Apps.V1beta2.DeploymentStatus do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          observedGeneration: integer,
          replicas: integer,
          updatedReplicas: integer,
          readyReplicas: integer,
          availableReplicas: integer,
          unavailableReplicas: integer,
          conditions: [K8s.Io.Api.Apps.V1beta2.DeploymentCondition.t()],
          collisionCount: integer
        }
  defstruct [
    :observedGeneration,
    :replicas,
    :updatedReplicas,
    :readyReplicas,
    :availableReplicas,
    :unavailableReplicas,
    :conditions,
    :collisionCount
  ]

  field :observedGeneration, 1, optional: true, type: :int64
  field :replicas, 2, optional: true, type: :int32
  field :updatedReplicas, 3, optional: true, type: :int32
  field :readyReplicas, 7, optional: true, type: :int32
  field :availableReplicas, 4, optional: true, type: :int32
  field :unavailableReplicas, 5, optional: true, type: :int32
  field :conditions, 6, repeated: true, type: K8s.Io.Api.Apps.V1beta2.DeploymentCondition
  field :collisionCount, 8, optional: true, type: :int32
end

defmodule K8s.Io.Api.Apps.V1beta2.DeploymentStrategy do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          type: String.t(),
          rollingUpdate: K8s.Io.Api.Apps.V1beta2.RollingUpdateDeployment.t() | nil
        }
  defstruct [:type, :rollingUpdate]

  field :type, 1, optional: true, type: :string
  field :rollingUpdate, 2, optional: true, type: K8s.Io.Api.Apps.V1beta2.RollingUpdateDeployment
end

defmodule K8s.Io.Api.Apps.V1beta2.ReplicaSet do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          spec: K8s.Io.Api.Apps.V1beta2.ReplicaSetSpec.t() | nil,
          status: K8s.Io.Api.Apps.V1beta2.ReplicaSetStatus.t() | nil
        }
  defstruct [:metadata, :spec, :status]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :spec, 2, optional: true, type: K8s.Io.Api.Apps.V1beta2.ReplicaSetSpec
  field :status, 3, optional: true, type: K8s.Io.Api.Apps.V1beta2.ReplicaSetStatus
end

defmodule K8s.Io.Api.Apps.V1beta2.ReplicaSetCondition do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          type: String.t(),
          status: String.t(),
          lastTransitionTime: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time.t() | nil,
          reason: String.t(),
          message: String.t()
        }
  defstruct [:type, :status, :lastTransitionTime, :reason, :message]

  field :type, 1, optional: true, type: :string
  field :status, 2, optional: true, type: :string
  field :lastTransitionTime, 3, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time
  field :reason, 4, optional: true, type: :string
  field :message, 5, optional: true, type: :string
end

defmodule K8s.Io.Api.Apps.V1beta2.ReplicaSetList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [K8s.Io.Api.Apps.V1beta2.ReplicaSet.t()]
        }
  defstruct [:metadata, :items]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta
  field :items, 2, repeated: true, type: K8s.Io.Api.Apps.V1beta2.ReplicaSet
end

defmodule K8s.Io.Api.Apps.V1beta2.ReplicaSetSpec do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          replicas: integer,
          minReadySeconds: integer,
          selector: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelector.t() | nil,
          template: K8s.Io.Api.Core.V1.PodTemplateSpec.t() | nil
        }
  defstruct [:replicas, :minReadySeconds, :selector, :template]

  field :replicas, 1, optional: true, type: :int32
  field :minReadySeconds, 4, optional: true, type: :int32
  field :selector, 2, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelector
  field :template, 3, optional: true, type: K8s.Io.Api.Core.V1.PodTemplateSpec
end

defmodule K8s.Io.Api.Apps.V1beta2.ReplicaSetStatus do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          replicas: integer,
          fullyLabeledReplicas: integer,
          readyReplicas: integer,
          availableReplicas: integer,
          observedGeneration: integer,
          conditions: [K8s.Io.Api.Apps.V1beta2.ReplicaSetCondition.t()]
        }
  defstruct [
    :replicas,
    :fullyLabeledReplicas,
    :readyReplicas,
    :availableReplicas,
    :observedGeneration,
    :conditions
  ]

  field :replicas, 1, optional: true, type: :int32
  field :fullyLabeledReplicas, 2, optional: true, type: :int32
  field :readyReplicas, 4, optional: true, type: :int32
  field :availableReplicas, 5, optional: true, type: :int32
  field :observedGeneration, 3, optional: true, type: :int64
  field :conditions, 6, repeated: true, type: K8s.Io.Api.Apps.V1beta2.ReplicaSetCondition
end

defmodule K8s.Io.Api.Apps.V1beta2.RollingUpdateDaemonSet do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          maxUnavailable: K8s.Io.Apimachinery.Pkg.Util.Intstr.IntOrString.t() | nil
        }
  defstruct [:maxUnavailable]

  field :maxUnavailable, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Util.Intstr.IntOrString
end

defmodule K8s.Io.Api.Apps.V1beta2.RollingUpdateDeployment do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          maxUnavailable: K8s.Io.Apimachinery.Pkg.Util.Intstr.IntOrString.t() | nil,
          maxSurge: K8s.Io.Apimachinery.Pkg.Util.Intstr.IntOrString.t() | nil
        }
  defstruct [:maxUnavailable, :maxSurge]

  field :maxUnavailable, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Util.Intstr.IntOrString
  field :maxSurge, 2, optional: true, type: K8s.Io.Apimachinery.Pkg.Util.Intstr.IntOrString
end

defmodule K8s.Io.Api.Apps.V1beta2.RollingUpdateStatefulSetStrategy do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          partition: integer
        }
  defstruct [:partition]

  field :partition, 1, optional: true, type: :int32
end

defmodule K8s.Io.Api.Apps.V1beta2.Scale do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          spec: K8s.Io.Api.Apps.V1beta2.ScaleSpec.t() | nil,
          status: K8s.Io.Api.Apps.V1beta2.ScaleStatus.t() | nil
        }
  defstruct [:metadata, :spec, :status]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :spec, 2, optional: true, type: K8s.Io.Api.Apps.V1beta2.ScaleSpec
  field :status, 3, optional: true, type: K8s.Io.Api.Apps.V1beta2.ScaleStatus
end

defmodule K8s.Io.Api.Apps.V1beta2.ScaleSpec do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          replicas: integer
        }
  defstruct [:replicas]

  field :replicas, 1, optional: true, type: :int32
end

defmodule K8s.Io.Api.Apps.V1beta2.ScaleStatus do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          replicas: integer,
          selector: %{String.t() => String.t()},
          targetSelector: String.t()
        }
  defstruct [:replicas, :selector, :targetSelector]

  field :replicas, 1, optional: true, type: :int32

  field :selector, 2,
    repeated: true,
    type: K8s.Io.Api.Apps.V1beta2.ScaleStatus.SelectorEntry,
    map: true

  field :targetSelector, 3, optional: true, type: :string
end

defmodule K8s.Io.Api.Apps.V1beta2.ScaleStatus.SelectorEntry do
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

defmodule K8s.Io.Api.Apps.V1beta2.StatefulSet do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          spec: K8s.Io.Api.Apps.V1beta2.StatefulSetSpec.t() | nil,
          status: K8s.Io.Api.Apps.V1beta2.StatefulSetStatus.t() | nil
        }
  defstruct [:metadata, :spec, :status]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :spec, 2, optional: true, type: K8s.Io.Api.Apps.V1beta2.StatefulSetSpec
  field :status, 3, optional: true, type: K8s.Io.Api.Apps.V1beta2.StatefulSetStatus
end

defmodule K8s.Io.Api.Apps.V1beta2.StatefulSetCondition do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          type: String.t(),
          status: String.t(),
          lastTransitionTime: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time.t() | nil,
          reason: String.t(),
          message: String.t()
        }
  defstruct [:type, :status, :lastTransitionTime, :reason, :message]

  field :type, 1, optional: true, type: :string
  field :status, 2, optional: true, type: :string
  field :lastTransitionTime, 3, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time
  field :reason, 4, optional: true, type: :string
  field :message, 5, optional: true, type: :string
end

defmodule K8s.Io.Api.Apps.V1beta2.StatefulSetList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [K8s.Io.Api.Apps.V1beta2.StatefulSet.t()]
        }
  defstruct [:metadata, :items]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta
  field :items, 2, repeated: true, type: K8s.Io.Api.Apps.V1beta2.StatefulSet
end

defmodule K8s.Io.Api.Apps.V1beta2.StatefulSetSpec do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          replicas: integer,
          selector: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelector.t() | nil,
          template: K8s.Io.Api.Core.V1.PodTemplateSpec.t() | nil,
          volumeClaimTemplates: [K8s.Io.Api.Core.V1.PersistentVolumeClaim.t()],
          serviceName: String.t(),
          podManagementPolicy: String.t(),
          updateStrategy: K8s.Io.Api.Apps.V1beta2.StatefulSetUpdateStrategy.t() | nil,
          revisionHistoryLimit: integer
        }
  defstruct [
    :replicas,
    :selector,
    :template,
    :volumeClaimTemplates,
    :serviceName,
    :podManagementPolicy,
    :updateStrategy,
    :revisionHistoryLimit
  ]

  field :replicas, 1, optional: true, type: :int32
  field :selector, 2, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelector
  field :template, 3, optional: true, type: K8s.Io.Api.Core.V1.PodTemplateSpec
  field :volumeClaimTemplates, 4, repeated: true, type: K8s.Io.Api.Core.V1.PersistentVolumeClaim
  field :serviceName, 5, optional: true, type: :string
  field :podManagementPolicy, 6, optional: true, type: :string

  field :updateStrategy, 7,
    optional: true,
    type: K8s.Io.Api.Apps.V1beta2.StatefulSetUpdateStrategy

  field :revisionHistoryLimit, 8, optional: true, type: :int32
end

defmodule K8s.Io.Api.Apps.V1beta2.StatefulSetStatus do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          observedGeneration: integer,
          replicas: integer,
          readyReplicas: integer,
          currentReplicas: integer,
          updatedReplicas: integer,
          currentRevision: String.t(),
          updateRevision: String.t(),
          collisionCount: integer,
          conditions: [K8s.Io.Api.Apps.V1beta2.StatefulSetCondition.t()]
        }
  defstruct [
    :observedGeneration,
    :replicas,
    :readyReplicas,
    :currentReplicas,
    :updatedReplicas,
    :currentRevision,
    :updateRevision,
    :collisionCount,
    :conditions
  ]

  field :observedGeneration, 1, optional: true, type: :int64
  field :replicas, 2, optional: true, type: :int32
  field :readyReplicas, 3, optional: true, type: :int32
  field :currentReplicas, 4, optional: true, type: :int32
  field :updatedReplicas, 5, optional: true, type: :int32
  field :currentRevision, 6, optional: true, type: :string
  field :updateRevision, 7, optional: true, type: :string
  field :collisionCount, 9, optional: true, type: :int32
  field :conditions, 10, repeated: true, type: K8s.Io.Api.Apps.V1beta2.StatefulSetCondition
end

defmodule K8s.Io.Api.Apps.V1beta2.StatefulSetUpdateStrategy do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          type: String.t(),
          rollingUpdate: K8s.Io.Api.Apps.V1beta2.RollingUpdateStatefulSetStrategy.t() | nil
        }
  defstruct [:type, :rollingUpdate]

  field :type, 1, optional: true, type: :string

  field :rollingUpdate, 2,
    optional: true,
    type: K8s.Io.Api.Apps.V1beta2.RollingUpdateStatefulSetStrategy
end
