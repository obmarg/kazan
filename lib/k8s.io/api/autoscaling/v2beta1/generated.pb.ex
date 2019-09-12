defmodule K8s.Io.Api.Autoscaling.V2beta1.CrossVersionObjectReference do
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

defmodule K8s.Io.Api.Autoscaling.V2beta1.ExternalMetricSource do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metricName: String.t(),
          metricSelector: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelector.t() | nil,
          targetValue: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity.t() | nil,
          targetAverageValue: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity.t() | nil
        }
  defstruct [:metricName, :metricSelector, :targetValue, :targetAverageValue]

  field :metricName, 1, optional: true, type: :string

  field :metricSelector, 2,
    optional: true,
    type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelector

  field :targetValue, 3, optional: true, type: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity

  field :targetAverageValue, 4,
    optional: true,
    type: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity
end

defmodule K8s.Io.Api.Autoscaling.V2beta1.ExternalMetricStatus do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metricName: String.t(),
          metricSelector: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelector.t() | nil,
          currentValue: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity.t() | nil,
          currentAverageValue: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity.t() | nil
        }
  defstruct [:metricName, :metricSelector, :currentValue, :currentAverageValue]

  field :metricName, 1, optional: true, type: :string

  field :metricSelector, 2,
    optional: true,
    type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelector

  field :currentValue, 3, optional: true, type: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity

  field :currentAverageValue, 4,
    optional: true,
    type: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity
end

defmodule K8s.Io.Api.Autoscaling.V2beta1.HorizontalPodAutoscaler do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          spec: K8s.Io.Api.Autoscaling.V2beta1.HorizontalPodAutoscalerSpec.t() | nil,
          status: K8s.Io.Api.Autoscaling.V2beta1.HorizontalPodAutoscalerStatus.t() | nil
        }
  defstruct [:metadata, :spec, :status]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :spec, 2, optional: true, type: K8s.Io.Api.Autoscaling.V2beta1.HorizontalPodAutoscalerSpec

  field :status, 3,
    optional: true,
    type: K8s.Io.Api.Autoscaling.V2beta1.HorizontalPodAutoscalerStatus
end

defmodule K8s.Io.Api.Autoscaling.V2beta1.HorizontalPodAutoscalerCondition do
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

defmodule K8s.Io.Api.Autoscaling.V2beta1.HorizontalPodAutoscalerList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [K8s.Io.Api.Autoscaling.V2beta1.HorizontalPodAutoscaler.t()]
        }
  defstruct [:metadata, :items]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta
  field :items, 2, repeated: true, type: K8s.Io.Api.Autoscaling.V2beta1.HorizontalPodAutoscaler
end

defmodule K8s.Io.Api.Autoscaling.V2beta1.HorizontalPodAutoscalerSpec do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          scaleTargetRef: K8s.Io.Api.Autoscaling.V2beta1.CrossVersionObjectReference.t() | nil,
          minReplicas: integer,
          maxReplicas: integer,
          metrics: [K8s.Io.Api.Autoscaling.V2beta1.MetricSpec.t()]
        }
  defstruct [:scaleTargetRef, :minReplicas, :maxReplicas, :metrics]

  field :scaleTargetRef, 1,
    optional: true,
    type: K8s.Io.Api.Autoscaling.V2beta1.CrossVersionObjectReference

  field :minReplicas, 2, optional: true, type: :int32
  field :maxReplicas, 3, optional: true, type: :int32
  field :metrics, 4, repeated: true, type: K8s.Io.Api.Autoscaling.V2beta1.MetricSpec
end

defmodule K8s.Io.Api.Autoscaling.V2beta1.HorizontalPodAutoscalerStatus do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          observedGeneration: integer,
          lastScaleTime: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time.t() | nil,
          currentReplicas: integer,
          desiredReplicas: integer,
          currentMetrics: [K8s.Io.Api.Autoscaling.V2beta1.MetricStatus.t()],
          conditions: [K8s.Io.Api.Autoscaling.V2beta1.HorizontalPodAutoscalerCondition.t()]
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
  field :currentMetrics, 5, repeated: true, type: K8s.Io.Api.Autoscaling.V2beta1.MetricStatus

  field :conditions, 6,
    repeated: true,
    type: K8s.Io.Api.Autoscaling.V2beta1.HorizontalPodAutoscalerCondition
end

defmodule K8s.Io.Api.Autoscaling.V2beta1.MetricSpec do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          type: String.t(),
          object: K8s.Io.Api.Autoscaling.V2beta1.ObjectMetricSource.t() | nil,
          pods: K8s.Io.Api.Autoscaling.V2beta1.PodsMetricSource.t() | nil,
          resource: K8s.Io.Api.Autoscaling.V2beta1.ResourceMetricSource.t() | nil,
          external: K8s.Io.Api.Autoscaling.V2beta1.ExternalMetricSource.t() | nil
        }
  defstruct [:type, :object, :pods, :resource, :external]

  field :type, 1, optional: true, type: :string
  field :object, 2, optional: true, type: K8s.Io.Api.Autoscaling.V2beta1.ObjectMetricSource
  field :pods, 3, optional: true, type: K8s.Io.Api.Autoscaling.V2beta1.PodsMetricSource
  field :resource, 4, optional: true, type: K8s.Io.Api.Autoscaling.V2beta1.ResourceMetricSource
  field :external, 5, optional: true, type: K8s.Io.Api.Autoscaling.V2beta1.ExternalMetricSource
