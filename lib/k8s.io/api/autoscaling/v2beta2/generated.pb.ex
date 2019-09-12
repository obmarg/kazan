defmodule K8s.Io.Api.Autoscaling.V2beta2.CrossVersionObjectReference do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          kind: String.t(),
          name: String.t(),
          apiVersion: String.t()
        }
  defstruct [:kind, :name, :apiVersion]

  field :kind, 1, optional: true, type: :string
  field :name, 2, optional: true, type: :string
  field :apiVersion, 3, optional: true, type: :string
end

defmodule K8s.Io.Api.Autoscaling.V2beta2.ExternalMetricSource do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metric: K8s.Io.Api.Autoscaling.V2beta2.MetricIdentifier.t() | nil,
          target: K8s.Io.Api.Autoscaling.V2beta2.MetricTarget.t() | nil
        }
  defstruct [:metric, :target]

  field :metric, 1, optional: true, type: K8s.Io.Api.Autoscaling.V2beta2.MetricIdentifier
  field :target, 2, optional: true, type: K8s.Io.Api.Autoscaling.V2beta2.MetricTarget
end

defmodule K8s.Io.Api.Autoscaling.V2beta2.ExternalMetricStatus do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metric: K8s.Io.Api.Autoscaling.V2beta2.MetricIdentifier.t() | nil,
          current: K8s.Io.Api.Autoscaling.V2beta2.MetricValueStatus.t() | nil
        }
  defstruct [:metric, :current]

  field :metric, 1, optional: true, type: K8s.Io.Api.Autoscaling.V2beta2.MetricIdentifier
  field :current, 2, optional: true, type: K8s.Io.Api.Autoscaling.V2beta2.MetricValueStatus
end

defmodule K8s.Io.Api.Autoscaling.V2beta2.HorizontalPodAutoscaler do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          spec: K8s.Io.Api.Autoscaling.V2beta2.HorizontalPodAutoscalerSpec.t() | nil,
          status: K8s.Io.Api.Autoscaling.V2beta2.HorizontalPodAutoscalerStatus.t() | nil
        }
  defstruct [:metadata, :spec, :status]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :spec, 2, optional: true, type: K8s.Io.Api.Autoscaling.V2beta2.HorizontalPodAutoscalerSpec

  field :status, 3,
    optional: true,
    type: K8s.Io.Api.Autoscaling.V2beta2.HorizontalPodAutoscalerStatus
end

defmodule K8s.Io.Api.Autoscaling.V2beta2.HorizontalPodAutoscalerCondition do
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

defmodule K8s.Io.Api.Autoscaling.V2beta2.HorizontalPodAutoscalerList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [K8s.Io.Api.Autoscaling.V2beta2.HorizontalPodAutoscaler.t()]
        }
  defstruct [:metadata, :items]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta
  field :items, 2, repeated: true, type: K8s.Io.Api.Autoscaling.V2beta2.HorizontalPodAutoscaler
end

defmodule K8s.Io.Api.Autoscaling.V2beta2.HorizontalPodAutoscalerSpec do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          scaleTargetRef: K8s.Io.Api.Autoscaling.V2beta2.CrossVersionObjectReference.t() | nil,
          minReplicas: integer,
          maxReplicas: integer,
          metrics: [K8s.Io.Api.Autoscaling.V2beta2.MetricSpec.t()]
        }
  defstruct [:scaleTargetRef, :minReplicas, :maxReplicas, :metrics]

  field :scaleTargetRef, 1,
    optional: true,
    type: K8s.Io.Api.Autoscaling.V2beta2.CrossVersionObjectReference

  field :minReplicas, 2, optional: true, type: :int32
  field :maxReplicas, 3, optional: true, type: :int32
  field :metrics, 4, repeated: true, type: K8s.Io.Api.Autoscaling.V2beta2.MetricSpec
end

