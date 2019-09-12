defmodule K8s.Io.Apiserver.Pkg.Apis.Audit.V1.Event do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          level: String.t(),
          auditID: String.t(),
          stage: String.t(),
          requestURI: String.t(),
          verb: String.t(),
          user: K8s.Io.Api.Authentication.V1.UserInfo.t() | nil,
          impersonatedUser: K8s.Io.Api.Authentication.V1.UserInfo.t() | nil,
          sourceIPs: [String.t()],
          userAgent: String.t(),
          objectRef: K8s.Io.Apiserver.Pkg.Apis.Audit.V1.ObjectReference.t() | nil,
          responseStatus: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Status.t() | nil,
          requestObject: K8s.Io.Apimachinery.Pkg.Runtime.Unknown.t() | nil,
          responseObject: K8s.Io.Apimachinery.Pkg.Runtime.Unknown.t() | nil,
          requestReceivedTimestamp: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.MicroTime.t() | nil,
          stageTimestamp: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.MicroTime.t() | nil,
          annotations: %{String.t() => String.t()}
        }
  defstruct [
    :level,
    :auditID,
    :stage,
    :requestURI,
    :verb,
    :user,
    :impersonatedUser,
    :sourceIPs,
    :userAgent,
    :objectRef,
    :responseStatus,
    :requestObject,
    :responseObject,
    :requestReceivedTimestamp,
    :stageTimestamp,
    :annotations
  ]

  field :level, 1, optional: true, type: :string
  field :auditID, 2, optional: true, type: :string
  field :stage, 3, optional: true, type: :string
  field :requestURI, 4, optional: true, type: :string
  field :verb, 5, optional: true, type: :string
  field :user, 6, optional: true, type: K8s.Io.Api.Authentication.V1.UserInfo
  field :impersonatedUser, 7, optional: true, type: K8s.Io.Api.Authentication.V1.UserInfo
  field :sourceIPs, 8, repeated: true, type: :string
  field :userAgent, 16, optional: true, type: :string
  field :objectRef, 9, optional: true, type: K8s.Io.Apiserver.Pkg.Apis.Audit.V1.ObjectReference
  field :responseStatus, 10, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Status
  field :requestObject, 11, optional: true, type: K8s.Io.Apimachinery.Pkg.Runtime.Unknown
  field :responseObject, 12, optional: true, type: K8s.Io.Apimachinery.Pkg.Runtime.Unknown

  field :requestReceivedTimestamp, 13,
    optional: true,
    type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.MicroTime

  field :stageTimestamp, 14, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.MicroTime

  field :annotations, 15,
    repeated: true,
    type: K8s.Io.Apiserver.Pkg.Apis.Audit.V1.Event.AnnotationsEntry,
    map: true
end

defmodule K8s.Io.Apiserver.Pkg.Apis.Audit.V1.Event.AnnotationsEntry do
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

defmodule K8s.Io.Apiserver.Pkg.Apis.Audit.V1.EventList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [K8s.Io.Apiserver.Pkg.Apis.Audit.V1.Event.t()]
        }
  defstruct [:metadata, :items]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta
  field :items, 2, repeated: true, type: K8s.Io.Apiserver.Pkg.Apis.Audit.V1.Event
end

defmodule K8s.Io.Apiserver.Pkg.Apis.Audit.V1.GroupResources do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          group: String.t(),
          resources: [String.t()],
          resourceNames: [String.t()]
        }
  defstruct [:group, :resources, :resourceNames]

  field :group, 1, optional: true, type: :string
  field :resources, 2, repeated: true, type: :string
  field :resourceNames, 3, repeated: true, type: :string
end

defmodule K8s.Io.Apiserver.Pkg.Apis.Audit.V1.ObjectReference do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          resource: String.t(),
          namespace: String.t(),
          name: String.t(),
          uid: String.t(),
          apiGroup: String.t(),
          apiVersion: String.t(),
          resourceVersion: String.t(),
          subresource: String.t()
        }
  defstruct [
    :resource,
    :namespace,
    :name,
    :uid,
    :apiGroup,
    :apiVersion,
    :resourceVersion,
    :subresource
  ]

  field :resource, 1, optional: true, type: :string
  field :namespace, 2, optional: true, type: :string
  field :name, 3, optional: true, type: :string
  field :uid, 4, optional: true, type: :string
  field :apiGroup, 5, optional: true, type: :string
  field :apiVersion, 6, optional: true, type: :string
  field :resourceVersion, 7, optional: true, type: :string
  field :subresource, 8, optional: true, type: :string
end

defmodule K8s.Io.Apiserver.Pkg.Apis.Audit.V1.Policy do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          rules: [K8s.Io.Apiserver.Pkg.Apis.Audit.V1.PolicyRule.t()],
          omitStages: [String.t()]
        }
  defstruct [:metadata, :rules, :omitStages]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :rules, 2, repeated: true, type: K8s.Io.Apiserver.Pkg.Apis.Audit.V1.PolicyRule
  field :omitStages, 3, repeated: true, type: :string
end

defmodule K8s.Io.Apiserver.Pkg.Apis.Audit.V1.PolicyList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [K8s.Io.Apiserver.Pkg.Apis.Audit.V1.Policy.t()]
        }
  defstruct [:metadata, :items]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta
  field :items, 2, repeated: true, type: K8s.Io.Apiserver.Pkg.Apis.Audit.V1.Policy
end

defmodule K8s.Io.Apiserver.Pkg.Apis.Audit.V1.PolicyRule do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          level: String.t(),
          users: [String.t()],
          userGroups: [String.t()],
          verbs: [String.t()],
          resources: [K8s.Io.Apiserver.Pkg.Apis.Audit.V1.GroupResources.t()],
          namespaces: [String.t()],
          nonResourceURLs: [String.t()],
          omitStages: [String.t()]
        }
  defstruct [
    :level,
    :users,
    :userGroups,
    :verbs,
    :resources,
    :namespaces,
    :nonResourceURLs,
    :omitStages
  ]

  field :level, 1, optional: true, type: :string
  field :users, 2, repeated: true, type: :string
  field :userGroups, 3, repeated: true, type: :string
  field :verbs, 4, repeated: true, type: :string
  field :resources, 5, repeated: true, type: K8s.Io.Apiserver.Pkg.Apis.Audit.V1.GroupResources
  field :namespaces, 6, repeated: true, type: :string
  field :nonResourceURLs, 7, repeated: true, type: :string
  field :omitStages, 8, repeated: true, type: :string
end
