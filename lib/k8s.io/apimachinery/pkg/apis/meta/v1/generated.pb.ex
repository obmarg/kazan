defmodule K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.APIGroup do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          name: String.t(),
          versions: [K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.GroupVersionForDiscovery.t()],
          preferredVersion:
            K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.GroupVersionForDiscovery.t() | nil,
          serverAddressByClientCIDRs: [
            K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ServerAddressByClientCIDR.t()
          ]
        }
  defstruct [:name, :versions, :preferredVersion, :serverAddressByClientCIDRs]

  field :name, 1, optional: true, type: :string

  field :versions, 2,
    repeated: true,
    type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.GroupVersionForDiscovery

  field :preferredVersion, 3,
    optional: true,
    type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.GroupVersionForDiscovery

  field :serverAddressByClientCIDRs, 4,
    repeated: true,
    type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ServerAddressByClientCIDR
end

defmodule K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.APIGroupList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          groups: [K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.APIGroup.t()]
        }
  defstruct [:groups]

  field :groups, 1, repeated: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.APIGroup
end

defmodule K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.APIResource do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          name: String.t(),
          singularName: String.t(),
          namespaced: boolean,
          group: String.t(),
          version: String.t(),
          kind: String.t(),
          verbs: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Verbs.t() | nil,
          shortNames: [String.t()],
          categories: [String.t()],
          storageVersionHash: String.t()
        }
  defstruct [
    :name,
    :singularName,
    :namespaced,
    :group,
    :version,
    :kind,
    :verbs,
    :shortNames,
    :categories,
    :storageVersionHash
  ]

  field :name, 1, optional: true, type: :string
  field :singularName, 6, optional: true, type: :string
  field :namespaced, 2, optional: true, type: :bool
  field :group, 8, optional: true, type: :string
  field :version, 9, optional: true, type: :string
  field :kind, 3, optional: true, type: :string
  field :verbs, 4, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Verbs
  field :shortNames, 5, repeated: true, type: :string
  field :categories, 7, repeated: true, type: :string
  field :storageVersionHash, 10, optional: true, type: :string
end

defmodule K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.APIResourceList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          groupVersion: String.t(),
          resources: [K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.APIResource.t()]
        }
  defstruct [:groupVersion, :resources]

  field :groupVersion, 1, optional: true, type: :string
  field :resources, 2, repeated: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.APIResource
end

defmodule K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.APIVersions do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          versions: [String.t()],
          serverAddressByClientCIDRs: [
            K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ServerAddressByClientCIDR.t()
          ]
        }
  defstruct [:versions, :serverAddressByClientCIDRs]

  field :versions, 1, repeated: true, type: :string

  field :serverAddressByClientCIDRs, 2,
    repeated: true,
    type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ServerAddressByClientCIDR
end

defmodule K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.CreateOptions do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          dryRun: [String.t()],
          fieldManager: String.t()
        }
  defstruct [:dryRun, :fieldManager]

  field :dryRun, 1, repeated: true, type: :string
  field :fieldManager, 3, optional: true, type: :string
end

defmodule K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.DeleteOptions do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          gracePeriodSeconds: integer,
          preconditions: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Preconditions.t() | nil,
          orphanDependents: boolean,
          propagationPolicy: String.t(),
          dryRun: [String.t()]
        }
  defstruct [:gracePeriodSeconds, :preconditions, :orphanDependents, :propagationPolicy, :dryRun]

  field :gracePeriodSeconds, 1, optional: true, type: :int64

  field :preconditions, 2,
    optional: true,
    type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Preconditions

  field :orphanDependents, 3, optional: true, type: :bool
  field :propagationPolicy, 4, optional: true, type: :string
  field :dryRun, 5, repeated: true, type: :string
end

defmodule K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Duration do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          duration: integer
        }
  defstruct [:duration]

  field :duration, 1, optional: true, type: :int64
end

defmodule K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ExportOptions do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          export: boolean,
          exact: boolean
        }
  defstruct [:export, :exact]

  field :export, 1, optional: true, type: :bool
  field :exact, 2, optional: true, type: :bool
end

