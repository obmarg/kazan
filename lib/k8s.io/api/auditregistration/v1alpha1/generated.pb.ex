defmodule K8s.Io.Api.Auditregistration.V1alpha1.AuditSink do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          spec: K8s.Io.Api.Auditregistration.V1alpha1.AuditSinkSpec.t() | nil
        }
  defstruct [:metadata, :spec]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :spec, 2, optional: true, type: K8s.Io.Api.Auditregistration.V1alpha1.AuditSinkSpec
end

defmodule K8s.Io.Api.Auditregistration.V1alpha1.AuditSinkList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [K8s.Io.Api.Auditregistration.V1alpha1.AuditSink.t()]
        }
  defstruct [:metadata, :items]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta
  field :items, 2, repeated: true, type: K8s.Io.Api.Auditregistration.V1alpha1.AuditSink
end

defmodule K8s.Io.Api.Auditregistration.V1alpha1.AuditSinkSpec do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          policy: K8s.Io.Api.Auditregistration.V1alpha1.Policy.t() | nil,
          webhook: K8s.Io.Api.Auditregistration.V1alpha1.Webhook.t() | nil
        }
  defstruct [:policy, :webhook]

  field :policy, 1, optional: true, type: K8s.Io.Api.Auditregistration.V1alpha1.Policy
  field :webhook, 2, optional: true, type: K8s.Io.Api.Auditregistration.V1alpha1.Webhook
end

defmodule K8s.Io.Api.Auditregistration.V1alpha1.Policy do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          level: String.t(),
          stages: [String.t()]
        }
  defstruct [:level, :stages]

  field :level, 1, optional: true, type: :string
  field :stages, 2, repeated: true, type: :string
end

defmodule K8s.Io.Api.Auditregistration.V1alpha1.ServiceReference do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          namespace: String.t(),
          name: String.t(),
          path: String.t(),
          port: integer
        }
  defstruct [:namespace, :name, :path, :port]

  field :namespace, 1, optional: true, type: :string
  field :name, 2, optional: true, type: :string
  field :path, 3, optional: true, type: :string
  field :port, 4, optional: true, type: :int32
end

defmodule K8s.Io.Api.Auditregistration.V1alpha1.Webhook do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          throttle: K8s.Io.Api.Auditregistration.V1alpha1.WebhookThrottleConfig.t() | nil,
          clientConfig: K8s.Io.Api.Auditregistration.V1alpha1.WebhookClientConfig.t() | nil
        }
  defstruct [:throttle, :clientConfig]

  field :throttle, 1,
    optional: true,
    type: K8s.Io.Api.Auditregistration.V1alpha1.WebhookThrottleConfig

  field :clientConfig, 2,
    optional: true,
    type: K8s.Io.Api.Auditregistration.V1alpha1.WebhookClientConfig
end

defmodule K8s.Io.Api.Auditregistration.V1alpha1.WebhookClientConfig do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          url: String.t(),
          service: K8s.Io.Api.Auditregistration.V1alpha1.ServiceReference.t() | nil,
          caBundle: binary
        }
  defstruct [:url, :service, :caBundle]

  field :url, 1, optional: true, type: :string
  field :service, 2, optional: true, type: K8s.Io.Api.Auditregistration.V1alpha1.ServiceReference
  field :caBundle, 3, optional: true, type: :bytes
end

defmodule K8s.Io.Api.Auditregistration.V1alpha1.WebhookThrottleConfig do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          qps: integer,
          burst: integer
        }
  defstruct [:qps, :burst]

  field :qps, 1, optional: true, type: :int64
  field :burst, 2, optional: true, type: :int64
end
