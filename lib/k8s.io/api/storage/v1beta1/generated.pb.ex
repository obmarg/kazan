defmodule K8s.Io.Api.Storage.V1beta1.CSIDriver do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          spec: K8s.Io.Api.Storage.V1beta1.CSIDriverSpec.t() | nil
        }
  defstruct [:metadata, :spec]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :spec, 2, optional: true, type: K8s.Io.Api.Storage.V1beta1.CSIDriverSpec
end

defmodule K8s.Io.Api.Storage.V1beta1.CSIDriverList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [K8s.Io.Api.Storage.V1beta1.CSIDriver.t()]
        }
  defstruct [:metadata, :items]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta
  field :items, 2, repeated: true, type: K8s.Io.Api.Storage.V1beta1.CSIDriver
end

defmodule K8s.Io.Api.Storage.V1beta1.CSIDriverSpec do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          attachRequired: boolean,
          podInfoOnMount: boolean,
          volumeLifecycleModes: [String.t()]
        }
  defstruct [:attachRequired, :podInfoOnMount, :volumeLifecycleModes]

  field :attachRequired, 1, optional: true, type: :bool
  field :podInfoOnMount, 2, optional: true, type: :bool
  field :volumeLifecycleModes, 3, repeated: true, type: :string
end

defmodule K8s.Io.Api.Storage.V1beta1.CSINode do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          spec: K8s.Io.Api.Storage.V1beta1.CSINodeSpec.t() | nil
        }
  defstruct [:metadata, :spec]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :spec, 2, optional: true, type: K8s.Io.Api.Storage.V1beta1.CSINodeSpec
end

defmodule K8s.Io.Api.Storage.V1beta1.CSINodeDriver do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          name: String.t(),
          nodeID: String.t(),
          topologyKeys: [String.t()],
          allocatable: K8s.Io.Api.Storage.V1beta1.VolumeNodeResources.t() | nil
        }
  defstruct [:name, :nodeID, :topologyKeys, :allocatable]

  field :name, 1, optional: true, type: :string
  field :nodeID, 2, optional: true, type: :string
  field :topologyKeys, 3, repeated: true, type: :string
  field :allocatable, 4, optional: true, type: K8s.Io.Api.Storage.V1beta1.VolumeNodeResources
end

defmodule K8s.Io.Api.Storage.V1beta1.CSINodeList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [K8s.Io.Api.Storage.V1beta1.CSINode.t()]
        }
  defstruct [:metadata, :items]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta
  field :items, 2, repeated: true, type: K8s.Io.Api.Storage.V1beta1.CSINode
end

defmodule K8s.Io.Api.Storage.V1beta1.CSINodeSpec do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          drivers: [K8s.Io.Api.Storage.V1beta1.CSINodeDriver.t()]
        }
  defstruct [:drivers]

  field :drivers, 1, repeated: true, type: K8s.Io.Api.Storage.V1beta1.CSINodeDriver
end

defmodule K8s.Io.Api.Storage.V1beta1.StorageClass do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          provisioner: String.t(),
          parameters: %{String.t() => String.t()},
          reclaimPolicy: String.t(),
          mountOptions: [String.t()],
          allowVolumeExpansion: boolean,
          volumeBindingMode: String.t(),
          allowedTopologies: [K8s.Io.Api.Core.V1.TopologySelectorTerm.t()]
        }
  defstruct [
    :metadata,
    :provisioner,
    :parameters,
    :reclaimPolicy,
    :mountOptions,
    :allowVolumeExpansion,
    :volumeBindingMode,
    :allowedTopologies
  ]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :provisioner, 2, optional: true, type: :string

  field :parameters, 3,
    repeated: true,
    type: K8s.Io.Api.Storage.V1beta1.StorageClass.ParametersEntry,
    map: true

  field :reclaimPolicy, 4, optional: true, type: :string
  field :mountOptions, 5, repeated: true, type: :string
  field :allowVolumeExpansion, 6, optional: true, type: :bool
  field :volumeBindingMode, 7, optional: true, type: :string
  field :allowedTopologies, 8, repeated: true, type: K8s.Io.Api.Core.V1.TopologySelectorTerm