defmodule K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.FieldsV1 do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          Raw: binary
        }
  defstruct [:Raw]

  field :Raw, 1, optional: true, type: :bytes
end

defmodule K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.GetOptions do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          resourceVersion: String.t()
        }
  defstruct [:resourceVersion]

  field :resourceVersion, 1, optional: true, type: :string
end

defmodule K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.GroupKind do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          group: String.t(),
          kind: String.t()
        }
  defstruct [:group, :kind]

  field :group, 1, optional: true, type: :string
  field :kind, 2, optional: true, type: :string
end

defmodule K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.GroupResource do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          group: String.t(),
          resource: String.t()
        }
  defstruct [:group, :resource]

  field :group, 1, optional: true, type: :string
  field :resource, 2, optional: true, type: :string
end

defmodule K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.GroupVersion do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          group: String.t(),
          version: String.t()
        }
  defstruct [:group, :version]

  field :group, 1, optional: true, type: :string
  field :version, 2, optional: true, type: :string
end

defmodule K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.GroupVersionForDiscovery do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          groupVersion: String.t(),
          version: String.t()
        }
  defstruct [:groupVersion, :version]

  field :groupVersion, 1, optional: true, type: :string
  field :version, 2, optional: true, type: :string
end

defmodule K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.GroupVersionKind do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          group: String.t(),
          version: String.t(),
          kind: String.t()
        }
  defstruct [:group, :version, :kind]

  field :group, 1, optional: true, type: :string
  field :version, 2, optional: true, type: :string
  field :kind, 3, optional: true, type: :string
end

defmodule K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.GroupVersionResource do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          group: String.t(),
          version: String.t(),
          resource: String.t()
        }
  defstruct [:group, :version, :resource]

  field :group, 1, optional: true, type: :string
  field :version, 2, optional: true, type: :string
  field :resource, 3, optional: true, type: :string
end

defmodule K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelector do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          matchLabels: %{String.t() => String.t()},
          matchExpressions: [K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelectorRequirement.t()]
        }
  defstruct [:matchLabels, :matchExpressions]

  field :matchLabels, 1,
    repeated: true,
    type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelector.MatchLabelsEntry,
    map: true

  field :matchExpressions, 2,
    repeated: true,
    type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelectorRequirement
end

defmodule K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelector.MatchLabelsEntry do
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

defmodule K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelectorRequirement do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          key: String.t(),
          operator: String.t(),
          values: [String.t()]
        }
  defstruct [:key, :operator, :values]

  field :key, 1, optional: true, type: :string
  field :operator, 2, optional: true, type: :string
  field :values, 3, repeated: true, type: :string
end

defmodule K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.List do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [K8s.Io.Apimachinery.Pkg.Runtime.RawExtension.t()]
        }
  defstruct [:metadata, :items]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta
  field :items, 2, repeated: true, type: K8s.Io.Apimachinery.Pkg.Runtime.RawExtension
end

defmodule K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          selfLink: String.t(),
          resourceVersion: String.t(),
          continue: String.t(),
          remainingItemCount: integer
        }
  defstruct [:selfLink, :resourceVersion, :continue, :remainingItemCount]

  field :selfLink, 1, optional: true, type: :string
  field :resourceVersion, 2, optional: true, type: :string
  field :continue, 3, optional: true, type: :string
  field :remainingItemCount, 4, optional: true, type: :int64
end

defmodule K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListOptions do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          labelSelector: String.t(),
          fieldSelector: String.t(),
          watch: boolean,
          allowWatchBookmarks: boolean,
          resourceVersion: String.t(),
          timeoutSeconds: integer,
          limit: integer,
          continue: String.t()
        }
  defstruct [
    :labelSelector,
    :fieldSelector,
    :watch,
    :allowWatchBookmarks,
    :resourceVersion,
    :timeoutSeconds,
    :limit,
    :continue
  ]

  field :labelSelector, 1, optional: true, type: :string
  field :fieldSelector, 2, optional: true, type: :string
  field :watch, 3, optional: true, type: :bool
  field :allowWatchBookmarks, 9, optional: true, type: :bool
  field :resourceVersion, 4, optional: true, type: :string
  field :timeoutSeconds, 5, optional: true, type: :int64
  field :limit, 7, optional: true, type: :int64
  field :continue, 8, optional: true, type: :string
