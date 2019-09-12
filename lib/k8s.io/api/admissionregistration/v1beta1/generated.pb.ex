defmodule K8s.Io.Api.Admissionregistration.V1beta1.MutatingWebhook do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          name: String.t(),
          clientConfig: K8s.Io.Api.Admissionregistration.V1beta1.WebhookClientConfig.t() | nil,
          rules: [K8s.Io.Api.Admissionregistration.V1beta1.RuleWithOperations.t()],
          failurePolicy: String.t(),
          matchPolicy: String.t(),
          namespaceSelector: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelector.t() | nil,
          objectSelector: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelector.t() | nil,
          sideEffects: String.t(),
          timeoutSeconds: integer,
          admissionReviewVersions: [String.t()],
          reinvocationPolicy: String.t()
        }
  defstruct [
    :name,
    :clientConfig,
    :rules,
    :failurePolicy,
    :matchPolicy,
    :namespaceSelector,
    :objectSelector,
    :sideEffects,
    :timeoutSeconds,
    :admissionReviewVersions,
    :reinvocationPolicy
  ]

  field :name, 1, optional: true, type: :string

  field :clientConfig, 2,
    optional: true,
    type: K8s.Io.Api.Admissionregistration.V1beta1.WebhookClientConfig

  field :rules, 3,
    repeated: true,
    type: K8s.Io.Api.Admissionregistration.V1beta1.RuleWithOperations

  field :failurePolicy, 4, optional: true, type: :string
  field :matchPolicy, 9, optional: true, type: :string

  field :namespaceSelector, 5,
    optional: true,
    type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelector

  field :objectSelector, 11,
    optional: true,
    type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelector

  field :sideEffects, 6, optional: true, type: :string
  field :timeoutSeconds, 7, optional: true, type: :int32
  field :admissionReviewVersions, 8, repeated: true, type: :string
  field :reinvocationPolicy, 10, optional: true, type: :string
end

defmodule K8s.Io.Api.Admissionregistration.V1beta1.MutatingWebhookConfiguration do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          Webhooks: [K8s.Io.Api.Admissionregistration.V1beta1.MutatingWebhook.t()]
        }
  defstruct [:metadata, :Webhooks]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta

  field :Webhooks, 2,
    repeated: true,
    type: K8s.Io.Api.Admissionregistration.V1beta1.MutatingWebhook
end

defmodule K8s.Io.Api.Admissionregistration.V1beta1.MutatingWebhookConfigurationList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [K8s.Io.Api.Admissionregistration.V1beta1.MutatingWebhookConfiguration.t()]
        }
  defstruct [:metadata, :items]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta

  field :items, 2,
    repeated: true,
    type: K8s.Io.Api.Admissionregistration.V1beta1.MutatingWebhookConfiguration
end

defmodule K8s.Io.Api.Admissionregistration.V1beta1.Rule do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          apiGroups: [String.t()],
          apiVersions: [String.t()],
          resources: [String.t()],
          scope: String.t()
        }
  defstruct [:apiGroups, :apiVersions, :resources, :scope]

  field :apiGroups, 1, repeated: true, type: :string
  field :apiVersions, 2, repeated: true, type: :string
  field :resources, 3, repeated: true, type: :string
  field :scope, 4, optional: true, type: :string
end

defmodule K8s.Io.Api.Admissionregistration.V1beta1.RuleWithOperations do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          operations: [String.t()],
          rule: K8s.Io.Api.Admissionregistration.V1beta1.Rule.t() | nil
        }
  defstruct [:operations, :rule]

  field :operations, 1, repeated: true, type: :string
  field :rule, 2, optional: true, type: K8s.Io.Api.Admissionregistration.V1beta1.Rule
end

defmodule K8s.Io.Api.Admissionregistration.V1beta1.ServiceReference do
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

defmodule K8s.Io.Api.Admissionregistration.V1beta1.ValidatingWebhook do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          name: String.t(),
          clientConfig: K8s.Io.Api.Admissionregistration.V1beta1.WebhookClientConfig.t() | nil,
          rules: [K8s.Io.Api.Admissionregistration.V1beta1.RuleWithOperations.t()],
          failurePolicy: String.t(),
          matchPolicy: String.t(),
          namespaceSelector: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelector.t() | nil,
          objectSelector: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelector.t() | nil,
          sideEffects: String.t(),
          timeoutSeconds: integer,
          admissionReviewVersions: [String.t()]
        }
  defstruct [
    :name,
    :clientConfig,
    :rules,
    :failurePolicy,
    :matchPolicy,
    :namespaceSelector,
    :objectSelector,
    :sideEffects,
    :timeoutSeconds,
    :admissionReviewVersions
  ]

  field :name, 1, optional: true, type: :string

  field :clientConfig, 2,
    optional: true,
    type: K8s.Io.Api.Admissionregistration.V1beta1.WebhookClientConfig

  field :rules, 3,
    repeated: true,
    type: K8s.Io.Api.Admissionregistration.V1beta1.RuleWithOperations

  field :failurePolicy, 4, optional: true, type: :string
  field :matchPolicy, 9, optional: true, type: :string

  field :namespaceSelector, 5,
    optional: true,
    type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelector

  field :objectSelector, 10,
    optional: true,
    type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelector

  field :sideEffects, 6, optional: true, type: :string
  field :timeoutSeconds, 7, optional: true, type: :int32
  field :admissionReviewVersions, 8, repeated: true, type: :string
end

defmodule K8s.Io.Api.Admissionregistration.V1beta1.ValidatingWebhookConfiguration do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          Webhooks: [K8s.Io.Api.Admissionregistration.V1beta1.ValidatingWebhook.t()]
        }
  defstruct [:metadata, :Webhooks]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta

  field :Webhooks, 2,
    repeated: true,
    type: K8s.Io.Api.Admissionregistration.V1beta1.ValidatingWebhook
end

defmodule K8s.Io.Api.Admissionregistration.V1beta1.ValidatingWebhookConfigurationList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [K8s.Io.Api.Admissionregistration.V1beta1.ValidatingWebhookConfiguration.t()]
        }
  defstruct [:metadata, :items]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta

  field :items, 2,
    repeated: true,
    type: K8s.Io.Api.Admissionregistration.V1beta1.ValidatingWebhookConfiguration
end

defmodule K8s.Io.Api.Admissionregistration.V1beta1.WebhookClientConfig do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          url: String.t(),
          service: K8s.Io.Api.Admissionregistration.V1beta1.ServiceReference.t() | nil,
          caBundle: binary
        }
  defstruct [:url, :service, :caBundle]

  field :url, 3, optional: true, type: :string

  field :service, 1,
    optional: true,
    type: K8s.Io.Api.Admissionregistration.V1beta1.ServiceReference

  field :caBundle, 2, optional: true, type: :bytes
end
