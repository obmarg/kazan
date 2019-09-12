defmodule K8s.Io.Metrics.Pkg.Apis.Metrics.V1alpha1.ContainerMetrics do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          name: String.t(),
          usage: %{String.t() => K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity.t() | nil}
        }
  defstruct [:name, :usage]

  field :name, 1, optional: true, type: :string

  field :usage, 2,
    repeated: true,
    type: K8s.Io.Metrics.Pkg.Apis.Metrics.V1alpha1.ContainerMetrics.UsageEntry,
    map: true
end

defmodule K8s.Io.Metrics.Pkg.Apis.Metrics.V1alpha1.ContainerMetrics.UsageEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto2

  @type t :: %__MODULE__{
          key: String.t(),
          value: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity.t() | nil
        }
  defstruct [:key, :value]

  field :key, 1, optional: true, type: :string
  field :value, 2, optional: true, type: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity
end

defmodule K8s.Io.Metrics.Pkg.Apis.Metrics.V1alpha1.NodeMetrics do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          timestamp: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time.t() | nil,
          window: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Duration.t() | nil,
          usage: %{String.t() => K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity.t() | nil}
        }
  defstruct [:metadata, :timestamp, :window, :usage]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :timestamp, 2, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time
  field :window, 3, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Duration

  field :usage, 4,
    repeated: true,
    type: K8s.Io.Metrics.Pkg.Apis.Metrics.V1alpha1.NodeMetrics.UsageEntry,
    map: true
end

defmodule K8s.Io.Metrics.Pkg.Apis.Metrics.V1alpha1.NodeMetrics.UsageEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto2

  @type t :: %__MODULE__{
          key: String.t(),
          value: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity.t() | nil
        }
  defstruct [:key, :value]

  field :key, 1, optional: true, type: :string
  field :value, 2, optional: true, type: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity
end

defmodule K8s.Io.Metrics.Pkg.Apis.Metrics.V1alpha1.NodeMetricsList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [K8s.Io.Metrics.Pkg.Apis.Metrics.V1alpha1.NodeMetrics.t()]
        }
  defstruct [:metadata, :items]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta
  field :items, 2, repeated: true, type: K8s.Io.Metrics.Pkg.Apis.Metrics.V1alpha1.NodeMetrics
end

defmodule K8s.Io.Metrics.Pkg.Apis.Metrics.V1alpha1.PodMetrics do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          timestamp: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time.t() | nil,
          window: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Duration.t() | nil,
          containers: [K8s.Io.Metrics.Pkg.Apis.Metrics.V1alpha1.ContainerMetrics.t()]
        }
  defstruct [:metadata, :timestamp, :window, :containers]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :timestamp, 2, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time
  field :window, 3, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Duration

  field :containers, 4,
    repeated: true,
    type: K8s.Io.Metrics.Pkg.Apis.Metrics.V1alpha1.ContainerMetrics
end

defmodule K8s.Io.Metrics.Pkg.Apis.Metrics.V1alpha1.PodMetricsList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [K8s.Io.Metrics.Pkg.Apis.Metrics.V1alpha1.PodMetrics.t()]
        }
  defstruct [:metadata, :items]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta
  field :items, 2, repeated: true, type: K8s.Io.Metrics.Pkg.Apis.Metrics.V1alpha1.PodMetrics
end