end

defmodule K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ManagedFieldsEntry do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          manager: String.t(),
          operation: String.t(),
          apiVersion: String.t(),
          time: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time.t() | nil,
          fieldsType: String.t(),
          fieldsV1: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.FieldsV1.t() | nil
        }
  defstruct [:manager, :operation, :apiVersion, :time, :fieldsType, :fieldsV1]

  field :manager, 1, optional: true, type: :string
  field :operation, 2, optional: true, type: :string
  field :apiVersion, 3, optional: true, type: :string
  field :time, 4, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time
  field :fieldsType, 6, optional: true, type: :string
  field :fieldsV1, 7, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.FieldsV1
end

defmodule K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.MicroTime do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          seconds: integer,
          nanos: integer
        }
  defstruct [:seconds, :nanos]

  field :seconds, 1, optional: true, type: :int64
  field :nanos, 2, optional: true, type: :int32
end

defmodule K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          name: String.t(),
          generateName: String.t(),
          namespace: String.t(),
          selfLink: String.t(),
          uid: String.t(),
          resourceVersion: String.t(),
          generation: integer,
          creationTimestamp: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time.t() | nil,
          deletionTimestamp: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time.t() | nil,
          deletionGracePeriodSeconds: integer,
          labels: %{String.t() => String.t()},
          annotations: %{String.t() => String.t()},
          ownerReferences: [K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.OwnerReference.t()],
          finalizers: [String.t()],
          clusterName: String.t(),
          managedFields: [K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ManagedFieldsEntry.t()]
        }
  defstruct [
    :name,
    :generateName,
    :namespace,
    :selfLink,
    :uid,
    :resourceVersion,
    :generation,
    :creationTimestamp,
    :deletionTimestamp,
    :deletionGracePeriodSeconds,
    :labels,
    :annotations,
    :ownerReferences,
    :finalizers,
    :clusterName,
    :managedFields
  ]

  field :name, 1, optional: true, type: :string
  field :generateName, 2, optional: true, type: :string
  field :namespace, 3, optional: true, type: :string
  field :selfLink, 4, optional: true, type: :string
  field :uid, 5, optional: true, type: :string
  field :resourceVersion, 6, optional: true, type: :string
  field :generation, 7, optional: true, type: :int64
  field :creationTimestamp, 8, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time
  field :deletionTimestamp, 9, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time
  field :deletionGracePeriodSeconds, 10, optional: true, type: :int64

  field :labels, 11,
    repeated: true,
    type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.LabelsEntry,
    map: true

  field :annotations, 12,
    repeated: true,
    type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.AnnotationsEntry,
    map: true

  field :ownerReferences, 13,
    repeated: true,
    type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.OwnerReference

  field :finalizers, 14, repeated: true, type: :string
  field :clusterName, 15, optional: true, type: :string

  field :managedFields, 17,
    repeated: true,
    type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ManagedFieldsEntry
end

defmodule K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.LabelsEntry do
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

defmodule K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.AnnotationsEntry do
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

defmodule K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.OwnerReference do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          apiVersion: String.t(),
          kind: String.t(),
          name: String.t(),
          uid: String.t(),
          controller: boolean,
          blockOwnerDeletion: boolean
        }
  defstruct [:apiVersion, :kind, :name, :uid, :controller, :blockOwnerDeletion]

  field :apiVersion, 5, optional: true, type: :string
  field :kind, 1, optional: true, type: :string
  field :name, 3, optional: true, type: :string
  field :uid, 4, optional: true, type: :string
  field :controller, 6, optional: true, type: :bool
  field :blockOwnerDeletion, 7, optional: true, type: :bool
end

defmodule K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.PartialObjectMetadata do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil
        }
  defstruct [:metadata]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
end

defmodule K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.PartialObjectMetadataList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.PartialObjectMetadata.t()]
        }
  defstruct [:metadata, :items]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta

  field :items, 2,
    repeated: true,
    type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.PartialObjectMetadata
end