end

defmodule K8s.Io.Api.Storage.V1beta1.StorageClass.ParametersEntry do
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

defmodule K8s.Io.Api.Storage.V1beta1.StorageClassList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [K8s.Io.Api.Storage.V1beta1.StorageClass.t()]
        }
  defstruct [:metadata, :items]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta
  field :items, 2, repeated: true, type: K8s.Io.Api.Storage.V1beta1.StorageClass
end

defmodule K8s.Io.Api.Storage.V1beta1.VolumeAttachment do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          spec: K8s.Io.Api.Storage.V1beta1.VolumeAttachmentSpec.t() | nil,
          status: K8s.Io.Api.Storage.V1beta1.VolumeAttachmentStatus.t() | nil
        }
  defstruct [:metadata, :spec, :status]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :spec, 2, optional: true, type: K8s.Io.Api.Storage.V1beta1.VolumeAttachmentSpec
  field :status, 3, optional: true, type: K8s.Io.Api.Storage.V1beta1.VolumeAttachmentStatus
end

defmodule K8s.Io.Api.Storage.V1beta1.VolumeAttachmentList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [K8s.Io.Api.Storage.V1beta1.VolumeAttachment.t()]
        }
  defstruct [:metadata, :items]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta
  field :items, 2, repeated: true, type: K8s.Io.Api.Storage.V1beta1.VolumeAttachment
end

defmodule K8s.Io.Api.Storage.V1beta1.VolumeAttachmentSource do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          persistentVolumeName: String.t(),
          inlineVolumeSpec: K8s.Io.Api.Core.V1.PersistentVolumeSpec.t() | nil
        }
  defstruct [:persistentVolumeName, :inlineVolumeSpec]

  field :persistentVolumeName, 1, optional: true, type: :string
  field :inlineVolumeSpec, 2, optional: true, type: K8s.Io.Api.Core.V1.PersistentVolumeSpec
end

defmodule K8s.Io.Api.Storage.V1beta1.VolumeAttachmentSpec do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          attacher: String.t(),
          source: K8s.Io.Api.Storage.V1beta1.VolumeAttachmentSource.t() | nil,
          nodeName: String.t()
        }
  defstruct [:attacher, :source, :nodeName]

  field :attacher, 1, optional: true, type: :string
  field :source, 2, optional: true, type: K8s.Io.Api.Storage.V1beta1.VolumeAttachmentSource
  field :nodeName, 3, optional: true, type: :string
end

defmodule K8s.Io.Api.Storage.V1beta1.VolumeAttachmentStatus do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          attached: boolean,
          attachmentMetadata: %{String.t() => String.t()},
          attachError: K8s.Io.Api.Storage.V1beta1.VolumeError.t() | nil,
          detachError: K8s.Io.Api.Storage.V1beta1.VolumeError.t() | nil
        }
  defstruct [:attached, :attachmentMetadata, :attachError, :detachError]

  field :attached, 1, optional: true, type: :bool

  field :attachmentMetadata, 2,
    repeated: true,
    type: K8s.Io.Api.Storage.V1beta1.VolumeAttachmentStatus.AttachmentMetadataEntry,
    map: true

  field :attachError, 3, optional: true, type: K8s.Io.Api.Storage.V1beta1.VolumeError
  field :detachError, 4, optional: true, type: K8s.Io.Api.Storage.V1beta1.VolumeError
end

defmodule K8s.Io.Api.Storage.V1beta1.VolumeAttachmentStatus.AttachmentMetadataEntry do
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

defmodule K8s.Io.Api.Storage.V1beta1.VolumeError do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          time: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time.t() | nil,
          message: String.t()
        }
  defstruct [:time, :message]

  field :time, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time
  field :message, 2, optional: true, type: :string
end

defmodule K8s.Io.Api.Storage.V1beta1.VolumeNodeResources do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          count: integer
        }
  defstruct [:count]

  field :count, 1, optional: true, type: :int32
end