end

defmodule K8s.Io.Api.Autoscaling.V2beta1.MetricStatus do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          type: String.t(),
          object: K8s.Io.Api.Autoscaling.V2beta1.ObjectMetricStatus.t() | nil,
          pods: K8s.Io.Api.Autoscaling.V2beta1.PodsMetricStatus.t() | nil,
          resource: K8s.Io.Api.Autoscaling.V2beta1.ResourceMetricStatus.t() | nil,
          external: K8s.Io.Api.Autoscaling.V2beta1.ExternalMetricStatus.t() | nil
        }
  defstruct [:type, :object, :pods, :resource, :external]

  field :type, 1, optional: true, type: :string
  field :object, 2, optional: true, type: K8s.Io.Api.Autoscaling.V2beta1.ObjectMetricStatus
  field :pods, 3, optional: true, type: K8s.Io.Api.Autoscaling.V2beta1.PodsMetricStatus
  field :resource, 4, optional: true, type: K8s.Io.Api.Autoscaling.V2beta1.ResourceMetricStatus
  field :external, 5, optional: true, type: K8s.Io.Api.Autoscaling.V2beta1.ExternalMetricStatus
end

defmodule K8s.Io.Api.Autoscaling.V2beta1.ObjectMetricSource do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          target: K8s.Io.Api.Autoscaling.V2beta1.CrossVersionObjectReference.t() | nil,
          metricName: String.t(),
          targetValue: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity.t() | nil,
          selector: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelector.t() | nil,
          averageValue: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity.t() | nil
        }
  defstruct [:target, :metricName, :targetValue, :selector, :averageValue]

  field :target, 1,
    optional: true,
    type: K8s.Io.Api.Autoscaling.V2beta1.CrossVersionObjectReference

  field :metricName, 2, optional: true, type: :string
  field :targetValue, 3, optional: true, type: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity
  field :selector, 4, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelector
  field :averageValue, 5, optional: true, type: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity
end

defmodule K8s.Io.Api.Autoscaling.V2beta1.ObjectMetricStatus do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          target: K8s.Io.Api.Autoscaling.V2beta1.CrossVersionObjectReference.t() | nil,
          metricName: String.t(),
          currentValue: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity.t() | nil,
          selector: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelector.t() | nil,
          averageValue: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity.t() | nil
        }
  defstruct [:target, :metricName, :currentValue, :selector, :averageValue]

  field :target, 1,
    optional: true,
    type: K8s.Io.Api.Autoscaling.V2beta1.CrossVersionObjectReference

  field :metricName, 2, optional: true, type: :string
  field :currentValue, 3, optional: true, type: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity
  field :selector, 4, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelector
  field :averageValue, 5, optional: true, type: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity
end

defmodule K8s.Io.Api.Autoscaling.V2beta1.PodsMetricSource do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metricName: String.t(),
          targetAverageValue: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity.t() | nil,
          selector: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelector.t() | nil
        }
  defstruct [:metricName, :targetAverageValue, :selector]

  field :metricName, 1, optional: true, type: :string

  field :targetAverageValue, 2,
    optional: true,
    type: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity

  field :selector, 3, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelector
end

defmodule K8s.Io.Api.Autoscaling.V2beta1.PodsMetricStatus do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metricName: String.t(),
          currentAverageValue: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity.t() | nil,
          selector: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelector.t() | nil
        }
  defstruct [:metricName, :currentAverageValue, :selector]

  field :metricName, 1, optional: true, type: :string

  field :currentAverageValue, 2,
    optional: true,
    type: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity

  field :selector, 3, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelector
end

defmodule K8s.Io.Api.Autoscaling.V2beta1.ResourceMetricSource do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          name: String.t(),
          targetAverageUtilization: integer,
          targetAverageValue: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity.t() | nil
        }
  defstruct [:name, :targetAverageUtilization, :targetAverageValue]

  field :name, 1, optional: true, type: :string
  field :targetAverageUtilization, 2, optional: true, type: :int32

  field :targetAverageValue, 3,
    optional: true,
    type: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity
end

defmodule K8s.Io.Api.Autoscaling.V2beta1.ResourceMetricStatus do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          name: String.t(),
          currentAverageUtilization: integer,
          currentAverageValue: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity.t() | nil
        }
  defstruct [:name, :currentAverageUtilization, :currentAverageValue]

  field :name, 1, optional: true, type: :string
  field :currentAverageUtilization, 2, optional: true, type: :int32

  field :currentAverageValue, 3,
    optional: true,
    type: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity
end
