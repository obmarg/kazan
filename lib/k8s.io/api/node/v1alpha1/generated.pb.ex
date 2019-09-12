defmodule K8s.Io.Api.Node.V1alpha1.Overhead do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          podFixed: %{String.t() => K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity.t() | nil}
        }
  defstruct [:podFixed]

  field :podFixed, 1,
    repeated: true,
    type: K8s.Io.Api.Node.V1alpha1.Overhead.PodFixedEntry,
    map: true
end

defmodule K8s.Io.Api.Node.V1alpha1.Overhead.PodFixedEntry do
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

defmodule K8s.Io.Api.Node.V1alpha1.RuntimeClass do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          spec: K8s.Io.Api.Node.V1alpha1.RuntimeClassSpec.t() | nil
        }
  defstruct [:metadata, :spec]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :spec, 2, optional: true, type: K8s.Io.Api.Node.V1alpha1.RuntimeClassSpec
end

defmodule K8s.Io.Api.Node.V1alpha1.RuntimeClassList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [K8s.Io.Api.Node.V1alpha1.RuntimeClass.t()]
        }
  defstruct [:metadata, :items]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta
  field :items, 2, repeated: true, type: K8s.Io.Api.Node.V1alpha1.RuntimeClass
end

defmodule K8s.Io.Api.Node.V1alpha1.RuntimeClassSpec do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          runtimeHandler: String.t(),
          overhead: K8s.Io.Api.Node.V1alpha1.Overhead.t() | nil,
          scheduling: K8s.Io.Api.Node.V1alpha1.Scheduling.t() | nil
        }
  defstruct [:runtimeHandler, :overhead, :scheduling]

  field :runtimeHandler, 1, optional: true, type: :string
  field :overhead, 2, optional: true, type: K8s.Io.Api.Node.V1alpha1.Overhead
  field :scheduling, 3, optional: true, type: K8s.Io.Api.Node.V1alpha1.Scheduling
end

defmodule K8s.Io.Api.Node.V1alpha1.Scheduling do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          nodeSelector: %{String.t() => String.t()},
          tolerations: [K8s.Io.Api.Core.V1.Toleration.t()]
        }
  defstruct [:nodeSelector, :tolerations]

  field :nodeSelector, 1,
    repeated: true,
    type: K8s.Io.Api.Node.V1alpha1.Scheduling.NodeSelectorEntry,
    map: true

  field :tolerations, 2, repeated: true, type: K8s.Io.Api.Core.V1.Toleration
end

defmodule K8s.Io.Api.Node.V1alpha1.Scheduling.NodeSelectorEntry do
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
