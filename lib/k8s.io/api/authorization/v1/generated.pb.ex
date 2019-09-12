defmodule K8s.Io.Api.Authorization.V1.ExtraValue do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          items: [String.t()]
        }
  defstruct [:items]

  field :items, 1, repeated: true, type: :string
end

defmodule K8s.Io.Api.Authorization.V1.LocalSubjectAccessReview do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          spec: K8s.Io.Api.Authorization.V1.SubjectAccessReviewSpec.t() | nil,
          status: K8s.Io.Api.Authorization.V1.SubjectAccessReviewStatus.t() | nil
        }
  defstruct [:metadata, :spec, :status]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :spec, 2, optional: true, type: K8s.Io.Api.Authorization.V1.SubjectAccessReviewSpec
  field :status, 3, optional: true, type: K8s.Io.Api.Authorization.V1.SubjectAccessReviewStatus
end

defmodule K8s.Io.Api.Authorization.V1.NonResourceAttributes do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          path: String.t(),
          verb: String.t()
        }
  defstruct [:path, :verb]

  field :path, 1, optional: true, type: :string
  field :verb, 2, optional: true, type: :string
end

defmodule K8s.Io.Api.Authorization.V1.NonResourceRule do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          verbs: [String.t()],
          nonResourceURLs: [String.t()]
        }
  defstruct [:verbs, :nonResourceURLs]

  field :verbs, 1, repeated: true, type: :string
  field :nonResourceURLs, 2, repeated: true, type: :string
end

defmodule K8s.Io.Api.Authorization.V1.ResourceAttributes do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          namespace: String.t(),
          verb: String.t(),
          group: String.t(),
          version: String.t(),
          resource: String.t(),
          subresource: String.t(),
          name: String.t()
        }
  defstruct [:namespace, :verb, :group, :version, :resource, :subresource, :name]

  field :namespace, 1, optional: true, type: :string
  field :verb, 2, optional: true, type: :string
  field :group, 3, optional: true, type: :string
  field :version, 4, optional: true, type: :string
  field :resource, 5, optional: true, type: :string
  field :subresource, 6, optional: true, type: :string
  field :name, 7, optional: true, type: :string
end

defmodule K8s.Io.Api.Authorization.V1.ResourceRule do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          verbs: [String.t()],
          apiGroups: [String.t()],
          resources: [String.t()],
          resourceNames: [String.t()]
        }
  defstruct [:verbs, :apiGroups, :resources, :resourceNames]

  field :verbs, 1, repeated: true, type: :string
  field :apiGroups, 2, repeated: true, type: :string
  field :resources, 3, repeated: true, type: :string
  field :resourceNames, 4, repeated: true, type: :string
end

defmodule K8s.Io.Api.Authorization.V1.SelfSubjectAccessReview do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          spec: K8s.Io.Api.Authorization.V1.SelfSubjectAccessReviewSpec.t() | nil,
          status: K8s.Io.Api.Authorization.V1.SubjectAccessReviewStatus.t() | nil
        }
  defstruct [:metadata, :spec, :status]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :spec, 2, optional: true, type: K8s.Io.Api.Authorization.V1.SelfSubjectAccessReviewSpec
  field :status, 3, optional: true, type: K8s.Io.Api.Authorization.V1.SubjectAccessReviewStatus
end

defmodule K8s.Io.Api.Authorization.V1.SelfSubjectAccessReviewSpec do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          resourceAttributes: K8s.Io.Api.Authorization.V1.ResourceAttributes.t() | nil,
          nonResourceAttributes: K8s.Io.Api.Authorization.V1.NonResourceAttributes.t() | nil
        }
  defstruct [:resourceAttributes, :nonResourceAttributes]

  field :resourceAttributes, 1,
    optional: true,
    type: K8s.Io.Api.Authorization.V1.ResourceAttributes

  field :nonResourceAttributes, 2,
    optional: true,
    type: K8s.Io.Api.Authorization.V1.NonResourceAttributes
end

