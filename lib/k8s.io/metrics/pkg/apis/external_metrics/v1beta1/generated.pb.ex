defmodule K8s.Io.Metrics.Pkg.Apis.ExternalMetrics.V1beta1.ExternalMetricValue do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metricName: String.t(),
          metricLabels: %{String.t() => String.t()},
          timestamp: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time.t() | nil,
          window: integer,
          value: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity.t() | nil
        }
  defstruct [:metricName, :metricLabels, :timestamp, :window, :value]

  field :metricName, 1, optional: true, type: :string

  field :metricLabels, 2,
    repeated: true,
    type: K8s.Io.Metrics.Pkg.Apis.ExternalMetrics.V1beta1.ExternalMetricValue.MetricLabelsEntry,
    map: true

  field :timestamp, 3, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time
  field :window, 4, optional: true, type: :int64
  field :value, 5, optional: true, type: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity
end

defmodule K8s.Io.Metrics.Pkg.Apis.ExternalMetrics.V1beta1.ExternalMetricValue.MetricLabelsEntry do
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

defmodule K8s.Io.Metrics.Pkg.Apis.ExternalMetrics.V1beta1.ExternalMetricValueList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [K8s.Io.Metrics.Pkg.Apis.ExternalMetrics.V1beta1.ExternalMetricValue.t()]
        }
  defstruct [:metadata, :items]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta

  field :items, 2,
    repeated: true,
    type: K8s.Io.Metrics.Pkg.Apis.ExternalMetrics.V1beta1.ExternalMetricValue
end