defmodule K8s.Io.Api.Autoscaling.V2beta2.HorizontalPodAutoscalerStatus do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          observedGeneration: integer,
          lastScaleTime: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time.t() | nil,
          currentReplicas: integer,
          desiredReplicas: integer,
          currentMetrics: [K8s.Io.Api.Autoscaling.V2beta2.MetricStatus.t()],
          conditions: [K8s.Io.Api.Autoscaling.V2beta2.HorizontalPodAutoscalerCondition.t()]
        }
  defstruct [
    :observedGeneration,
    :lastScaleTime,
    :currentReplicas,
    :desiredReplicas,
    :currentMetrics,
    :conditions
  ]

  field :observedGeneration, 1, optional: true, type: :int64
  field :lastScaleTime, 2, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time
  field :currentReplicas, 3, optional: true, type: :int32
  field :desiredReplicas, 4, optional: true, type: :int32
  field :currentMetrics, 5, repeated: true, type: K8s.Io.Api.Autoscaling.V2beta2.MetricStatus

  field :conditions, 6,
    repeated: true,
    type: K8s.Io.Api.Autoscaling.V2beta2.HorizontalPodAutoscalerCondition
end

defmodule K8s.Io.Api.Autoscaling.V2beta2.MetricIdentifier do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          name: String.t(),
          selector: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelector.t() | nil
        }
  defstruct [:name, :selector]

  field :name, 1, optional: true, type: :string
  field :selector, 2, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelector
end

defmodule K8s.Io.Api.Autoscaling.V2beta2.MetricSpec do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          type: String.t(),
          object: K8s.Io.Api.Autoscaling.V2beta2.ObjectMetricSource.t() | nil,
          pods: K8s.Io.Api.Autoscaling.V2beta2.PodsMetricSource.t() | nil,
          resource: K8s.Io.Api.Autoscaling.V2beta2.ResourceMetricSource.t() | nil,
          external: K8s.Io.Api.Autoscaling.V2beta2.ExternalMetricSource.t() | nil
        }
  defstruct [:type, :object, :pods, :resource, :external]

  field :type, 1, optional: true, type: :string
  field :object, 2, optional: true, type: K8s.Io.Api.Autoscaling.V2beta2.ObjectMetricSource
  field :pods, 3, optional: true, type: K8s.Io.Api.Autoscaling.V2beta2.PodsMetricSource
  field :resource, 4, optional: true, type: K8s.Io.Api.Autoscaling.V2beta2.ResourceMetricSource
  field :external, 5, optional: true, type: K8s.Io.Api.Autoscaling.V2beta2.ExternalMetricSource
end

defmodule K8s.Io.Api.Autoscaling.V2beta2.MetricStatus do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          type: String.t(),
          object: K8s.Io.Api.Autoscaling.V2beta2.ObjectMetricStatus.t() | nil,
          pods: K8s.Io.Api.Autoscaling.V2beta2.PodsMetricStatus.t() | nil,
          resource: K8s.Io.Api.Autoscaling.V2beta2.ResourceMetricStatus.t() | nil,
          external: K8s.Io.Api.Autoscaling.V2beta2.ExternalMetricStatus.t() | nil
        }
  defstruct [:type, :object, :pods, :resource, :external]

  field :type, 1, optional: true, type: :string
  field :object, 2, optional: true, type: K8s.Io.Api.Autoscaling.V2beta2.ObjectMetricStatus
  field :pods, 3, optional: true, type: K8s.Io.Api.Autoscaling.V2beta2.PodsMetricStatus
  field :resource, 4, optional: true, type: K8s.Io.Api.Autoscaling.V2beta2.ResourceMetricStatus
  field :external, 5, optional: true, type: K8s.Io.Api.Autoscaling.V2beta2.ExternalMetricStatus
end

defmodule K8s.Io.Api.Autoscaling.V2beta2.MetricTarget do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          type: String.t(),
          value: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity.t() | nil,
          averageValue: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity.t() | nil,
          averageUtilization: integer
        }
  defstruct [:type, :value, :averageValue, :averageUtilization]

  field :type, 1, optional: true, type: :string
  field :value, 2, optional: true, type: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity
  field :averageValue, 3, optional: true, type: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity
  field :averageUtilization, 4, optional: true, type: :int32
end