defmodule K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Patch do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.PatchOptions do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          dryRun: [String.t()],
          force: boolean,
          fieldManager: String.t()
        }
  defstruct [:dryRun, :force, :fieldManager]

  field :dryRun, 1, repeated: true, type: :string
  field :force, 2, optional: true, type: :bool
  field :fieldManager, 3, optional: true, type: :string
end

defmodule K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Preconditions do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          uid: String.t(),
          resourceVersion: String.t()
        }
  defstruct [:uid, :resourceVersion]

  field :uid, 1, optional: true, type: :string
  field :resourceVersion, 2, optional: true, type: :string
end

defmodule K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.RootPaths do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          paths: [String.t()]
        }
  defstruct [:paths]

  field :paths, 1, repeated: true, type: :string
end

defmodule K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ServerAddressByClientCIDR do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          clientCIDR: String.t(),
          serverAddress: String.t()
        }
  defstruct [:clientCIDR, :serverAddress]

  field :clientCIDR, 1, optional: true, type: :string
  field :serverAddress, 2, optional: true, type: :string
end

defmodule K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Status do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          status: String.t(),
          message: String.t(),
          reason: String.t(),
          details: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.StatusDetails.t() | nil,
          code: integer
        }
  defstruct [:metadata, :status, :message, :reason, :details, :code]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta
  field :status, 2, optional: true, type: :string
  field :message, 3, optional: true, type: :string
  field :reason, 4, optional: true, type: :string
  field :details, 5, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.StatusDetails
  field :code, 6, optional: true, type: :int32
end

defmodule K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.StatusCause do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          reason: String.t(),
          message: String.t(),
          field: String.t()
        }
  defstruct [:reason, :message, :field]

  field :reason, 1, optional: true, type: :string
  field :message, 2, optional: true, type: :string
  field :field, 3, optional: true, type: :string
end

defmodule K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.StatusDetails do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          name: String.t(),
          group: String.t(),
          kind: String.t(),
          uid: String.t(),
          causes: [K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.StatusCause.t()],
          retryAfterSeconds: integer
        }
  defstruct [:name, :group, :kind, :uid, :causes, :retryAfterSeconds]

  field :name, 1, optional: true, type: :string
  field :group, 2, optional: true, type: :string
  field :kind, 3, optional: true, type: :string
  field :uid, 6, optional: true, type: :string
  field :causes, 4, repeated: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.StatusCause
  field :retryAfterSeconds, 5, optional: true, type: :int32
end

defmodule K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.TableOptions do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          includeObject: String.t()
        }
  defstruct [:includeObject]

  field :includeObject, 1, optional: true, type: :string
end

defmodule K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          seconds: integer,
          nanos: integer
        }
  defstruct [:seconds, :nanos]

  field :seconds, 1, optional: true, type: :int64
  field :nanos, 2, optional: true, type: :int32
end

defmodule K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Timestamp do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          seconds: integer,
          nanos: integer
        }
  defstruct [:seconds, :nanos]

  field :seconds, 1, optional: true, type: :int64
  field :nanos, 2, optional: true, type: :int32
end

defmodule K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.TypeMeta do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          kind: String.t(),
          apiVersion: String.t()
        }
  defstruct [:kind, :apiVersion]

  field :kind, 1, optional: true, type: :string
  field :apiVersion, 2, optional: true, type: :string
end

defmodule K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.UpdateOptions do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          dryRun: [String.t()],
          fieldManager: String.t()
        }
  defstruct [:dryRun, :fieldManager]

  field :dryRun, 1, repeated: true, type: :string
  field :fieldManager, 2, optional: true, type: :string
end

defmodule K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Verbs do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          items: [String.t()]
        }
  defstruct [:items]

  field :items, 1, repeated: true, type: :string
end

defmodule K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.WatchEvent do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          type: String.t(),
          object: K8s.Io.Apimachinery.Pkg.Runtime.RawExtension.t() | nil
        }
  defstruct [:type, :object]

  field :type, 1, optional: true, type: :string
  field :object, 2, optional: true, type: K8s.Io.Apimachinery.Pkg.Runtime.RawExtension
end