defmodule K8s.Io.Api.Authorization.V1.SelfSubjectRulesReview do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          spec: K8s.Io.Api.Authorization.V1.SelfSubjectRulesReviewSpec.t() | nil,
          status: K8s.Io.Api.Authorization.V1.SubjectRulesReviewStatus.t() | nil
        }
  defstruct [:metadata, :spec, :status]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :spec, 2, optional: true, type: K8s.Io.Api.Authorization.V1.SelfSubjectRulesReviewSpec
  field :status, 3, optional: true, type: K8s.Io.Api.Authorization.V1.SubjectRulesReviewStatus
end

defmodule K8s.Io.Api.Authorization.V1.SelfSubjectRulesReviewSpec do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          namespace: String.t()
        }
  defstruct [:namespace]

  field :namespace, 1, optional: true, type: :string
end

defmodule K8s.Io.Api.Authorization.V1.SubjectAccessReview do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          spec: K8s.Io.Api.Authorization.V1.SubjectAccessReviewSpec.t() | nil,
          status: K8s.Io.Api.Authorization.V1.SubjectAccessReviewStatus.t() | nil
        }
  defstruct [:metadata, :spec, :status]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :spec, 2, optional: true, type: K8s.Io.Api.Authorization.V1.SubjectAccessReviewSpec
  field :status, 3, optional: true, type: K8s.Io.Api.Authorization.V1.SubjectAccessReviewStatus
end

defmodule K8s.Io.Api.Authorization.V1.SubjectAccessReviewSpec do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          resourceAttributes: K8s.Io.Api.Authorization.V1.ResourceAttributes.t() | nil,
          nonResourceAttributes: K8s.Io.Api.Authorization.V1.NonResourceAttributes.t() | nil,
          user: String.t(),
          groups: [String.t()],
          extra: %{String.t() => K8s.Io.Api.Authorization.V1.ExtraValue.t() | nil},
          uid: String.t()
        }
  defstruct [:resourceAttributes, :nonResourceAttributes, :user, :groups, :extra, :uid]

  field :resourceAttributes, 1,
    optional: true,
    type: K8s.Io.Api.Authorization.V1.ResourceAttributes

  field :nonResourceAttributes, 2,
    optional: true,
    type: K8s.Io.Api.Authorization.V1.NonResourceAttributes

  field :user, 3, optional: true, type: :string
  field :groups, 4, repeated: true, type: :string

  field :extra, 5,
    repeated: true,
    type: K8s.Io.Api.Authorization.V1.SubjectAccessReviewSpec.ExtraEntry,
    map: true

  field :uid, 6, optional: true, type: :string
end

defmodule K8s.Io.Api.Authorization.V1.SubjectAccessReviewSpec.ExtraEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto2

  @type t :: %__MODULE__{
          key: String.t(),
          value: K8s.Io.Api.Authorization.V1.ExtraValue.t() | nil
        }
  defstruct [:key, :value]

  field :key, 1, optional: true, type: :string
  field :value, 2, optional: true, type: K8s.Io.Api.Authorization.V1.ExtraValue
end

defmodule K8s.Io.Api.Authorization.V1.SubjectAccessReviewStatus do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          allowed: boolean,
          denied: boolean,
          reason: String.t(),
          evaluationError: String.t()
        }
  defstruct [:allowed, :denied, :reason, :evaluationError]

  field :allowed, 1, optional: true, type: :bool
  field :denied, 4, optional: true, type: :bool
  field :reason, 2, optional: true, type: :string
  field :evaluationError, 3, optional: true, type: :string
end

defmodule K8s.Io.Api.Authorization.V1.SubjectRulesReviewStatus do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          resourceRules: [K8s.Io.Api.Authorization.V1.ResourceRule.t()],
          nonResourceRules: [K8s.Io.Api.Authorization.V1.NonResourceRule.t()],
          incomplete: boolean,
          evaluationError: String.t()
        }
  defstruct [:resourceRules, :nonResourceRules, :incomplete, :evaluationError]

  field :resourceRules, 1, repeated: true, type: K8s.Io.Api.Authorization.V1.ResourceRule
  field :nonResourceRules, 2, repeated: true, type: K8s.Io.Api.Authorization.V1.NonResourceRule
  field :incomplete, 3, optional: true, type: :bool
  field :evaluationError, 4, optional: true, type: :string
end
