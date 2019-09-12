defmodule K8s.Io.Api.Apps.V1beta1.ControllerRevision do
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

defmodule K8s.Io.Api.Apps.V1beta1.ControllerRevisionList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [K8s.Io.Api.Apps.V1beta1.ControllerRevision.t()]
        }
  defstruct [:metadata, :items]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta
  field :items, 2, repeated: true, type: K8s.Io.Api.Apps.V1beta1.ControllerRevision
end

defmodule K8s.Io.Api.Apps.V1beta1.Deployment do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          spec: K8s.Io.Api.Apps.V1beta1.DeploymentSpec.t() | nil,
          status: K8s.Io.Api.Apps.V1beta1.DeploymentStatus.t() | nil
        }
  defstruct [:metadata, :spec, :status]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :spec, 2, optional: true, type: K8s.Io.Api.Apps.V1beta1.DeploymentSpec
  field :status, 3, optional: true, type: K8s.Io.Api.Apps.V1beta1.DeploymentStatus
end

defmodule K8s.Io.Api.Apps.V1beta1.DeploymentCondition do
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

defmodule K8s.Io.Api.Apps.V1beta1.DeploymentList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [K8s.Io.Api.Apps.V1beta1.Deployment.t()]
        }
  defstruct [:metadata, :items]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta
  field :items, 2, repeated: true, type: K8s.Io.Api.Apps.V1beta1.Deployment
end

defmodule K8s.Io.Api.Apps.V1beta1.DeploymentRollback do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          name: String.t(),
          updatedAnnotations: %{String.t() => String.t()},
          rollbackTo: K8s.Io.Api.Apps.V1beta1.RollbackConfig.t() | nil
        }
  defstruct [:name, :updatedAnnotations, :rollbackTo]

  field :name, 1, optional: true, type: :string

  field :updatedAnnotations, 2,
    repeated: true,
    type: K8s.Io.Api.Apps.V1beta1.DeploymentRollback.UpdatedAnnotationsEntry,
    map: true

  field :rollbackTo, 3, optional: true, type: K8s.Io.Api.Apps.V1beta1.RollbackConfig
end

defmodule K8s.Io.Api.Apps.V1beta1.DeploymentRollback.UpdatedAnnotationsEntry do
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

defmodule K8s.Io.Api.Apps.V1beta1.DeploymentSpec do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          replicas: integer,
          selector: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelector.t() | nil,
          template: K8s.Io.Api.Core.V1.PodTemplateSpec.t() | nil,
          strategy: K8s.Io.Api.Apps.V1beta1.DeploymentStrategy.t() | nil,
          minReadySeconds: integer,
          revisionHistoryLimit: integer,
          paused: boolean,
          rollbackTo: K8s.Io.Api.Apps.V1beta1.RollbackConfig.t() | nil,
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
    :rollbackTo,
    :progressDeadlineSeconds
  ]

  field :replicas, 1, optional: true, type: :int32
  field :selector, 2, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelector
  field :template, 3, optional: true, type: K8s.Io.Api.Core.V1.PodTemplateSpec
  field :strategy, 4, optional: true, type: K8s.Io.Api.Apps.V1beta1.DeploymentStrategy
  field :minReadySeconds, 5, optional: true, type: :int32
  field :revisionHistoryLimit, 6, optional: true, type: :int32
  field :paused, 7, optional: true, type: :bool
  field :rollbackTo, 8, optional: true, type: K8s.Io.Api.Apps.V1beta1.RollbackConfig
  field :progressDeadlineSeconds, 9, optional: true, type: :int32
end

defmodule K8s.Io.Api.Apps.V1beta1.DeploymentStatus do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          observedGeneration: integer,
          replicas: integer,
          updatedReplicas: integer,
          readyReplicas: integer,
          availableReplicas: integer,
          unavailableReplicas: integer,
          conditions: [K8s.Io.Api.Apps.V1beta1.DeploymentCondition.t()],
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
  field :conditions, 6, repeated: true, type: K8s.Io.Api.Apps.V1beta1.DeploymentCondition
  field :collisionCount, 8, optional: true, type: :int32
end

defmodule K8s.Io.Api.Apps.V1beta1.DeploymentStrategy do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          type: String.t(),
          rollingUpdate: K8s.Io.Api.Apps.V1beta1.RollingUpdateDeployment.t() | nil
        }
  defstruct [:type, :rollingUpdate]

  field :type, 1, optional: true, type: :string
  field :rollingUpdate, 2, optional: true, type: K8s.Io.Api.Apps.V1beta1.RollingUpdateDeployment
