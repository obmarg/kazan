defmodule K8s.Io.Metrics.Pkg.Apis.CustomMetrics.V1beta1.MetricListOptions do
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

defmodule K8s.Io.Metrics.Pkg.Apis.CustomMetrics.V1beta1.MetricValue do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          describedObject: K8s.Io.Api.Core.V1.ObjectReference.t() | nil,
          metricName: String.t(),
          timestamp: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time.t() | nil,
          window: integer,
          value: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity.t() | nil,
          selector: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelector.t() | nil
        }
  defstruct [:describedObject, :metricName, :timestamp, :window, :value, :selector]

  field :describedObject, 1, optional: true, type: K8s.Io.Api.Core.V1.ObjectReference
  field :metricName, 2, optional: true, type: :string
  field :timestamp, 3, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time
  field :window, 4, optional: true, type: :int64
  field :value, 5, optional: true, type: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity
  field :selector, 6, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelector
end

defmodule K8s.Io.Metrics.Pkg.Apis.CustomMetrics.V1beta1.MetricValueList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [K8s.Io.Metrics.Pkg.Apis.CustomMetrics.V1beta1.MetricValue.t()]
        }
  defstruct [:metadata, :items]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta
  field :items, 2, repeated: true, type: K8s.Io.Metrics.Pkg.Apis.CustomMetrics.V1beta1.MetricValue
end
