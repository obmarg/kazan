defmodule K8s.Io.Metrics.Pkg.Apis.CustomMetrics.V1beta2.MetricIdentifier do
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

defmodule K8s.Io.Metrics.Pkg.Apis.CustomMetrics.V1beta2.MetricListOptions do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          labelSelector: String.t(),
          metricLabelSelector: String.t()
        }
  defstruct [:labelSelector, :metricLabelSelector]

  field :labelSelector, 1, optional: true, type: :string
  field :metricLabelSelector, 2, optional: true, type: :string
end

defmodule K8s.Io.Metrics.Pkg.Apis.CustomMetrics.V1beta2.MetricValue do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          describedObject: K8s.Io.Api.Core.V1.ObjectReference.t() | nil,
          metric: K8s.Io.Metrics.Pkg.Apis.CustomMetrics.V1beta2.MetricIdentifier.t() | nil,
          timestamp: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time.t() | nil,
          windowSeconds: integer,
          value: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity.t() | nil
        }
  defstruct [:describedObject, :metric, :timestamp, :windowSeconds, :value]

  field :describedObject, 1, optional: true, type: K8s.Io.Api.Core.V1.ObjectReference

  field :metric, 2,
    optional: true,
    type: K8s.Io.Metrics.Pkg.Apis.CustomMetrics.V1beta2.MetricIdentifier

  field :timestamp, 3, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time
  field :windowSeconds, 4, optional: true, type: :int64
  field :value, 5, optional: true, type: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity
end

defmodule K8s.Io.Metrics.Pkg.Apis.CustomMetrics.V1beta2.MetricValueList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [K8s.Io.Metrics.Pkg.Apis.CustomMetrics.V1beta2.MetricValue.t()]
        }
  defstruct [:metadata, :items]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta
  field :items, 2, repeated: true, type: K8s.Io.Metrics.Pkg.Apis.CustomMetrics.V1beta2.MetricValue
end
