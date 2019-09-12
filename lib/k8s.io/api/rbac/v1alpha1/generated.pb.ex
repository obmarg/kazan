defmodule K8s.Io.Api.Rbac.V1alpha1.AggregationRule do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          clusterRoleSelectors: [K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelector.t()]
        }
  defstruct [:clusterRoleSelectors]

  field :clusterRoleSelectors, 1,
    repeated: true,
    type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelector
end

defmodule K8s.Io.Api.Rbac.V1alpha1.ClusterRole do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          rules: [K8s.Io.Api.Rbac.V1alpha1.PolicyRule.t()],
          aggregationRule: K8s.Io.Api.Rbac.V1alpha1.AggregationRule.t() | nil
        }
  defstruct [:metadata, :rules, :aggregationRule]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :rules, 2, repeated: true, type: K8s.Io.Api.Rbac.V1alpha1.PolicyRule
  field :aggregationRule, 3, optional: true, type: K8s.Io.Api.Rbac.V1alpha1.AggregationRule
end

defmodule K8s.Io.Api.Rbac.V1alpha1.ClusterRoleBinding do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          subjects: [K8s.Io.Api.Rbac.V1alpha1.Subject.t()],
          roleRef: K8s.Io.Api.Rbac.V1alpha1.RoleRef.t() | nil
        }
  defstruct [:metadata, :subjects, :roleRef]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :subjects, 2, repeated: true, type: K8s.Io.Api.Rbac.V1alpha1.Subject
  field :roleRef, 3, optional: true, type: K8s.Io.Api.Rbac.V1alpha1.RoleRef
end

defmodule K8s.Io.Api.Rbac.V1alpha1.ClusterRoleBindingList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [K8s.Io.Api.Rbac.V1alpha1.ClusterRoleBinding.t()]
        }
  defstruct [:metadata, :items]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta
  field :items, 2, repeated: true, type: K8s.Io.Api.Rbac.V1alpha1.ClusterRoleBinding
end

defmodule K8s.Io.Api.Rbac.V1alpha1.ClusterRoleList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [K8s.Io.Api.Rbac.V1alpha1.ClusterRole.t()]
        }
  defstruct [:metadata, :items]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta
  field :items, 2, repeated: true, type: K8s.Io.Api.Rbac.V1alpha1.ClusterRole
end

defmodule K8s.Io.Api.Rbac.V1alpha1.PolicyRule do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          verbs: [String.t()],
          apiGroups: [String.t()],
          resources: [String.t()],
          resourceNames: [String.t()],
          nonResourceURLs: [String.t()]
        }
  defstruct [:verbs, :apiGroups, :resources, :resourceNames, :nonResourceURLs]

  field :verbs, 1, repeated: true, type: :string
  field :apiGroups, 3, repeated: true, type: :string
  field :resources, 4, repeated: true, type: :string
  field :resourceNames, 5, repeated: true, type: :string
  field :nonResourceURLs, 6, repeated: true, type: :string
end

defmodule K8s.Io.Api.Rbac.V1alpha1.Role do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          rules: [K8s.Io.Api.Rbac.V1alpha1.PolicyRule.t()]
        }
  defstruct [:metadata, :rules]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :rules, 2, repeated: true, type: K8s.Io.Api.Rbac.V1alpha1.PolicyRule
end

defmodule K8s.Io.Api.Rbac.V1alpha1.RoleBinding do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          subjects: [K8s.Io.Api.Rbac.V1alpha1.Subject.t()],
          roleRef: K8s.Io.Api.Rbac.V1alpha1.RoleRef.t() | nil
        }
  defstruct [:metadata, :subjects, :roleRef]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :subjects, 2, repeated: true, type: K8s.Io.Api.Rbac.V1alpha1.Subject
  field :roleRef, 3, optional: true, type: K8s.Io.Api.Rbac.V1alpha1.RoleRef
end

defmodule K8s.Io.Api.Rbac.V1alpha1.RoleBindingList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [K8s.Io.Api.Rbac.V1alpha1.RoleBinding.t()]
        }
  defstruct [:metadata, :items]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta
  field :items, 2, repeated: true, type: K8s.Io.Api.Rbac.V1alpha1.RoleBinding
end

defmodule K8s.Io.Api.Rbac.V1alpha1.RoleList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [K8s.Io.Api.Rbac.V1alpha1.Role.t()]
        }
  defstruct [:metadata, :items]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta
  field :items, 2, repeated: true, type: K8s.Io.Api.Rbac.V1alpha1.Role
end

defmodule K8s.Io.Api.Rbac.V1alpha1.RoleRef do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          apiGroup: String.t(),
          kind: String.t(),
          name: String.t()
        }
  defstruct [:apiGroup, :kind, :name]

  field :apiGroup, 1, optional: true, type: :string
  field :kind, 2, optional: true, type: :string
  field :name, 3, optional: true, type: :string
end

defmodule K8s.Io.Api.Rbac.V1alpha1.Subject do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          kind: String.t(),
          apiVersion: String.t(),
          name: String.t(),
          namespace: String.t()
        }
  defstruct [:kind, :apiVersion, :name, :namespace]

  field :kind, 1, optional: true, type: :string
  field :apiVersion, 2, optional: true, type: :string
  field :name, 3, optional: true, type: :string
  field :namespace, 4, optional: true, type: :string
end
