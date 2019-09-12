defmodule K8s.Io.Api.Storage.V1alpha1.VolumeAttachment do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          spec: K8s.Io.Api.Storage.V1alpha1.VolumeAttachmentSpec.t() | nil,
          status: K8s.Io.Api.Storage.V1alpha1.VolumeAttachmentStatus.t() | nil
        }
  defstruct [:metadata, :spec, :status]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :spec, 2, optional: true, type: K8s.Io.Api.Storage.V1alpha1.VolumeAttachmentSpec
  field :status, 3, optional: true, type: K8s.Io.Api.Storage.V1alpha1.VolumeAttachmentStatus
end

defmodule K8s.Io.Api.Storage.V1alpha1.VolumeAttachmentList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [K8s.Io.Api.Storage.V1alpha1.VolumeAttachment.t()]
        }
  defstruct [:metadata, :items]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta
  field :items, 2, repeated: true, type: K8s.Io.Api.Storage.V1alpha1.VolumeAttachment
end

defmodule K8s.Io.Api.Storage.V1alpha1.VolumeAttachmentSource do
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

defmodule K8s.Io.Api.Storage.V1alpha1.VolumeAttachmentSpec do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          attacher: String.t(),
          source: K8s.Io.Api.Storage.V1alpha1.VolumeAttachmentSource.t() | nil,
          nodeName: String.t()
        }
  defstruct [:attacher, :source, :nodeName]

  field :attacher, 1, optional: true, type: :string
  field :source, 2, optional: true, type: K8s.Io.Api.Storage.V1alpha1.VolumeAttachmentSource
  field :nodeName, 3, optional: true, type: :string
end

defmodule K8s.Io.Api.Storage.V1alpha1.VolumeAttachmentStatus do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          attached: boolean,
          attachmentMetadata: %{String.t() => String.t()},
          attachError: K8s.Io.Api.Storage.V1alpha1.VolumeError.t() | nil,
          detachError: K8s.Io.Api.Storage.V1alpha1.VolumeError.t() | nil
        }
  defstruct [:attached, :attachmentMetadata, :attachError, :detachError]

  field :attached, 1, optional: true, type: :bool

  field :attachmentMetadata, 2,
    repeated: true,
    type: K8s.Io.Api.Storage.V1alpha1.VolumeAttachmentStatus.AttachmentMetadataEntry,
    map: true

  field :attachError, 3, optional: true, type: K8s.Io.Api.Storage.V1alpha1.VolumeError
  field :detachError, 4, optional: true, type: K8s.Io.Api.Storage.V1alpha1.VolumeError
end

defmodule K8s.Io.Api.Storage.V1alpha1.VolumeAttachmentStatus.AttachmentMetadataEntry do
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

defmodule K8s.Io.Api.Storage.V1alpha1.VolumeError do
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
