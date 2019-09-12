defmodule K8s.Io.Api.Node.V1beta1.Overhead do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          podFixed: %{String.t() => K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity.t() | nil}
        }
  defstruct [:podFixed]

  field :podFixed, 1,
    repeated: true,
    type: K8s.Io.Api.Node.V1beta1.Overhead.PodFixedEntry,
    map: true
end

defmodule K8s.Io.Api.Node.V1beta1.Overhead.PodFixedEntry do
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

defmodule K8s.Io.Api.Node.V1beta1.RuntimeClass do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          handler: String.t(),
          overhead: K8s.Io.Api.Node.V1beta1.Overhead.t() | nil,
          scheduling: K8s.Io.Api.Node.V1beta1.Scheduling.t() | nil
        }
  defstruct [:metadata, :handler, :overhead, :scheduling]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :handler, 2, optional: true, type: :string
  field :overhead, 3, optional: true, type: K8s.Io.Api.Node.V1beta1.Overhead
  field :scheduling, 4, optional: true, type: K8s.Io.Api.Node.V1beta1.Scheduling
end

defmodule K8s.Io.Api.Node.V1beta1.RuntimeClassList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [K8s.Io.Api.Node.V1beta1.RuntimeClass.t()]
        }
  defstruct [:metadata, :items]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta
  field :items, 2, repeated: true, type: K8s.Io.Api.Node.V1beta1.RuntimeClass
end

defmodule K8s.Io.Api.Node.V1beta1.Scheduling do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          nodeSelector: %{String.t() => String.t()},
          tolerations: [K8s.Io.Api.Core.V1.Toleration.t()]
        }
  defstruct [:nodeSelector, :tolerations]

  field :nodeSelector, 1,
    repeated: true,
    type: K8s.Io.Api.Node.V1beta1.Scheduling.NodeSelectorEntry,
    map: true

  field :tolerations, 2, repeated: true, type: K8s.Io.Api.Core.V1.Toleration
end

defmodule K8s.Io.Api.Node.V1beta1.Scheduling.NodeSelectorEntry do
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