defmodule K8s.Io.Api.Autoscaling.V2beta2.MetricValueStatus do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          value: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity.t() | nil,
          averageValue: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity.t() | nil,
          averageUtilization: integer
        }
  defstruct [:value, :averageValue, :averageUtilization]

  field :value, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity
  field :averageValue, 2, optional: true, type: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity
  field :averageUtilization, 3, optional: true, type: :int32
end

defmodule K8s.Io.Api.Autoscaling.V2beta2.ObjectMetricSource do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          describedObject: K8s.Io.Api.Autoscaling.V2beta2.CrossVersionObjectReference.t() | nil,
          target: K8s.Io.Api.Autoscaling.V2beta2.MetricTarget.t() | nil,
          metric: K8s.Io.Api.Autoscaling.V2beta2.MetricIdentifier.t() | nil
        }
  defstruct [:describedObject, :target, :metric]

  field :describedObject, 1,
    optional: true,
    type: K8s.Io.Api.Autoscaling.V2beta2.CrossVersionObjectReference

  field :target, 2, optional: true, type: K8s.Io.Api.Autoscaling.V2beta2.MetricTarget
  field :metric, 3, optional: true, type: K8s.Io.Api.Autoscaling.V2beta2.MetricIdentifier
end

defmodule K8s.Io.Api.Autoscaling.V2beta2.ObjectMetricStatus do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metric: K8s.Io.Api.Autoscaling.V2beta2.MetricIdentifier.t() | nil,
          current: K8s.Io.Api.Autoscaling.V2beta2.MetricValueStatus.t() | nil,
          describedObject: K8s.Io.Api.Autoscaling.V2beta2.CrossVersionObjectReference.t() | nil
        }
  defstruct [:metric, :current, :describedObject]

  field :metric, 1, optional: true, type: K8s.Io.Api.Autoscaling.V2beta2.MetricIdentifier
  field :current, 2, optional: true, type: K8s.Io.Api.Autoscaling.V2beta2.MetricValueStatus

  field :describedObject, 3,
    optional: true,
    type: K8s.Io.Api.Autoscaling.V2beta2.CrossVersionObjectReference
end

defmodule K8s.Io.Api.Autoscaling.V2beta2.PodsMetricSource do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metric: K8s.Io.Api.Autoscaling.V2beta2.MetricIdentifier.t() | nil,
          target: K8s.Io.Api.Autoscaling.V2beta2.MetricTarget.t() | nil
        }
  defstruct [:metric, :target]

  field :metric, 1, optional: true, type: K8s.Io.Api.Autoscaling.V2beta2.MetricIdentifier
  field :target, 2, optional: true, type: K8s.Io.Api.Autoscaling.V2beta2.MetricTarget
end

defmodule K8s.Io.Api.Autoscaling.V2beta2.PodsMetricStatus do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metric: K8s.Io.Api.Autoscaling.V2beta2.MetricIdentifier.t() | nil,
          current: K8s.Io.Api.Autoscaling.V2beta2.MetricValueStatus.t() | nil
        }
  defstruct [:metric, :current]

  field :metric, 1, optional: true, type: K8s.Io.Api.Autoscaling.V2beta2.MetricIdentifier
  field :current, 2, optional: true, type: K8s.Io.Api.Autoscaling.V2beta2.MetricValueStatus
end

defmodule K8s.Io.Api.Autoscaling.V2beta2.ResourceMetricSource do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          name: String.t(),
          target: K8s.Io.Api.Autoscaling.V2beta2.MetricTarget.t() | nil
        }
  defstruct [:name, :target]

  field :name, 1, optional: true, type: :string
  field :target, 2, optional: true, type: K8s.Io.Api.Autoscaling.V2beta2.MetricTarget
end

defmodule K8s.Io.Api.Autoscaling.V2beta2.ResourceMetricStatus do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          name: String.t(),
          current: K8s.Io.Api.Autoscaling.V2beta2.MetricValueStatus.t() | nil
        }
  defstruct [:name, :current]

  field :name, 1, optional: true, type: :string
  field :current, 2, optional: true, type: K8s.Io.Api.Autoscaling.V2beta2.MetricValueStatus
end
