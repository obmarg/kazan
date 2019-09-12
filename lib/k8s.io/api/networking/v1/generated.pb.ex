defmodule K8s.Io.Api.Networking.V1.IPBlock do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          cidr: String.t(),
          except: [String.t()]
        }
  defstruct [:cidr, :except]

  field :cidr, 1, optional: true, type: :string
  field :except, 2, repeated: true, type: :string
end

defmodule K8s.Io.Api.Networking.V1.NetworkPolicy do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          spec: K8s.Io.Api.Networking.V1.NetworkPolicySpec.t() | nil
        }
  defstruct [:metadata, :spec]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :spec, 2, optional: true, type: K8s.Io.Api.Networking.V1.NetworkPolicySpec
end

defmodule K8s.Io.Api.Networking.V1.NetworkPolicyEgressRule do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          ports: [K8s.Io.Api.Networking.V1.NetworkPolicyPort.t()],
          to: [K8s.Io.Api.Networking.V1.NetworkPolicyPeer.t()]
        }
  defstruct [:ports, :to]

  field :ports, 1, repeated: true, type: K8s.Io.Api.Networking.V1.NetworkPolicyPort
  field :to, 2, repeated: true, type: K8s.Io.Api.Networking.V1.NetworkPolicyPeer
end

defmodule K8s.Io.Api.Networking.V1.NetworkPolicyIngressRule do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          ports: [K8s.Io.Api.Networking.V1.NetworkPolicyPort.t()],
          from: [K8s.Io.Api.Networking.V1.NetworkPolicyPeer.t()]
        }
  defstruct [:ports, :from]

  field :ports, 1, repeated: true, type: K8s.Io.Api.Networking.V1.NetworkPolicyPort
  field :from, 2, repeated: true, type: K8s.Io.Api.Networking.V1.NetworkPolicyPeer
end

defmodule K8s.Io.Api.Networking.V1.NetworkPolicyList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [K8s.Io.Api.Networking.V1.NetworkPolicy.t()]
        }
  defstruct [:metadata, :items]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta
  field :items, 2, repeated: true, type: K8s.Io.Api.Networking.V1.NetworkPolicy
end

defmodule K8s.Io.Api.Networking.V1.NetworkPolicyPeer do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          podSelector: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelector.t() | nil,
          namespaceSelector: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelector.t() | nil,
          ipBlock: K8s.Io.Api.Networking.V1.IPBlock.t() | nil
        }
  defstruct [:podSelector, :namespaceSelector, :ipBlock]

  field :podSelector, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelector

  field :namespaceSelector, 2,
    optional: true,
    type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelector

  field :ipBlock, 3, optional: true, type: K8s.Io.Api.Networking.V1.IPBlock
end

defmodule K8s.Io.Api.Networking.V1.NetworkPolicyPort do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          protocol: String.t(),
          port: K8s.Io.Apimachinery.Pkg.Util.Intstr.IntOrString.t() | nil
        }
  defstruct [:protocol, :port]

  field :protocol, 1, optional: true, type: :string
  field :port, 2, optional: true, type: K8s.Io.Apimachinery.Pkg.Util.Intstr.IntOrString
end

defmodule K8s.Io.Api.Networking.V1.NetworkPolicySpec do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          podSelector: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelector.t() | nil,
          ingress: [K8s.Io.Api.Networking.V1.NetworkPolicyIngressRule.t()],
          egress: [K8s.Io.Api.Networking.V1.NetworkPolicyEgressRule.t()],
          policyTypes: [String.t()]
        }
  defstruct [:podSelector, :ingress, :egress, :policyTypes]

  field :podSelector, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelector
  field :ingress, 2, repeated: true, type: K8s.Io.Api.Networking.V1.NetworkPolicyIngressRule
  field :egress, 3, repeated: true, type: K8s.Io.Api.Networking.V1.NetworkPolicyEgressRule
  field :policyTypes, 4, repeated: true, type: :string
end
