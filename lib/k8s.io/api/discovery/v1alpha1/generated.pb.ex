defmodule K8s.Io.Api.Discovery.V1alpha1.Endpoint do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          addresses: [String.t()],
          conditions: K8s.Io.Api.Discovery.V1alpha1.EndpointConditions.t() | nil,
          hostname: String.t(),
          targetRef: K8s.Io.Api.Core.V1.ObjectReference.t() | nil,
          topology: %{String.t() => String.t()}
        }
  defstruct [:addresses, :conditions, :hostname, :targetRef, :topology]

  field :addresses, 1, repeated: true, type: :string
  field :conditions, 2, optional: true, type: K8s.Io.Api.Discovery.V1alpha1.EndpointConditions
  field :hostname, 3, optional: true, type: :string
  field :targetRef, 4, optional: true, type: K8s.Io.Api.Core.V1.ObjectReference

  field :topology, 5,
    repeated: true,
    type: K8s.Io.Api.Discovery.V1alpha1.Endpoint.TopologyEntry,
    map: true
end

defmodule K8s.Io.Api.Discovery.V1alpha1.Endpoint.TopologyEntry do
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

defmodule K8s.Io.Api.Discovery.V1alpha1.EndpointConditions do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          ready: boolean
        }
  defstruct [:ready]

  field :ready, 1, optional: true, type: :bool
end

defmodule K8s.Io.Api.Discovery.V1alpha1.EndpointPort do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          name: String.t(),
          protocol: String.t(),
          port: integer
        }
  defstruct [:name, :protocol, :port]

  field :name, 1, optional: true, type: :string
  field :protocol, 2, optional: true, type: :string
  field :port, 3, optional: true, type: :int32
end

defmodule K8s.Io.Api.Discovery.V1alpha1.EndpointSlice do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          addressType: String.t(),
          endpoints: [K8s.Io.Api.Discovery.V1alpha1.Endpoint.t()],
          ports: [K8s.Io.Api.Discovery.V1alpha1.EndpointPort.t()]
        }
  defstruct [:metadata, :addressType, :endpoints, :ports]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :addressType, 4, optional: true, type: :string
  field :endpoints, 2, repeated: true, type: K8s.Io.Api.Discovery.V1alpha1.Endpoint
  field :ports, 3, repeated: true, type: K8s.Io.Api.Discovery.V1alpha1.EndpointPort
end

defmodule K8s.Io.Api.Discovery.V1alpha1.EndpointSliceList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [K8s.Io.Api.Discovery.V1alpha1.EndpointSlice.t()]
        }
  defstruct [:metadata, :items]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta
  field :items, 2, repeated: true, type: K8s.Io.Api.Discovery.V1alpha1.EndpointSlice
end
