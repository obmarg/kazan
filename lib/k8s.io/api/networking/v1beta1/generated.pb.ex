defmodule K8s.Io.Api.Networking.V1beta1.HTTPIngressPath do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          path: String.t(),
          backend: K8s.Io.Api.Networking.V1beta1.IngressBackend.t() | nil
        }
  defstruct [:path, :backend]

  field :path, 1, optional: true, type: :string
  field :backend, 2, optional: true, type: K8s.Io.Api.Networking.V1beta1.IngressBackend
end

defmodule K8s.Io.Api.Networking.V1beta1.HTTPIngressRuleValue do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          paths: [K8s.Io.Api.Networking.V1beta1.HTTPIngressPath.t()]
        }
  defstruct [:paths]

  field :paths, 1, repeated: true, type: K8s.Io.Api.Networking.V1beta1.HTTPIngressPath
end

defmodule K8s.Io.Api.Networking.V1beta1.Ingress do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          spec: K8s.Io.Api.Networking.V1beta1.IngressSpec.t() | nil,
          status: K8s.Io.Api.Networking.V1beta1.IngressStatus.t() | nil
        }
  defstruct [:metadata, :spec, :status]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :spec, 2, optional: true, type: K8s.Io.Api.Networking.V1beta1.IngressSpec
  field :status, 3, optional: true, type: K8s.Io.Api.Networking.V1beta1.IngressStatus
end

defmodule K8s.Io.Api.Networking.V1beta1.IngressBackend do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          serviceName: String.t(),
          servicePort: K8s.Io.Apimachinery.Pkg.Util.Intstr.IntOrString.t() | nil
        }
  defstruct [:serviceName, :servicePort]

  field :serviceName, 1, optional: true, type: :string
  field :servicePort, 2, optional: true, type: K8s.Io.Apimachinery.Pkg.Util.Intstr.IntOrString
end

defmodule K8s.Io.Api.Networking.V1beta1.IngressList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [K8s.Io.Api.Networking.V1beta1.Ingress.t()]
        }
  defstruct [:metadata, :items]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta
  field :items, 2, repeated: true, type: K8s.Io.Api.Networking.V1beta1.Ingress
end

defmodule K8s.Io.Api.Networking.V1beta1.IngressRule do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          host: String.t(),
          ingressRuleValue: K8s.Io.Api.Networking.V1beta1.IngressRuleValue.t() | nil
        }
  defstruct [:host, :ingressRuleValue]

  field :host, 1, optional: true, type: :string
  field :ingressRuleValue, 2, optional: true, type: K8s.Io.Api.Networking.V1beta1.IngressRuleValue
end

defmodule K8s.Io.Api.Networking.V1beta1.IngressRuleValue do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          http: K8s.Io.Api.Networking.V1beta1.HTTPIngressRuleValue.t() | nil
        }
  defstruct [:http]

  field :http, 1, optional: true, type: K8s.Io.Api.Networking.V1beta1.HTTPIngressRuleValue
end

defmodule K8s.Io.Api.Networking.V1beta1.IngressSpec do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          backend: K8s.Io.Api.Networking.V1beta1.IngressBackend.t() | nil,
          tls: [K8s.Io.Api.Networking.V1beta1.IngressTLS.t()],
          rules: [K8s.Io.Api.Networking.V1beta1.IngressRule.t()]
        }
  defstruct [:backend, :tls, :rules]

  field :backend, 1, optional: true, type: K8s.Io.Api.Networking.V1beta1.IngressBackend
  field :tls, 2, repeated: true, type: K8s.Io.Api.Networking.V1beta1.IngressTLS
  field :rules, 3, repeated: true, type: K8s.Io.Api.Networking.V1beta1.IngressRule
end

defmodule K8s.Io.Api.Networking.V1beta1.IngressStatus do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          loadBalancer: K8s.Io.Api.Core.V1.LoadBalancerStatus.t() | nil
        }
  defstruct [:loadBalancer]

  field :loadBalancer, 1, optional: true, type: K8s.Io.Api.Core.V1.LoadBalancerStatus
end

defmodule K8s.Io.Api.Networking.V1beta1.IngressTLS do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          hosts: [String.t()],
          secretName: String.t()
        }
  defstruct [:hosts, :secretName]

  field :hosts, 1, repeated: true, type: :string
  field :secretName, 2, optional: true, type: :string
end