end

defmodule K8s.Io.Api.Apps.V1beta1.RollbackConfig do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          revision: integer
        }
  defstruct [:revision]

  field :revision, 1, optional: true, type: :int64
end

defmodule K8s.Io.Api.Apps.V1beta1.RollingUpdateDeployment do
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

defmodule K8s.Io.Api.Apps.V1beta1.RollingUpdateStatefulSetStrategy do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          partition: integer
        }
  defstruct [:partition]

  field :partition, 1, optional: true, type: :int32
end

defmodule K8s.Io.Api.Apps.V1beta1.Scale do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          spec: K8s.Io.Api.Apps.V1beta1.ScaleSpec.t() | nil,
          status: K8s.Io.Api.Apps.V1beta1.ScaleStatus.t() | nil
        }
  defstruct [:metadata, :spec, :status]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :spec, 2, optional: true, type: K8s.Io.Api.Apps.V1beta1.ScaleSpec
  field :status, 3, optional: true, type: K8s.Io.Api.Apps.V1beta1.ScaleStatus
end

defmodule K8s.Io.Api.Apps.V1beta1.ScaleSpec do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          replicas: integer
        }
  defstruct [:replicas]

  field :replicas, 1, optional: true, type: :int32
end

defmodule K8s.Io.Api.Apps.V1beta1.ScaleStatus do
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
    type: K8s.Io.Api.Apps.V1beta1.ScaleStatus.SelectorEntry,
    map: true

  field :targetSelector, 3, optional: true, type: :string
end

defmodule K8s.Io.Api.Apps.V1beta1.ScaleStatus.SelectorEntry do
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

defmodule K8s.Io.Api.Apps.V1beta1.StatefulSet do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          spec: K8s.Io.Api.Apps.V1beta1.StatefulSetSpec.t() | nil,
          status: K8s.Io.Api.Apps.V1beta1.StatefulSetStatus.t() | nil
        }
  defstruct [:metadata, :spec, :status]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :spec, 2, optional: true, type: K8s.Io.Api.Apps.V1beta1.StatefulSetSpec
  field :status, 3, optional: true, type: K8s.Io.Api.Apps.V1beta1.StatefulSetStatus
end

defmodule K8s.Io.Api.Apps.V1beta1.StatefulSetCondition do
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

defmodule K8s.Io.Api.Apps.V1beta1.StatefulSetList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [K8s.Io.Api.Apps.V1beta1.StatefulSet.t()]
        }
  defstruct [:metadata, :items]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta
  field :items, 2, repeated: true, type: K8s.Io.Api.Apps.V1beta1.StatefulSet
end

defmodule K8s.Io.Api.Apps.V1beta1.StatefulSetSpec do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          replicas: integer,
          selector: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelector.t() | nil,
          template: K8s.Io.Api.Core.V1.PodTemplateSpec.t() | nil,
          volumeClaimTemplates: [K8s.Io.Api.Core.V1.PersistentVolumeClaim.t()],
          serviceName: String.t(),
          podManagementPolicy: String.t(),
          updateStrategy: K8s.Io.Api.Apps.V1beta1.StatefulSetUpdateStrategy.t() | nil,
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
    type: K8s.Io.Api.Apps.V1beta1.StatefulSetUpdateStrategy

  field :revisionHistoryLimit, 8, optional: true, type: :int32
end

defmodule K8s.Io.Api.Apps.V1beta1.StatefulSetStatus do
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
          conditions: [K8s.Io.Api.Apps.V1beta1.StatefulSetCondition.t()]
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
  field :conditions, 10, repeated: true, type: K8s.Io.Api.Apps.V1beta1.StatefulSetCondition
end

defmodule K8s.Io.Api.Apps.V1beta1.StatefulSetUpdateStrategy do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          type: String.t(),
          rollingUpdate: K8s.Io.Api.Apps.V1beta1.RollingUpdateStatefulSetStrategy.t() | nil
        }
  defstruct [:type, :rollingUpdate]

  field :type, 1, optional: true, type: :string

  field :rollingUpdate, 2,
    optional: true,
    type: K8s.Io.Api.Apps.V1beta1.RollingUpdateStatefulSetStrategy
end
