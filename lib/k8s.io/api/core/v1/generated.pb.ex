defmodule K8s.Io.Api.Core.V1.AWSElasticBlockStoreVolumeSource do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          volumeID: String.t(),
          fsType: String.t(),
          partition: integer,
          readOnly: boolean
        }
  defstruct [:volumeID, :fsType, :partition, :readOnly]

  field :volumeID, 1, optional: true, type: :string
  field :fsType, 2, optional: true, type: :string
  field :partition, 3, optional: true, type: :int32
  field :readOnly, 4, optional: true, type: :bool
end

defmodule K8s.Io.Api.Core.V1.Affinity do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          nodeAffinity: K8s.Io.Api.Core.V1.NodeAffinity.t() | nil,
          podAffinity: K8s.Io.Api.Core.V1.PodAffinity.t() | nil,
          podAntiAffinity: K8s.Io.Api.Core.V1.PodAntiAffinity.t() | nil
        }
  defstruct [:nodeAffinity, :podAffinity, :podAntiAffinity]

  field :nodeAffinity, 1, optional: true, type: K8s.Io.Api.Core.V1.NodeAffinity
  field :podAffinity, 2, optional: true, type: K8s.Io.Api.Core.V1.PodAffinity
  field :podAntiAffinity, 3, optional: true, type: K8s.Io.Api.Core.V1.PodAntiAffinity
end

defmodule K8s.Io.Api.Core.V1.AttachedVolume do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          name: String.t(),
          devicePath: String.t()
        }
  defstruct [:name, :devicePath]

  field :name, 1, optional: true, type: :string
  field :devicePath, 2, optional: true, type: :string
end

defmodule K8s.Io.Api.Core.V1.AvoidPods do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          preferAvoidPods: [K8s.Io.Api.Core.V1.PreferAvoidPodsEntry.t()]
        }
  defstruct [:preferAvoidPods]

  field :preferAvoidPods, 1, repeated: true, type: K8s.Io.Api.Core.V1.PreferAvoidPodsEntry
end

defmodule K8s.Io.Api.Core.V1.AzureDiskVolumeSource do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          diskName: String.t(),
          diskURI: String.t(),
          cachingMode: String.t(),
          fsType: String.t(),
          readOnly: boolean,
          kind: String.t()
        }
  defstruct [:diskName, :diskURI, :cachingMode, :fsType, :readOnly, :kind]

  field :diskName, 1, optional: true, type: :string
  field :diskURI, 2, optional: true, type: :string
  field :cachingMode, 3, optional: true, type: :string
  field :fsType, 4, optional: true, type: :string
  field :readOnly, 5, optional: true, type: :bool
  field :kind, 6, optional: true, type: :string
end

defmodule K8s.Io.Api.Core.V1.AzureFilePersistentVolumeSource do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          secretName: String.t(),
          shareName: String.t(),
          readOnly: boolean,
          secretNamespace: String.t()
        }
  defstruct [:secretName, :shareName, :readOnly, :secretNamespace]

  field :secretName, 1, optional: true, type: :string
  field :shareName, 2, optional: true, type: :string
  field :readOnly, 3, optional: true, type: :bool
  field :secretNamespace, 4, optional: true, type: :string
end

defmodule K8s.Io.Api.Core.V1.AzureFileVolumeSource do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          secretName: String.t(),
          shareName: String.t(),
          readOnly: boolean
        }
  defstruct [:secretName, :shareName, :readOnly]

  field :secretName, 1, optional: true, type: :string
  field :shareName, 2, optional: true, type: :string
  field :readOnly, 3, optional: true, type: :bool
end

defmodule K8s.Io.Api.Core.V1.Binding do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          target: K8s.Io.Api.Core.V1.ObjectReference.t() | nil
        }
  defstruct [:metadata, :target]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :target, 2, optional: true, type: K8s.Io.Api.Core.V1.ObjectReference
end

defmodule K8s.Io.Api.Core.V1.CSIPersistentVolumeSource do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          driver: String.t(),
          volumeHandle: String.t(),
          readOnly: boolean,
          fsType: String.t(),
          volumeAttributes: %{String.t() => String.t()},
          controllerPublishSecretRef: K8s.Io.Api.Core.V1.SecretReference.t() | nil,
          nodeStageSecretRef: K8s.Io.Api.Core.V1.SecretReference.t() | nil,
          nodePublishSecretRef: K8s.Io.Api.Core.V1.SecretReference.t() | nil,
          controllerExpandSecretRef: K8s.Io.Api.Core.V1.SecretReference.t() | nil
        }
  defstruct [
    :driver,
    :volumeHandle,
    :readOnly,
    :fsType,
    :volumeAttributes,
    :controllerPublishSecretRef,
    :nodeStageSecretRef,
    :nodePublishSecretRef,
    :controllerExpandSecretRef
  ]

  field :driver, 1, optional: true, type: :string
  field :volumeHandle, 2, optional: true, type: :string
  field :readOnly, 3, optional: true, type: :bool
  field :fsType, 4, optional: true, type: :string

  field :volumeAttributes, 5,
    repeated: true,
    type: K8s.Io.Api.Core.V1.CSIPersistentVolumeSource.VolumeAttributesEntry,
    map: true

  field :controllerPublishSecretRef, 6, optional: true, type: K8s.Io.Api.Core.V1.SecretReference
  field :nodeStageSecretRef, 7, optional: true, type: K8s.Io.Api.Core.V1.SecretReference
  field :nodePublishSecretRef, 8, optional: true, type: K8s.Io.Api.Core.V1.SecretReference
  field :controllerExpandSecretRef, 9, optional: true, type: K8s.Io.Api.Core.V1.SecretReference
end

defmodule K8s.Io.Api.Core.V1.CSIPersistentVolumeSource.VolumeAttributesEntry do
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

defmodule K8s.Io.Api.Core.V1.CSIVolumeSource do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          driver: String.t(),
          readOnly: boolean,
          fsType: String.t(),
          volumeAttributes: %{String.t() => String.t()},
          nodePublishSecretRef: K8s.Io.Api.Core.V1.LocalObjectReference.t() | nil
        }
  defstruct [:driver, :readOnly, :fsType, :volumeAttributes, :nodePublishSecretRef]

  field :driver, 1, optional: true, type: :string
  field :readOnly, 2, optional: true, type: :bool
  field :fsType, 3, optional: true, type: :string

  field :volumeAttributes, 4,
    repeated: true,
    type: K8s.Io.Api.Core.V1.CSIVolumeSource.VolumeAttributesEntry,
    map: true

  field :nodePublishSecretRef, 5, optional: true, type: K8s.Io.Api.Core.V1.LocalObjectReference
end

defmodule K8s.Io.Api.Core.V1.CSIVolumeSource.VolumeAttributesEntry do
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

defmodule K8s.Io.Api.Core.V1.Capabilities do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          add: [String.t()],
          drop: [String.t()]
        }
  defstruct [:add, :drop]

  field :add, 1, repeated: true, type: :string
  field :drop, 2, repeated: true, type: :string
end

defmodule K8s.Io.Api.Core.V1.CephFSPersistentVolumeSource do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          monitors: [String.t()],
          path: String.t(),
          user: String.t(),
          secretFile: String.t(),
          secretRef: K8s.Io.Api.Core.V1.SecretReference.t() | nil,
          readOnly: boolean
        }
  defstruct [:monitors, :path, :user, :secretFile, :secretRef, :readOnly]

  field :monitors, 1, repeated: true, type: :string
  field :path, 2, optional: true, type: :string
  field :user, 3, optional: true, type: :string
  field :secretFile, 4, optional: true, type: :string
  field :secretRef, 5, optional: true, type: K8s.Io.Api.Core.V1.SecretReference
  field :readOnly, 6, optional: true, type: :bool
end

defmodule K8s.Io.Api.Core.V1.CephFSVolumeSource do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          monitors: [String.t()],
          path: String.t(),
          user: String.t(),
          secretFile: String.t(),
          secretRef: K8s.Io.Api.Core.V1.LocalObjectReference.t() | nil,
          readOnly: boolean
        }
  defstruct [:monitors, :path, :user, :secretFile, :secretRef, :readOnly]

  field :monitors, 1, repeated: true, type: :string
  field :path, 2, optional: true, type: :string
  field :user, 3, optional: true, type: :string
  field :secretFile, 4, optional: true, type: :string
  field :secretRef, 5, optional: true, type: K8s.Io.Api.Core.V1.LocalObjectReference
  field :readOnly, 6, optional: true, type: :bool
end

defmodule K8s.Io.Api.Core.V1.CinderPersistentVolumeSource do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          volumeID: String.t(),
          fsType: String.t(),
          readOnly: boolean,
          secretRef: K8s.Io.Api.Core.V1.SecretReference.t() | nil
        }
  defstruct [:volumeID, :fsType, :readOnly, :secretRef]

  field :volumeID, 1, optional: true, type: :string
  field :fsType, 2, optional: true, type: :string
  field :readOnly, 3, optional: true, type: :bool
  field :secretRef, 4, optional: true, type: K8s.Io.Api.Core.V1.SecretReference
end

defmodule K8s.Io.Api.Core.V1.CinderVolumeSource do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          volumeID: String.t(),
          fsType: String.t(),
          readOnly: boolean,
          secretRef: K8s.Io.Api.Core.V1.LocalObjectReference.t() | nil
        }
  defstruct [:volumeID, :fsType, :readOnly, :secretRef]

  field :volumeID, 1, optional: true, type: :string
  field :fsType, 2, optional: true, type: :string
  field :readOnly, 3, optional: true, type: :bool
  field :secretRef, 4, optional: true, type: K8s.Io.Api.Core.V1.LocalObjectReference
end

defmodule K8s.Io.Api.Core.V1.ClientIPConfig do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          timeoutSeconds: integer
        }
  defstruct [:timeoutSeconds]

  field :timeoutSeconds, 1, optional: true, type: :int32
end

defmodule K8s.Io.Api.Core.V1.ComponentCondition do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          type: String.t(),
          status: String.t(),
          message: String.t(),
          error: String.t()
        }
  defstruct [:type, :status, :message, :error]

  field :type, 1, optional: true, type: :string
  field :status, 2, optional: true, type: :string
  field :message, 3, optional: true, type: :string
  field :error, 4, optional: true, type: :string
end

defmodule K8s.Io.Api.Core.V1.ComponentStatus do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          conditions: [K8s.Io.Api.Core.V1.ComponentCondition.t()]
        }
  defstruct [:metadata, :conditions]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :conditions, 2, repeated: true, type: K8s.Io.Api.Core.V1.ComponentCondition
end

defmodule K8s.Io.Api.Core.V1.ComponentStatusList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [K8s.Io.Api.Core.V1.ComponentStatus.t()]
        }
  defstruct [:metadata, :items]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta
  field :items, 2, repeated: true, type: K8s.Io.Api.Core.V1.ComponentStatus
end

defmodule K8s.Io.Api.Core.V1.ConfigMap do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          data: %{String.t() => String.t()},
          binaryData: %{String.t() => binary}
        }
  defstruct [:metadata, :data, :binaryData]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :data, 2, repeated: true, type: K8s.Io.Api.Core.V1.ConfigMap.DataEntry, map: true

  field :binaryData, 3,
    repeated: true,
    type: K8s.Io.Api.Core.V1.ConfigMap.BinaryDataEntry,
    map: true
end

defmodule K8s.Io.Api.Core.V1.ConfigMap.DataEntry do
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

defmodule K8s.Io.Api.Core.V1.ConfigMap.BinaryDataEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto2

  @type t :: %__MODULE__{
          key: String.t(),
          value: binary
        }
  defstruct [:key, :value]

  field :key, 1, optional: true, type: :string
  field :value, 2, optional: true, type: :bytes
end

defmodule K8s.Io.Api.Core.V1.ConfigMapEnvSource do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          localObjectReference: K8s.Io.Api.Core.V1.LocalObjectReference.t() | nil,
          optional: boolean
        }
  defstruct [:localObjectReference, :optional]

  field :localObjectReference, 1, optional: true, type: K8s.Io.Api.Core.V1.LocalObjectReference
  field :optional, 2, optional: true, type: :bool
end

defmodule K8s.Io.Api.Core.V1.ConfigMapKeySelector do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          localObjectReference: K8s.Io.Api.Core.V1.LocalObjectReference.t() | nil,
          key: String.t(),
          optional: boolean
        }
  defstruct [:localObjectReference, :key, :optional]

  field :localObjectReference, 1, optional: true, type: K8s.Io.Api.Core.V1.LocalObjectReference
  field :key, 2, optional: true, type: :string
  field :optional, 3, optional: true, type: :bool
end

defmodule K8s.Io.Api.Core.V1.ConfigMapList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [K8s.Io.Api.Core.V1.ConfigMap.t()]
        }
  defstruct [:metadata, :items]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta
  field :items, 2, repeated: true, type: K8s.Io.Api.Core.V1.ConfigMap
end

defmodule K8s.Io.Api.Core.V1.ConfigMapNodeConfigSource do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          namespace: String.t(),
          name: String.t(),
          uid: String.t(),
          resourceVersion: String.t(),
          kubeletConfigKey: String.t()
        }
  defstruct [:namespace, :name, :uid, :resourceVersion, :kubeletConfigKey]

  field :namespace, 1, optional: true, type: :string
  field :name, 2, optional: true, type: :string
  field :uid, 3, optional: true, type: :string
  field :resourceVersion, 4, optional: true, type: :string
  field :kubeletConfigKey, 5, optional: true, type: :string
end

defmodule K8s.Io.Api.Core.V1.ConfigMapProjection do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          localObjectReference: K8s.Io.Api.Core.V1.LocalObjectReference.t() | nil,
          items: [K8s.Io.Api.Core.V1.KeyToPath.t()],
          optional: boolean
        }
  defstruct [:localObjectReference, :items, :optional]

  field :localObjectReference, 1, optional: true, type: K8s.Io.Api.Core.V1.LocalObjectReference
  field :items, 2, repeated: true, type: K8s.Io.Api.Core.V1.KeyToPath
  field :optional, 4, optional: true, type: :bool
end

defmodule K8s.Io.Api.Core.V1.ConfigMapVolumeSource do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          localObjectReference: K8s.Io.Api.Core.V1.LocalObjectReference.t() | nil,
          items: [K8s.Io.Api.Core.V1.KeyToPath.t()],
          defaultMode: integer,
          optional: boolean
        }
  defstruct [:localObjectReference, :items, :defaultMode, :optional]

  field :localObjectReference, 1, optional: true, type: K8s.Io.Api.Core.V1.LocalObjectReference
  field :items, 2, repeated: true, type: K8s.Io.Api.Core.V1.KeyToPath
  field :defaultMode, 3, optional: true, type: :int32
  field :optional, 4, optional: true, type: :bool
end

defmodule K8s.Io.Api.Core.V1.Container do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          name: String.t(),
          image: String.t(),
          command: [String.t()],
          args: [String.t()],
          workingDir: String.t(),
          ports: [K8s.Io.Api.Core.V1.ContainerPort.t()],
          envFrom: [K8s.Io.Api.Core.V1.EnvFromSource.t()],
          env: [K8s.Io.Api.Core.V1.EnvVar.t()],
          resources: K8s.Io.Api.Core.V1.ResourceRequirements.t() | nil,
          volumeMounts: [K8s.Io.Api.Core.V1.VolumeMount.t()],
          volumeDevices: [K8s.Io.Api.Core.V1.VolumeDevice.t()],
          livenessProbe: K8s.Io.Api.Core.V1.Probe.t() | nil,
          readinessProbe: K8s.Io.Api.Core.V1.Probe.t() | nil,
          startupProbe: K8s.Io.Api.Core.V1.Probe.t() | nil,
          lifecycle: K8s.Io.Api.Core.V1.Lifecycle.t() | nil,
          terminationMessagePath: String.t(),
          terminationMessagePolicy: String.t(),
          imagePullPolicy: String.t(),
          securityContext: K8s.Io.Api.Core.V1.SecurityContext.t() | nil,
          stdin: boolean,
          stdinOnce: boolean,
          tty: boolean
        }
  defstruct [
    :name,
    :image,
    :command,
    :args,
    :workingDir,
    :ports,
    :envFrom,
    :env,
    :resources,
    :volumeMounts,
    :volumeDevices,
    :livenessProbe,
    :readinessProbe,
    :startupProbe,
    :lifecycle,
    :terminationMessagePath,
    :terminationMessagePolicy,
    :imagePullPolicy,
    :securityContext,
    :stdin,
    :stdinOnce,
    :tty
  ]

  field :name, 1, optional: true, type: :string
  field :image, 2, optional: true, type: :string
  field :command, 3, repeated: true, type: :string
  field :args, 4, repeated: true, type: :string
  field :workingDir, 5, optional: true, type: :string
  field :ports, 6, repeated: true, type: K8s.Io.Api.Core.V1.ContainerPort
  field :envFrom, 19, repeated: true, type: K8s.Io.Api.Core.V1.EnvFromSource
  field :env, 7, repeated: true, type: K8s.Io.Api.Core.V1.EnvVar
  field :resources, 8, optional: true, type: K8s.Io.Api.Core.V1.ResourceRequirements
  field :volumeMounts, 9, repeated: true, type: K8s.Io.Api.Core.V1.VolumeMount
  field :volumeDevices, 21, repeated: true, type: K8s.Io.Api.Core.V1.VolumeDevice
  field :livenessProbe, 10, optional: true, type: K8s.Io.Api.Core.V1.Probe
  field :readinessProbe, 11, optional: true, type: K8s.Io.Api.Core.V1.Probe
  field :startupProbe, 22, optional: true, type: K8s.Io.Api.Core.V1.Probe
  field :lifecycle, 12, optional: true, type: K8s.Io.Api.Core.V1.Lifecycle
  field :terminationMessagePath, 13, optional: true, type: :string
  field :terminationMessagePolicy, 20, optional: true, type: :string
  field :imagePullPolicy, 14, optional: true, type: :string
  field :securityContext, 15, optional: true, type: K8s.Io.Api.Core.V1.SecurityContext
  field :stdin, 16, optional: true, type: :bool
  field :stdinOnce, 17, optional: true, type: :bool
  field :tty, 18, optional: true, type: :bool
end

defmodule K8s.Io.Api.Core.V1.ContainerImage do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          names: [String.t()],
          sizeBytes: integer
        }
  defstruct [:names, :sizeBytes]

  field :names, 1, repeated: true, type: :string
  field :sizeBytes, 2, optional: true, type: :int64
end

defmodule K8s.Io.Api.Core.V1.ContainerPort do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          name: String.t(),
          hostPort: integer,
          containerPort: integer,
          protocol: String.t(),
          hostIP: String.t()
        }
  defstruct [:name, :hostPort, :containerPort, :protocol, :hostIP]

  field :name, 1, optional: true, type: :string
  field :hostPort, 2, optional: true, type: :int32
  field :containerPort, 3, optional: true, type: :int32
  field :protocol, 4, optional: true, type: :string
  field :hostIP, 5, optional: true, type: :string
end

defmodule K8s.Io.Api.Core.V1.ContainerState do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          waiting: K8s.Io.Api.Core.V1.ContainerStateWaiting.t() | nil,
          running: K8s.Io.Api.Core.V1.ContainerStateRunning.t() | nil,
          terminated: K8s.Io.Api.Core.V1.ContainerStateTerminated.t() | nil
        }
  defstruct [:waiting, :running, :terminated]

  field :waiting, 1, optional: true, type: K8s.Io.Api.Core.V1.ContainerStateWaiting
  field :running, 2, optional: true, type: K8s.Io.Api.Core.V1.ContainerStateRunning
  field :terminated, 3, optional: true, type: K8s.Io.Api.Core.V1.ContainerStateTerminated
end

defmodule K8s.Io.Api.Core.V1.ContainerStateRunning do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          startedAt: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time.t() | nil
        }
  defstruct [:startedAt]

  field :startedAt, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time
end

defmodule K8s.Io.Api.Core.V1.ContainerStateTerminated do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          exitCode: integer,
          signal: integer,
          reason: String.t(),
          message: String.t(),
          startedAt: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time.t() | nil,
          finishedAt: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time.t() | nil,
          containerID: String.t()
        }
  defstruct [:exitCode, :signal, :reason, :message, :startedAt, :finishedAt, :containerID]

  field :exitCode, 1, optional: true, type: :int32
  field :signal, 2, optional: true, type: :int32
  field :reason, 3, optional: true, type: :string
  field :message, 4, optional: true, type: :string
  field :startedAt, 5, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time
  field :finishedAt, 6, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time
  field :containerID, 7, optional: true, type: :string
end

defmodule K8s.Io.Api.Core.V1.ContainerStateWaiting do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          reason: String.t(),
          message: String.t()
        }
  defstruct [:reason, :message]

  field :reason, 1, optional: true, type: :string
  field :message, 2, optional: true, type: :string
end

defmodule K8s.Io.Api.Core.V1.ContainerStatus do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          name: String.t(),
          state: K8s.Io.Api.Core.V1.ContainerState.t() | nil,
          lastState: K8s.Io.Api.Core.V1.ContainerState.t() | nil,
          ready: boolean,
          restartCount: integer,
          image: String.t(),
          imageID: String.t(),
          containerID: String.t(),
          started: boolean
        }
  defstruct [
    :name,
    :state,
    :lastState,
    :ready,
    :restartCount,
    :image,
    :imageID,
    :containerID,
    :started
  ]

  field :name, 1, optional: true, type: :string
  field :state, 2, optional: true, type: K8s.Io.Api.Core.V1.ContainerState
  field :lastState, 3, optional: true, type: K8s.Io.Api.Core.V1.ContainerState
  field :ready, 4, optional: true, type: :bool
  field :restartCount, 5, optional: true, type: :int32
  field :image, 6, optional: true, type: :string
  field :imageID, 7, optional: true, type: :string
  field :containerID, 8, optional: true, type: :string
  field :started, 9, optional: true, type: :bool
end

defmodule K8s.Io.Api.Core.V1.DaemonEndpoint do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          Port: integer
        }
  defstruct [:Port]

  field :Port, 1, optional: true, type: :int32
end

defmodule K8s.Io.Api.Core.V1.DownwardAPIProjection do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          items: [K8s.Io.Api.Core.V1.DownwardAPIVolumeFile.t()]
        }
  defstruct [:items]

  field :items, 1, repeated: true, type: K8s.Io.Api.Core.V1.DownwardAPIVolumeFile
end

defmodule K8s.Io.Api.Core.V1.DownwardAPIVolumeFile do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          path: String.t(),
          fieldRef: K8s.Io.Api.Core.V1.ObjectFieldSelector.t() | nil,
          resourceFieldRef: K8s.Io.Api.Core.V1.ResourceFieldSelector.t() | nil,
          mode: integer
        }
  defstruct [:path, :fieldRef, :resourceFieldRef, :mode]

  field :path, 1, optional: true, type: :string
  field :fieldRef, 2, optional: true, type: K8s.Io.Api.Core.V1.ObjectFieldSelector
  field :resourceFieldRef, 3, optional: true, type: K8s.Io.Api.Core.V1.ResourceFieldSelector
  field :mode, 4, optional: true, type: :int32
end

defmodule K8s.Io.Api.Core.V1.DownwardAPIVolumeSource do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          items: [K8s.Io.Api.Core.V1.DownwardAPIVolumeFile.t()],
          defaultMode: integer
        }
  defstruct [:items, :defaultMode]

  field :items, 1, repeated: true, type: K8s.Io.Api.Core.V1.DownwardAPIVolumeFile
  field :defaultMode, 2, optional: true, type: :int32
end

defmodule K8s.Io.Api.Core.V1.EmptyDirVolumeSource do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          medium: String.t(),
          sizeLimit: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity.t() | nil
        }
  defstruct [:medium, :sizeLimit]

  field :medium, 1, optional: true, type: :string
  field :sizeLimit, 2, optional: true, type: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity
end

defmodule K8s.Io.Api.Core.V1.EndpointAddress do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          ip: String.t(),
          hostname: String.t(),
          nodeName: String.t(),
          targetRef: K8s.Io.Api.Core.V1.ObjectReference.t() | nil
        }
  defstruct [:ip, :hostname, :nodeName, :targetRef]

  field :ip, 1, optional: true, type: :string
  field :hostname, 3, optional: true, type: :string
  field :nodeName, 4, optional: true, type: :string
  field :targetRef, 2, optional: true, type: K8s.Io.Api.Core.V1.ObjectReference
end

defmodule K8s.Io.Api.Core.V1.EndpointPort do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          name: String.t(),
          port: integer,
          protocol: String.t()
        }
  defstruct [:name, :port, :protocol]

  field :name, 1, optional: true, type: :string
  field :port, 2, optional: true, type: :int32
  field :protocol, 3, optional: true, type: :string
end

defmodule K8s.Io.Api.Core.V1.EndpointSubset do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          addresses: [K8s.Io.Api.Core.V1.EndpointAddress.t()],
          notReadyAddresses: [K8s.Io.Api.Core.V1.EndpointAddress.t()],
          ports: [K8s.Io.Api.Core.V1.EndpointPort.t()]
        }
  defstruct [:addresses, :notReadyAddresses, :ports]

  field :addresses, 1, repeated: true, type: K8s.Io.Api.Core.V1.EndpointAddress
  field :notReadyAddresses, 2, repeated: true, type: K8s.Io.Api.Core.V1.EndpointAddress
  field :ports, 3, repeated: true, type: K8s.Io.Api.Core.V1.EndpointPort
end

defmodule K8s.Io.Api.Core.V1.Endpoints do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          subsets: [K8s.Io.Api.Core.V1.EndpointSubset.t()]
        }
  defstruct [:metadata, :subsets]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :subsets, 2, repeated: true, type: K8s.Io.Api.Core.V1.EndpointSubset
end

defmodule K8s.Io.Api.Core.V1.EndpointsList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [K8s.Io.Api.Core.V1.Endpoints.t()]
        }
  defstruct [:metadata, :items]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta
  field :items, 2, repeated: true, type: K8s.Io.Api.Core.V1.Endpoints
end

defmodule K8s.Io.Api.Core.V1.EnvFromSource do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          prefix: String.t(),
          configMapRef: K8s.Io.Api.Core.V1.ConfigMapEnvSource.t() | nil,
          secretRef: K8s.Io.Api.Core.V1.SecretEnvSource.t() | nil
        }
  defstruct [:prefix, :configMapRef, :secretRef]

  field :prefix, 1, optional: true, type: :string
  field :configMapRef, 2, optional: true, type: K8s.Io.Api.Core.V1.ConfigMapEnvSource
  field :secretRef, 3, optional: true, type: K8s.Io.Api.Core.V1.SecretEnvSource
end

defmodule K8s.Io.Api.Core.V1.EnvVar do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          name: String.t(),
          value: String.t(),
          valueFrom: K8s.Io.Api.Core.V1.EnvVarSource.t() | nil
        }
  defstruct [:name, :value, :valueFrom]

  field :name, 1, optional: true, type: :string
  field :value, 2, optional: true, type: :string
  field :valueFrom, 3, optional: true, type: K8s.Io.Api.Core.V1.EnvVarSource
end

defmodule K8s.Io.Api.Core.V1.EnvVarSource do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          fieldRef: K8s.Io.Api.Core.V1.ObjectFieldSelector.t() | nil,
          resourceFieldRef: K8s.Io.Api.Core.V1.ResourceFieldSelector.t() | nil,
          configMapKeyRef: K8s.Io.Api.Core.V1.ConfigMapKeySelector.t() | nil,
          secretKeyRef: K8s.Io.Api.Core.V1.SecretKeySelector.t() | nil
        }
  defstruct [:fieldRef, :resourceFieldRef, :configMapKeyRef, :secretKeyRef]

  field :fieldRef, 1, optional: true, type: K8s.Io.Api.Core.V1.ObjectFieldSelector
  field :resourceFieldRef, 2, optional: true, type: K8s.Io.Api.Core.V1.ResourceFieldSelector
  field :configMapKeyRef, 3, optional: true, type: K8s.Io.Api.Core.V1.ConfigMapKeySelector
  field :secretKeyRef, 4, optional: true, type: K8s.Io.Api.Core.V1.SecretKeySelector
end

defmodule K8s.Io.Api.Core.V1.EphemeralContainer do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          ephemeralContainerCommon: K8s.Io.Api.Core.V1.EphemeralContainerCommon.t() | nil,
          targetContainerName: String.t()
        }
  defstruct [:ephemeralContainerCommon, :targetContainerName]

  field :ephemeralContainerCommon, 1,
    optional: true,
    type: K8s.Io.Api.Core.V1.EphemeralContainerCommon

  field :targetContainerName, 2, optional: true, type: :string
end

defmodule K8s.Io.Api.Core.V1.EphemeralContainerCommon do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          name: String.t(),
          image: String.t(),
          command: [String.t()],
          args: [String.t()],
          workingDir: String.t(),
          ports: [K8s.Io.Api.Core.V1.ContainerPort.t()],
          envFrom: [K8s.Io.Api.Core.V1.EnvFromSource.t()],
          env: [K8s.Io.Api.Core.V1.EnvVar.t()],
          resources: K8s.Io.Api.Core.V1.ResourceRequirements.t() | nil,
          volumeMounts: [K8s.Io.Api.Core.V1.VolumeMount.t()],
          volumeDevices: [K8s.Io.Api.Core.V1.VolumeDevice.t()],
          livenessProbe: K8s.Io.Api.Core.V1.Probe.t() | nil,
          readinessProbe: K8s.Io.Api.Core.V1.Probe.t() | nil,
          startupProbe: K8s.Io.Api.Core.V1.Probe.t() | nil,
          lifecycle: K8s.Io.Api.Core.V1.Lifecycle.t() | nil,
          terminationMessagePath: String.t(),
          terminationMessagePolicy: String.t(),
          imagePullPolicy: String.t(),
          securityContext: K8s.Io.Api.Core.V1.SecurityContext.t() | nil,
          stdin: boolean,
          stdinOnce: boolean,
          tty: boolean
        }
  defstruct [
    :name,
    :image,
    :command,
    :args,
    :workingDir,
    :ports,
    :envFrom,
    :env,
    :resources,
    :volumeMounts,
    :volumeDevices,
    :livenessProbe,
    :readinessProbe,
    :startupProbe,
    :lifecycle,
    :terminationMessagePath,
    :terminationMessagePolicy,
    :imagePullPolicy,
    :securityContext,
    :stdin,
    :stdinOnce,
    :tty
  ]

  field :name, 1, optional: true, type: :string
  field :image, 2, optional: true, type: :string
  field :command, 3, repeated: true, type: :string
  field :args, 4, repeated: true, type: :string
  field :workingDir, 5, optional: true, type: :string
  field :ports, 6, repeated: true, type: K8s.Io.Api.Core.V1.ContainerPort
  field :envFrom, 19, repeated: true, type: K8s.Io.Api.Core.V1.EnvFromSource
  field :env, 7, repeated: true, type: K8s.Io.Api.Core.V1.EnvVar
  field :resources, 8, optional: true, type: K8s.Io.Api.Core.V1.ResourceRequirements
  field :volumeMounts, 9, repeated: true, type: K8s.Io.Api.Core.V1.VolumeMount
  field :volumeDevices, 21, repeated: true, type: K8s.Io.Api.Core.V1.VolumeDevice
  field :livenessProbe, 10, optional: true, type: K8s.Io.Api.Core.V1.Probe
  field :readinessProbe, 11, optional: true, type: K8s.Io.Api.Core.V1.Probe
  field :startupProbe, 22, optional: true, type: K8s.Io.Api.Core.V1.Probe
  field :lifecycle, 12, optional: true, type: K8s.Io.Api.Core.V1.Lifecycle
  field :terminationMessagePath, 13, optional: true, type: :string
  field :terminationMessagePolicy, 20, optional: true, type: :string
  field :imagePullPolicy, 14, optional: true, type: :string
  field :securityContext, 15, optional: true, type: K8s.Io.Api.Core.V1.SecurityContext
  field :stdin, 16, optional: true, type: :bool
  field :stdinOnce, 17, optional: true, type: :bool
  field :tty, 18, optional: true, type: :bool
end

defmodule K8s.Io.Api.Core.V1.EphemeralContainers do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          ephemeralContainers: [K8s.Io.Api.Core.V1.EphemeralContainer.t()]
        }
  defstruct [:metadata, :ephemeralContainers]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :ephemeralContainers, 2, repeated: true, type: K8s.Io.Api.Core.V1.EphemeralContainer
end

defmodule K8s.Io.Api.Core.V1.Event do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          involvedObject: K8s.Io.Api.Core.V1.ObjectReference.t() | nil,
          reason: String.t(),
          message: String.t(),
          source: K8s.Io.Api.Core.V1.EventSource.t() | nil,
          firstTimestamp: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time.t() | nil,
          lastTimestamp: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time.t() | nil,
          count: integer,
          type: String.t(),
          eventTime: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.MicroTime.t() | nil,
          series: K8s.Io.Api.Core.V1.EventSeries.t() | nil,
          action: String.t(),
          related: K8s.Io.Api.Core.V1.ObjectReference.t() | nil,
          reportingComponent: String.t(),
          reportingInstance: String.t()
        }
  defstruct [
    :metadata,
    :involvedObject,
    :reason,
    :message,
    :source,
    :firstTimestamp,
    :lastTimestamp,
    :count,
    :type,
    :eventTime,
    :series,
    :action,
    :related,
    :reportingComponent,
    :reportingInstance
  ]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :involvedObject, 2, optional: true, type: K8s.Io.Api.Core.V1.ObjectReference
  field :reason, 3, optional: true, type: :string
  field :message, 4, optional: true, type: :string
  field :source, 5, optional: true, type: K8s.Io.Api.Core.V1.EventSource
  field :firstTimestamp, 6, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time
  field :lastTimestamp, 7, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time
  field :count, 8, optional: true, type: :int32
  field :type, 9, optional: true, type: :string
  field :eventTime, 10, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.MicroTime
  field :series, 11, optional: true, type: K8s.Io.Api.Core.V1.EventSeries
  field :action, 12, optional: true, type: :string
  field :related, 13, optional: true, type: K8s.Io.Api.Core.V1.ObjectReference
  field :reportingComponent, 14, optional: true, type: :string
  field :reportingInstance, 15, optional: true, type: :string
end

defmodule K8s.Io.Api.Core.V1.EventList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [K8s.Io.Api.Core.V1.Event.t()]
        }
  defstruct [:metadata, :items]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta
  field :items, 2, repeated: true, type: K8s.Io.Api.Core.V1.Event
end

defmodule K8s.Io.Api.Core.V1.EventSeries do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          count: integer,
          lastObservedTime: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.MicroTime.t() | nil,
          state: String.t()
        }
  defstruct [:count, :lastObservedTime, :state]

  field :count, 1, optional: true, type: :int32
  field :lastObservedTime, 2, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.MicroTime
  field :state, 3, optional: true, type: :string
end

defmodule K8s.Io.Api.Core.V1.EventSource do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          component: String.t(),
          host: String.t()
        }
  defstruct [:component, :host]

  field :component, 1, optional: true, type: :string
  field :host, 2, optional: true, type: :string
end

defmodule K8s.Io.Api.Core.V1.ExecAction do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          command: [String.t()]
        }
  defstruct [:command]

  field :command, 1, repeated: true, type: :string
end

defmodule K8s.Io.Api.Core.V1.FCVolumeSource do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          targetWWNs: [String.t()],
          lun: integer,
          fsType: String.t(),
          readOnly: boolean,
          wwids: [String.t()]
        }
  defstruct [:targetWWNs, :lun, :fsType, :readOnly, :wwids]

  field :targetWWNs, 1, repeated: true, type: :string
  field :lun, 2, optional: true, type: :int32
  field :fsType, 3, optional: true, type: :string
  field :readOnly, 4, optional: true, type: :bool
  field :wwids, 5, repeated: true, type: :string
end

defmodule K8s.Io.Api.Core.V1.FlexPersistentVolumeSource do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          driver: String.t(),
          fsType: String.t(),
          secretRef: K8s.Io.Api.Core.V1.SecretReference.t() | nil,
          readOnly: boolean,
          options: %{String.t() => String.t()}
        }
  defstruct [:driver, :fsType, :secretRef, :readOnly, :options]

  field :driver, 1, optional: true, type: :string
  field :fsType, 2, optional: true, type: :string
  field :secretRef, 3, optional: true, type: K8s.Io.Api.Core.V1.SecretReference
  field :readOnly, 4, optional: true, type: :bool

  field :options, 5,
    repeated: true,
    type: K8s.Io.Api.Core.V1.FlexPersistentVolumeSource.OptionsEntry,
    map: true
end

defmodule K8s.Io.Api.Core.V1.FlexPersistentVolumeSource.OptionsEntry do
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

defmodule K8s.Io.Api.Core.V1.FlexVolumeSource do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          driver: String.t(),
          fsType: String.t(),
          secretRef: K8s.Io.Api.Core.V1.LocalObjectReference.t() | nil,
          readOnly: boolean,
          options: %{String.t() => String.t()}
        }
  defstruct [:driver, :fsType, :secretRef, :readOnly, :options]

  field :driver, 1, optional: true, type: :string
  field :fsType, 2, optional: true, type: :string
  field :secretRef, 3, optional: true, type: K8s.Io.Api.Core.V1.LocalObjectReference
  field :readOnly, 4, optional: true, type: :bool

  field :options, 5,
    repeated: true,
    type: K8s.Io.Api.Core.V1.FlexVolumeSource.OptionsEntry,
    map: true
end

defmodule K8s.Io.Api.Core.V1.FlexVolumeSource.OptionsEntry do
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

defmodule K8s.Io.Api.Core.V1.FlockerVolumeSource do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          datasetName: String.t(),
          datasetUUID: String.t()
        }
  defstruct [:datasetName, :datasetUUID]

  field :datasetName, 1, optional: true, type: :string
  field :datasetUUID, 2, optional: true, type: :string
end

defmodule K8s.Io.Api.Core.V1.GCEPersistentDiskVolumeSource do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          pdName: String.t(),
          fsType: String.t(),
          partition: integer,
          readOnly: boolean
        }
  defstruct [:pdName, :fsType, :partition, :readOnly]

  field :pdName, 1, optional: true, type: :string
  field :fsType, 2, optional: true, type: :string
  field :partition, 3, optional: true, type: :int32
  field :readOnly, 4, optional: true, type: :bool
end

defmodule K8s.Io.Api.Core.V1.GitRepoVolumeSource do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          repository: String.t(),
          revision: String.t(),
          directory: String.t()
        }
  defstruct [:repository, :revision, :directory]

  field :repository, 1, optional: true, type: :string
  field :revision, 2, optional: true, type: :string
  field :directory, 3, optional: true, type: :string
end

defmodule K8s.Io.Api.Core.V1.GlusterfsPersistentVolumeSource do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          endpoints: String.t(),
          path: String.t(),
          readOnly: boolean,
          endpointsNamespace: String.t()
        }
  defstruct [:endpoints, :path, :readOnly, :endpointsNamespace]

  field :endpoints, 1, optional: true, type: :string
  field :path, 2, optional: true, type: :string
  field :readOnly, 3, optional: true, type: :bool
  field :endpointsNamespace, 4, optional: true, type: :string
end

defmodule K8s.Io.Api.Core.V1.GlusterfsVolumeSource do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          endpoints: String.t(),
          path: String.t(),
          readOnly: boolean
        }
  defstruct [:endpoints, :path, :readOnly]

  field :endpoints, 1, optional: true, type: :string
  field :path, 2, optional: true, type: :string
  field :readOnly, 3, optional: true, type: :bool
end

defmodule K8s.Io.Api.Core.V1.HTTPGetAction do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          path: String.t(),
          port: K8s.Io.Apimachinery.Pkg.Util.Intstr.IntOrString.t() | nil,
          host: String.t(),
          scheme: String.t(),
          httpHeaders: [K8s.Io.Api.Core.V1.HTTPHeader.t()]
        }
  defstruct [:path, :port, :host, :scheme, :httpHeaders]

  field :path, 1, optional: true, type: :string
  field :port, 2, optional: true, type: K8s.Io.Apimachinery.Pkg.Util.Intstr.IntOrString
  field :host, 3, optional: true, type: :string
  field :scheme, 4, optional: true, type: :string
  field :httpHeaders, 5, repeated: true, type: K8s.Io.Api.Core.V1.HTTPHeader
end

defmodule K8s.Io.Api.Core.V1.HTTPHeader do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          name: String.t(),
          value: String.t()
        }
  defstruct [:name, :value]

  field :name, 1, optional: true, type: :string
  field :value, 2, optional: true, type: :string
end

defmodule K8s.Io.Api.Core.V1.Handler do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          exec: K8s.Io.Api.Core.V1.ExecAction.t() | nil,
          httpGet: K8s.Io.Api.Core.V1.HTTPGetAction.t() | nil,
          tcpSocket: K8s.Io.Api.Core.V1.TCPSocketAction.t() | nil
        }
  defstruct [:exec, :httpGet, :tcpSocket]

  field :exec, 1, optional: true, type: K8s.Io.Api.Core.V1.ExecAction
  field :httpGet, 2, optional: true, type: K8s.Io.Api.Core.V1.HTTPGetAction
  field :tcpSocket, 3, optional: true, type: K8s.Io.Api.Core.V1.TCPSocketAction
end

defmodule K8s.Io.Api.Core.V1.HostAlias do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          ip: String.t(),
          hostnames: [String.t()]
        }
  defstruct [:ip, :hostnames]

  field :ip, 1, optional: true, type: :string
  field :hostnames, 2, repeated: true, type: :string
end

defmodule K8s.Io.Api.Core.V1.HostPathVolumeSource do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          path: String.t(),
          type: String.t()
        }
  defstruct [:path, :type]

  field :path, 1, optional: true, type: :string
  field :type, 2, optional: true, type: :string
end

defmodule K8s.Io.Api.Core.V1.ISCSIPersistentVolumeSource do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          targetPortal: String.t(),
          iqn: String.t(),
          lun: integer,
          iscsiInterface: String.t(),
          fsType: String.t(),
          readOnly: boolean,
          portals: [String.t()],
          chapAuthDiscovery: boolean,
          chapAuthSession: boolean,
          secretRef: K8s.Io.Api.Core.V1.SecretReference.t() | nil,
          initiatorName: String.t()
        }
  defstruct [
    :targetPortal,
    :iqn,
    :lun,
    :iscsiInterface,
    :fsType,
    :readOnly,
    :portals,
    :chapAuthDiscovery,
    :chapAuthSession,
    :secretRef,
    :initiatorName
  ]

  field :targetPortal, 1, optional: true, type: :string
  field :iqn, 2, optional: true, type: :string
  field :lun, 3, optional: true, type: :int32
  field :iscsiInterface, 4, optional: true, type: :string
  field :fsType, 5, optional: true, type: :string
  field :readOnly, 6, optional: true, type: :bool
  field :portals, 7, repeated: true, type: :string
  field :chapAuthDiscovery, 8, optional: true, type: :bool
  field :chapAuthSession, 11, optional: true, type: :bool
  field :secretRef, 10, optional: true, type: K8s.Io.Api.Core.V1.SecretReference
  field :initiatorName, 12, optional: true, type: :string
end

defmodule K8s.Io.Api.Core.V1.ISCSIVolumeSource do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          targetPortal: String.t(),
          iqn: String.t(),
          lun: integer,
          iscsiInterface: String.t(),
          fsType: String.t(),
          readOnly: boolean,
          portals: [String.t()],
          chapAuthDiscovery: boolean,
          chapAuthSession: boolean,
          secretRef: K8s.Io.Api.Core.V1.LocalObjectReference.t() | nil,
          initiatorName: String.t()
        }
  defstruct [
    :targetPortal,
    :iqn,
    :lun,
    :iscsiInterface,
    :fsType,
    :readOnly,
    :portals,
    :chapAuthDiscovery,
    :chapAuthSession,
    :secretRef,
    :initiatorName
  ]

  field :targetPortal, 1, optional: true, type: :string
  field :iqn, 2, optional: true, type: :string
  field :lun, 3, optional: true, type: :int32
  field :iscsiInterface, 4, optional: true, type: :string
  field :fsType, 5, optional: true, type: :string
  field :readOnly, 6, optional: true, type: :bool
  field :portals, 7, repeated: true, type: :string
  field :chapAuthDiscovery, 8, optional: true, type: :bool
  field :chapAuthSession, 11, optional: true, type: :bool
  field :secretRef, 10, optional: true, type: K8s.Io.Api.Core.V1.LocalObjectReference
  field :initiatorName, 12, optional: true, type: :string
end

defmodule K8s.Io.Api.Core.V1.KeyToPath do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          key: String.t(),
          path: String.t(),
          mode: integer
        }
  defstruct [:key, :path, :mode]

  field :key, 1, optional: true, type: :string
  field :path, 2, optional: true, type: :string
  field :mode, 3, optional: true, type: :int32
end

defmodule K8s.Io.Api.Core.V1.Lifecycle do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          postStart: K8s.Io.Api.Core.V1.Handler.t() | nil,
          preStop: K8s.Io.Api.Core.V1.Handler.t() | nil
        }
  defstruct [:postStart, :preStop]

  field :postStart, 1, optional: true, type: K8s.Io.Api.Core.V1.Handler
  field :preStop, 2, optional: true, type: K8s.Io.Api.Core.V1.Handler
end

defmodule K8s.Io.Api.Core.V1.LimitRange do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          spec: K8s.Io.Api.Core.V1.LimitRangeSpec.t() | nil
        }
  defstruct [:metadata, :spec]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :spec, 2, optional: true, type: K8s.Io.Api.Core.V1.LimitRangeSpec
end

defmodule K8s.Io.Api.Core.V1.LimitRangeItem do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          type: String.t(),
          max: %{String.t() => K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity.t() | nil},
          min: %{String.t() => K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity.t() | nil},
          default: %{String.t() => K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity.t() | nil},
          defaultRequest: %{String.t() => K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity.t() | nil},
          maxLimitRequestRatio: %{
            String.t() => K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity.t() | nil
          }
        }
  defstruct [:type, :max, :min, :default, :defaultRequest, :maxLimitRequestRatio]

  field :type, 1, optional: true, type: :string
  field :max, 2, repeated: true, type: K8s.Io.Api.Core.V1.LimitRangeItem.MaxEntry, map: true
  field :min, 3, repeated: true, type: K8s.Io.Api.Core.V1.LimitRangeItem.MinEntry, map: true

  field :default, 4,
    repeated: true,
    type: K8s.Io.Api.Core.V1.LimitRangeItem.DefaultEntry,
    map: true

  field :defaultRequest, 5,
    repeated: true,
    type: K8s.Io.Api.Core.V1.LimitRangeItem.DefaultRequestEntry,
    map: true

  field :maxLimitRequestRatio, 6,
    repeated: true,
    type: K8s.Io.Api.Core.V1.LimitRangeItem.MaxLimitRequestRatioEntry,
    map: true
end

defmodule K8s.Io.Api.Core.V1.LimitRangeItem.MaxEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto2

  @type t :: %__MODULE__{
          key: String.t(),
          value: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity.t() | nil
        }
  defstruct [:key, :value]

  field :key, 1, optional: true, type: :string
  field :value, 2, optional: true, type: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity
end

defmodule K8s.Io.Api.Core.V1.LimitRangeItem.MinEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto2

  @type t :: %__MODULE__{
          key: String.t(),
          value: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity.t() | nil
        }
  defstruct [:key, :value]

  field :key, 1, optional: true, type: :string
  field :value, 2, optional: true, type: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity
end

defmodule K8s.Io.Api.Core.V1.LimitRangeItem.DefaultEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto2

  @type t :: %__MODULE__{
          key: String.t(),
          value: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity.t() | nil
        }
  defstruct [:key, :value]

  field :key, 1, optional: true, type: :string
  field :value, 2, optional: true, type: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity
end

defmodule K8s.Io.Api.Core.V1.LimitRangeItem.DefaultRequestEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto2

  @type t :: %__MODULE__{
          key: String.t(),
          value: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity.t() | nil
        }
  defstruct [:key, :value]

  field :key, 1, optional: true, type: :string
  field :value, 2, optional: true, type: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity
end

defmodule K8s.Io.Api.Core.V1.LimitRangeItem.MaxLimitRequestRatioEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto2

  @type t :: %__MODULE__{
          key: String.t(),
          value: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity.t() | nil
        }
  defstruct [:key, :value]

  field :key, 1, optional: true, type: :string
  field :value, 2, optional: true, type: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity
end

defmodule K8s.Io.Api.Core.V1.LimitRangeList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [K8s.Io.Api.Core.V1.LimitRange.t()]
        }
  defstruct [:metadata, :items]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta
  field :items, 2, repeated: true, type: K8s.Io.Api.Core.V1.LimitRange
end

defmodule K8s.Io.Api.Core.V1.LimitRangeSpec do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          limits: [K8s.Io.Api.Core.V1.LimitRangeItem.t()]
        }
  defstruct [:limits]

  field :limits, 1, repeated: true, type: K8s.Io.Api.Core.V1.LimitRangeItem
end

defmodule K8s.Io.Api.Core.V1.List do
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

defmodule K8s.Io.Api.Core.V1.LoadBalancerIngress do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          ip: String.t(),
          hostname: String.t()
        }
  defstruct [:ip, :hostname]

  field :ip, 1, optional: true, type: :string
  field :hostname, 2, optional: true, type: :string
end

defmodule K8s.Io.Api.Core.V1.LoadBalancerStatus do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          ingress: [K8s.Io.Api.Core.V1.LoadBalancerIngress.t()]
        }
  defstruct [:ingress]

  field :ingress, 1, repeated: true, type: K8s.Io.Api.Core.V1.LoadBalancerIngress
end

defmodule K8s.Io.Api.Core.V1.LocalObjectReference do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          name: String.t()
        }
  defstruct [:name]

  field :name, 1, optional: true, type: :string
end

defmodule K8s.Io.Api.Core.V1.LocalVolumeSource do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          path: String.t(),
          fsType: String.t()
        }
  defstruct [:path, :fsType]

  field :path, 1, optional: true, type: :string
  field :fsType, 2, optional: true, type: :string
end

defmodule K8s.Io.Api.Core.V1.NFSVolumeSource do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          server: String.t(),
          path: String.t(),
          readOnly: boolean
        }
  defstruct [:server, :path, :readOnly]

  field :server, 1, optional: true, type: :string
  field :path, 2, optional: true, type: :string
  field :readOnly, 3, optional: true, type: :bool
end

defmodule K8s.Io.Api.Core.V1.Namespace do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          spec: K8s.Io.Api.Core.V1.NamespaceSpec.t() | nil,
          status: K8s.Io.Api.Core.V1.NamespaceStatus.t() | nil
        }
  defstruct [:metadata, :spec, :status]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :spec, 2, optional: true, type: K8s.Io.Api.Core.V1.NamespaceSpec
  field :status, 3, optional: true, type: K8s.Io.Api.Core.V1.NamespaceStatus
end

defmodule K8s.Io.Api.Core.V1.NamespaceCondition do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          type: String.t(),
          status: String.t(),
          lastTransitionTime: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time.t() | nil,
          reason: String.t(),
          message: String.t()
        }
  defstruct [:type, :status, :lastTransitionTime, :reason, :message]

  field :type, 1, optional: true, type: :string
  field :status, 2, optional: true, type: :string
  field :lastTransitionTime, 4, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time
  field :reason, 5, optional: true, type: :string
  field :message, 6, optional: true, type: :string
end

defmodule K8s.Io.Api.Core.V1.NamespaceList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [K8s.Io.Api.Core.V1.Namespace.t()]
        }
  defstruct [:metadata, :items]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta
  field :items, 2, repeated: true, type: K8s.Io.Api.Core.V1.Namespace
end

defmodule K8s.Io.Api.Core.V1.NamespaceSpec do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          finalizers: [String.t()]
        }
  defstruct [:finalizers]

  field :finalizers, 1, repeated: true, type: :string
end

defmodule K8s.Io.Api.Core.V1.NamespaceStatus do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          phase: String.t(),
          conditions: [K8s.Io.Api.Core.V1.NamespaceCondition.t()]
        }
  defstruct [:phase, :conditions]

  field :phase, 1, optional: true, type: :string
  field :conditions, 2, repeated: true, type: K8s.Io.Api.Core.V1.NamespaceCondition
end

defmodule K8s.Io.Api.Core.V1.Node do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          spec: K8s.Io.Api.Core.V1.NodeSpec.t() | nil,
          status: K8s.Io.Api.Core.V1.NodeStatus.t() | nil
        }
  defstruct [:metadata, :spec, :status]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :spec, 2, optional: true, type: K8s.Io.Api.Core.V1.NodeSpec
  field :status, 3, optional: true, type: K8s.Io.Api.Core.V1.NodeStatus
end

defmodule K8s.Io.Api.Core.V1.NodeAddress do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          type: String.t(),
          address: String.t()
        }
  defstruct [:type, :address]

  field :type, 1, optional: true, type: :string
  field :address, 2, optional: true, type: :string
end

defmodule K8s.Io.Api.Core.V1.NodeAffinity do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          requiredDuringSchedulingIgnoredDuringExecution:
            K8s.Io.Api.Core.V1.NodeSelector.t() | nil,
          preferredDuringSchedulingIgnoredDuringExecution: [
            K8s.Io.Api.Core.V1.PreferredSchedulingTerm.t()
          ]
        }
  defstruct [
    :requiredDuringSchedulingIgnoredDuringExecution,
    :preferredDuringSchedulingIgnoredDuringExecution
  ]

  field :requiredDuringSchedulingIgnoredDuringExecution, 1,
    optional: true,
    type: K8s.Io.Api.Core.V1.NodeSelector

  field :preferredDuringSchedulingIgnoredDuringExecution, 2,
    repeated: true,
    type: K8s.Io.Api.Core.V1.PreferredSchedulingTerm
end

defmodule K8s.Io.Api.Core.V1.NodeCondition do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          type: String.t(),
          status: String.t(),
          lastHeartbeatTime: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time.t() | nil,
          lastTransitionTime: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time.t() | nil,
          reason: String.t(),
          message: String.t()
        }
  defstruct [:type, :status, :lastHeartbeatTime, :lastTransitionTime, :reason, :message]

  field :type, 1, optional: true, type: :string
  field :status, 2, optional: true, type: :string
  field :lastHeartbeatTime, 3, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time
  field :lastTransitionTime, 4, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time
  field :reason, 5, optional: true, type: :string
  field :message, 6, optional: true, type: :string
end

defmodule K8s.Io.Api.Core.V1.NodeConfigSource do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          configMap: K8s.Io.Api.Core.V1.ConfigMapNodeConfigSource.t() | nil
        }
  defstruct [:configMap]

  field :configMap, 2, optional: true, type: K8s.Io.Api.Core.V1.ConfigMapNodeConfigSource
end

defmodule K8s.Io.Api.Core.V1.NodeConfigStatus do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          assigned: K8s.Io.Api.Core.V1.NodeConfigSource.t() | nil,
          active: K8s.Io.Api.Core.V1.NodeConfigSource.t() | nil,
          lastKnownGood: K8s.Io.Api.Core.V1.NodeConfigSource.t() | nil,
          error: String.t()
        }
  defstruct [:assigned, :active, :lastKnownGood, :error]

  field :assigned, 1, optional: true, type: K8s.Io.Api.Core.V1.NodeConfigSource
  field :active, 2, optional: true, type: K8s.Io.Api.Core.V1.NodeConfigSource
  field :lastKnownGood, 3, optional: true, type: K8s.Io.Api.Core.V1.NodeConfigSource
  field :error, 4, optional: true, type: :string
end

defmodule K8s.Io.Api.Core.V1.NodeDaemonEndpoints do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          kubeletEndpoint: K8s.Io.Api.Core.V1.DaemonEndpoint.t() | nil
        }
  defstruct [:kubeletEndpoint]

  field :kubeletEndpoint, 1, optional: true, type: K8s.Io.Api.Core.V1.DaemonEndpoint
end

defmodule K8s.Io.Api.Core.V1.NodeList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [K8s.Io.Api.Core.V1.Node.t()]
        }
  defstruct [:metadata, :items]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta
  field :items, 2, repeated: true, type: K8s.Io.Api.Core.V1.Node
end

defmodule K8s.Io.Api.Core.V1.NodeProxyOptions do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          path: String.t()
        }
  defstruct [:path]

  field :path, 1, optional: true, type: :string
end

defmodule K8s.Io.Api.Core.V1.NodeResources do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          capacity: %{String.t() => K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity.t() | nil}
        }
  defstruct [:capacity]

  field :capacity, 1,
    repeated: true,
    type: K8s.Io.Api.Core.V1.NodeResources.CapacityEntry,
    map: true
end

defmodule K8s.Io.Api.Core.V1.NodeResources.CapacityEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto2

  @type t :: %__MODULE__{
          key: String.t(),
          value: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity.t() | nil
        }
  defstruct [:key, :value]

  field :key, 1, optional: true, type: :string
  field :value, 2, optional: true, type: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity
end

defmodule K8s.Io.Api.Core.V1.NodeSelector do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          nodeSelectorTerms: [K8s.Io.Api.Core.V1.NodeSelectorTerm.t()]
        }
  defstruct [:nodeSelectorTerms]

  field :nodeSelectorTerms, 1, repeated: true, type: K8s.Io.Api.Core.V1.NodeSelectorTerm
end

defmodule K8s.Io.Api.Core.V1.NodeSelectorRequirement do
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

defmodule K8s.Io.Api.Core.V1.NodeSelectorTerm do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          matchExpressions: [K8s.Io.Api.Core.V1.NodeSelectorRequirement.t()],
          matchFields: [K8s.Io.Api.Core.V1.NodeSelectorRequirement.t()]
        }
  defstruct [:matchExpressions, :matchFields]

  field :matchExpressions, 1, repeated: true, type: K8s.Io.Api.Core.V1.NodeSelectorRequirement
  field :matchFields, 2, repeated: true, type: K8s.Io.Api.Core.V1.NodeSelectorRequirement
end

defmodule K8s.Io.Api.Core.V1.NodeSpec do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          podCIDR: String.t(),
          podCIDRs: [String.t()],
          providerID: String.t(),
          unschedulable: boolean,
          taints: [K8s.Io.Api.Core.V1.Taint.t()],
          configSource: K8s.Io.Api.Core.V1.NodeConfigSource.t() | nil,
          externalID: String.t()
        }
  defstruct [
    :podCIDR,
    :podCIDRs,
    :providerID,
    :unschedulable,
    :taints,
    :configSource,
    :externalID
  ]

  field :podCIDR, 1, optional: true, type: :string
  field :podCIDRs, 7, repeated: true, type: :string
  field :providerID, 3, optional: true, type: :string
  field :unschedulable, 4, optional: true, type: :bool
  field :taints, 5, repeated: true, type: K8s.Io.Api.Core.V1.Taint
  field :configSource, 6, optional: true, type: K8s.Io.Api.Core.V1.NodeConfigSource
  field :externalID, 2, optional: true, type: :string
end

defmodule K8s.Io.Api.Core.V1.NodeStatus do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          capacity: %{String.t() => K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity.t() | nil},
          allocatable: %{String.t() => K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity.t() | nil},
          phase: String.t(),
          conditions: [K8s.Io.Api.Core.V1.NodeCondition.t()],
          addresses: [K8s.Io.Api.Core.V1.NodeAddress.t()],
          daemonEndpoints: K8s.Io.Api.Core.V1.NodeDaemonEndpoints.t() | nil,
          nodeInfo: K8s.Io.Api.Core.V1.NodeSystemInfo.t() | nil,
          images: [K8s.Io.Api.Core.V1.ContainerImage.t()],
          volumesInUse: [String.t()],
          volumesAttached: [K8s.Io.Api.Core.V1.AttachedVolume.t()],
          config: K8s.Io.Api.Core.V1.NodeConfigStatus.t() | nil
        }
  defstruct [
    :capacity,
    :allocatable,
    :phase,
    :conditions,
    :addresses,
    :daemonEndpoints,
    :nodeInfo,
    :images,
    :volumesInUse,
    :volumesAttached,
    :config
  ]

  field :capacity, 1, repeated: true, type: K8s.Io.Api.Core.V1.NodeStatus.CapacityEntry, map: true

  field :allocatable, 2,
    repeated: true,
    type: K8s.Io.Api.Core.V1.NodeStatus.AllocatableEntry,
    map: true

  field :phase, 3, optional: true, type: :string
  field :conditions, 4, repeated: true, type: K8s.Io.Api.Core.V1.NodeCondition
  field :addresses, 5, repeated: true, type: K8s.Io.Api.Core.V1.NodeAddress
  field :daemonEndpoints, 6, optional: true, type: K8s.Io.Api.Core.V1.NodeDaemonEndpoints
  field :nodeInfo, 7, optional: true, type: K8s.Io.Api.Core.V1.NodeSystemInfo
  field :images, 8, repeated: true, type: K8s.Io.Api.Core.V1.ContainerImage
  field :volumesInUse, 9, repeated: true, type: :string
  field :volumesAttached, 10, repeated: true, type: K8s.Io.Api.Core.V1.AttachedVolume
  field :config, 11, optional: true, type: K8s.Io.Api.Core.V1.NodeConfigStatus
end

defmodule K8s.Io.Api.Core.V1.NodeStatus.CapacityEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto2

  @type t :: %__MODULE__{
          key: String.t(),
          value: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity.t() | nil
        }
  defstruct [:key, :value]

  field :key, 1, optional: true, type: :string
  field :value, 2, optional: true, type: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity
end

defmodule K8s.Io.Api.Core.V1.NodeStatus.AllocatableEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto2

  @type t :: %__MODULE__{
          key: String.t(),
          value: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity.t() | nil
        }
  defstruct [:key, :value]

  field :key, 1, optional: true, type: :string
  field :value, 2, optional: true, type: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity
end

defmodule K8s.Io.Api.Core.V1.NodeSystemInfo do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          machineID: String.t(),
          systemUUID: String.t(),
          bootID: String.t(),
          kernelVersion: String.t(),
          osImage: String.t(),
          containerRuntimeVersion: String.t(),
          kubeletVersion: String.t(),
          kubeProxyVersion: String.t(),
          operatingSystem: String.t(),
          architecture: String.t()
        }
  defstruct [
    :machineID,
    :systemUUID,
    :bootID,
    :kernelVersion,
    :osImage,
    :containerRuntimeVersion,
    :kubeletVersion,
    :kubeProxyVersion,
    :operatingSystem,
    :architecture
  ]

  field :machineID, 1, optional: true, type: :string
  field :systemUUID, 2, optional: true, type: :string
  field :bootID, 3, optional: true, type: :string
  field :kernelVersion, 4, optional: true, type: :string
  field :osImage, 5, optional: true, type: :string
  field :containerRuntimeVersion, 6, optional: true, type: :string
  field :kubeletVersion, 7, optional: true, type: :string
  field :kubeProxyVersion, 8, optional: true, type: :string
  field :operatingSystem, 9, optional: true, type: :string
  field :architecture, 10, optional: true, type: :string
end

defmodule K8s.Io.Api.Core.V1.ObjectFieldSelector do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          apiVersion: String.t(),
          fieldPath: String.t()
        }
  defstruct [:apiVersion, :fieldPath]

  field :apiVersion, 1, optional: true, type: :string
  field :fieldPath, 2, optional: true, type: :string
end

defmodule K8s.Io.Api.Core.V1.ObjectReference do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          kind: String.t(),
          namespace: String.t(),
          name: String.t(),
          uid: String.t(),
          apiVersion: String.t(),
          resourceVersion: String.t(),
          fieldPath: String.t()
        }
  defstruct [:kind, :namespace, :name, :uid, :apiVersion, :resourceVersion, :fieldPath]

  field :kind, 1, optional: true, type: :string
  field :namespace, 2, optional: true, type: :string
  field :name, 3, optional: true, type: :string
  field :uid, 4, optional: true, type: :string
  field :apiVersion, 5, optional: true, type: :string
  field :resourceVersion, 6, optional: true, type: :string
  field :fieldPath, 7, optional: true, type: :string
end

defmodule K8s.Io.Api.Core.V1.PersistentVolume do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          spec: K8s.Io.Api.Core.V1.PersistentVolumeSpec.t() | nil,
          status: K8s.Io.Api.Core.V1.PersistentVolumeStatus.t() | nil
        }
  defstruct [:metadata, :spec, :status]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :spec, 2, optional: true, type: K8s.Io.Api.Core.V1.PersistentVolumeSpec
  field :status, 3, optional: true, type: K8s.Io.Api.Core.V1.PersistentVolumeStatus
end

defmodule K8s.Io.Api.Core.V1.PersistentVolumeClaim do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          spec: K8s.Io.Api.Core.V1.PersistentVolumeClaimSpec.t() | nil,
          status: K8s.Io.Api.Core.V1.PersistentVolumeClaimStatus.t() | nil
        }
  defstruct [:metadata, :spec, :status]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :spec, 2, optional: true, type: K8s.Io.Api.Core.V1.PersistentVolumeClaimSpec
  field :status, 3, optional: true, type: K8s.Io.Api.Core.V1.PersistentVolumeClaimStatus
end

defmodule K8s.Io.Api.Core.V1.PersistentVolumeClaimCondition do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          type: String.t(),
          status: String.t(),
          lastProbeTime: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time.t() | nil,
          lastTransitionTime: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time.t() | nil,
          reason: String.t(),
          message: String.t()
        }
  defstruct [:type, :status, :lastProbeTime, :lastTransitionTime, :reason, :message]

  field :type, 1, optional: true, type: :string
  field :status, 2, optional: true, type: :string
  field :lastProbeTime, 3, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time
  field :lastTransitionTime, 4, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time
  field :reason, 5, optional: true, type: :string
  field :message, 6, optional: true, type: :string
end

defmodule K8s.Io.Api.Core.V1.PersistentVolumeClaimList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [K8s.Io.Api.Core.V1.PersistentVolumeClaim.t()]
        }
  defstruct [:metadata, :items]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta
  field :items, 2, repeated: true, type: K8s.Io.Api.Core.V1.PersistentVolumeClaim
end

defmodule K8s.Io.Api.Core.V1.PersistentVolumeClaimSpec do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          accessModes: [String.t()],
          selector: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelector.t() | nil,
          resources: K8s.Io.Api.Core.V1.ResourceRequirements.t() | nil,
          volumeName: String.t(),
          storageClassName: String.t(),
          volumeMode: String.t(),
          dataSource: K8s.Io.Api.Core.V1.TypedLocalObjectReference.t() | nil
        }
  defstruct [
    :accessModes,
    :selector,
    :resources,
    :volumeName,
    :storageClassName,
    :volumeMode,
    :dataSource
  ]

  field :accessModes, 1, repeated: true, type: :string
  field :selector, 4, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelector
  field :resources, 2, optional: true, type: K8s.Io.Api.Core.V1.ResourceRequirements
  field :volumeName, 3, optional: true, type: :string
  field :storageClassName, 5, optional: true, type: :string
  field :volumeMode, 6, optional: true, type: :string
  field :dataSource, 7, optional: true, type: K8s.Io.Api.Core.V1.TypedLocalObjectReference
end

defmodule K8s.Io.Api.Core.V1.PersistentVolumeClaimStatus do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          phase: String.t(),
          accessModes: [String.t()],
          capacity: %{String.t() => K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity.t() | nil},
          conditions: [K8s.Io.Api.Core.V1.PersistentVolumeClaimCondition.t()]
        }
  defstruct [:phase, :accessModes, :capacity, :conditions]

  field :phase, 1, optional: true, type: :string
  field :accessModes, 2, repeated: true, type: :string

  field :capacity, 3,
    repeated: true,
    type: K8s.Io.Api.Core.V1.PersistentVolumeClaimStatus.CapacityEntry,
    map: true

  field :conditions, 4, repeated: true, type: K8s.Io.Api.Core.V1.PersistentVolumeClaimCondition
end

defmodule K8s.Io.Api.Core.V1.PersistentVolumeClaimStatus.CapacityEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto2

  @type t :: %__MODULE__{
          key: String.t(),
          value: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity.t() | nil
        }
  defstruct [:key, :value]

  field :key, 1, optional: true, type: :string
  field :value, 2, optional: true, type: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity
end

defmodule K8s.Io.Api.Core.V1.PersistentVolumeClaimVolumeSource do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          claimName: String.t(),
          readOnly: boolean
        }
  defstruct [:claimName, :readOnly]

  field :claimName, 1, optional: true, type: :string
  field :readOnly, 2, optional: true, type: :bool
end

defmodule K8s.Io.Api.Core.V1.PersistentVolumeList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [K8s.Io.Api.Core.V1.PersistentVolume.t()]
        }
  defstruct [:metadata, :items]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta
  field :items, 2, repeated: true, type: K8s.Io.Api.Core.V1.PersistentVolume
end

defmodule K8s.Io.Api.Core.V1.PersistentVolumeSource do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          gcePersistentDisk: K8s.Io.Api.Core.V1.GCEPersistentDiskVolumeSource.t() | nil,
          awsElasticBlockStore: K8s.Io.Api.Core.V1.AWSElasticBlockStoreVolumeSource.t() | nil,
          hostPath: K8s.Io.Api.Core.V1.HostPathVolumeSource.t() | nil,
          glusterfs: K8s.Io.Api.Core.V1.GlusterfsPersistentVolumeSource.t() | nil,
          nfs: K8s.Io.Api.Core.V1.NFSVolumeSource.t() | nil,
          rbd: K8s.Io.Api.Core.V1.RBDPersistentVolumeSource.t() | nil,
          iscsi: K8s.Io.Api.Core.V1.ISCSIPersistentVolumeSource.t() | nil,
          cinder: K8s.Io.Api.Core.V1.CinderPersistentVolumeSource.t() | nil,
          cephfs: K8s.Io.Api.Core.V1.CephFSPersistentVolumeSource.t() | nil,
          fc: K8s.Io.Api.Core.V1.FCVolumeSource.t() | nil,
          flocker: K8s.Io.Api.Core.V1.FlockerVolumeSource.t() | nil,
          flexVolume: K8s.Io.Api.Core.V1.FlexPersistentVolumeSource.t() | nil,
          azureFile: K8s.Io.Api.Core.V1.AzureFilePersistentVolumeSource.t() | nil,
          vsphereVolume: K8s.Io.Api.Core.V1.VsphereVirtualDiskVolumeSource.t() | nil,
          quobyte: K8s.Io.Api.Core.V1.QuobyteVolumeSource.t() | nil,
          azureDisk: K8s.Io.Api.Core.V1.AzureDiskVolumeSource.t() | nil,
          photonPersistentDisk: K8s.Io.Api.Core.V1.PhotonPersistentDiskVolumeSource.t() | nil,
          portworxVolume: K8s.Io.Api.Core.V1.PortworxVolumeSource.t() | nil,
          scaleIO: K8s.Io.Api.Core.V1.ScaleIOPersistentVolumeSource.t() | nil,
          local: K8s.Io.Api.Core.V1.LocalVolumeSource.t() | nil,
          storageos: K8s.Io.Api.Core.V1.StorageOSPersistentVolumeSource.t() | nil,
          csi: K8s.Io.Api.Core.V1.CSIPersistentVolumeSource.t() | nil
        }
  defstruct [
    :gcePersistentDisk,
    :awsElasticBlockStore,
    :hostPath,
    :glusterfs,
    :nfs,
    :rbd,
    :iscsi,
    :cinder,
    :cephfs,
    :fc,
    :flocker,
    :flexVolume,
    :azureFile,
    :vsphereVolume,
    :quobyte,
    :azureDisk,
    :photonPersistentDisk,
    :portworxVolume,
    :scaleIO,
    :local,
    :storageos,
    :csi
  ]

  field :gcePersistentDisk, 1,
    optional: true,
    type: K8s.Io.Api.Core.V1.GCEPersistentDiskVolumeSource

  field :awsElasticBlockStore, 2,
    optional: true,
    type: K8s.Io.Api.Core.V1.AWSElasticBlockStoreVolumeSource

  field :hostPath, 3, optional: true, type: K8s.Io.Api.Core.V1.HostPathVolumeSource
  field :glusterfs, 4, optional: true, type: K8s.Io.Api.Core.V1.GlusterfsPersistentVolumeSource
  field :nfs, 5, optional: true, type: K8s.Io.Api.Core.V1.NFSVolumeSource
  field :rbd, 6, optional: true, type: K8s.Io.Api.Core.V1.RBDPersistentVolumeSource
  field :iscsi, 7, optional: true, type: K8s.Io.Api.Core.V1.ISCSIPersistentVolumeSource
  field :cinder, 8, optional: true, type: K8s.Io.Api.Core.V1.CinderPersistentVolumeSource
  field :cephfs, 9, optional: true, type: K8s.Io.Api.Core.V1.CephFSPersistentVolumeSource
  field :fc, 10, optional: true, type: K8s.Io.Api.Core.V1.FCVolumeSource
  field :flocker, 11, optional: true, type: K8s.Io.Api.Core.V1.FlockerVolumeSource
  field :flexVolume, 12, optional: true, type: K8s.Io.Api.Core.V1.FlexPersistentVolumeSource
  field :azureFile, 13, optional: true, type: K8s.Io.Api.Core.V1.AzureFilePersistentVolumeSource

  field :vsphereVolume, 14,
    optional: true,
    type: K8s.Io.Api.Core.V1.VsphereVirtualDiskVolumeSource

  field :quobyte, 15, optional: true, type: K8s.Io.Api.Core.V1.QuobyteVolumeSource
  field :azureDisk, 16, optional: true, type: K8s.Io.Api.Core.V1.AzureDiskVolumeSource

  field :photonPersistentDisk, 17,
    optional: true,
    type: K8s.Io.Api.Core.V1.PhotonPersistentDiskVolumeSource

  field :portworxVolume, 18, optional: true, type: K8s.Io.Api.Core.V1.PortworxVolumeSource
  field :scaleIO, 19, optional: true, type: K8s.Io.Api.Core.V1.ScaleIOPersistentVolumeSource
  field :local, 20, optional: true, type: K8s.Io.Api.Core.V1.LocalVolumeSource
  field :storageos, 21, optional: true, type: K8s.Io.Api.Core.V1.StorageOSPersistentVolumeSource
  field :csi, 22, optional: true, type: K8s.Io.Api.Core.V1.CSIPersistentVolumeSource
end

defmodule K8s.Io.Api.Core.V1.PersistentVolumeSpec do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          capacity: %{String.t() => K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity.t() | nil},
          persistentVolumeSource: K8s.Io.Api.Core.V1.PersistentVolumeSource.t() | nil,
          accessModes: [String.t()],
          claimRef: K8s.Io.Api.Core.V1.ObjectReference.t() | nil,
          persistentVolumeReclaimPolicy: String.t(),
          storageClassName: String.t(),
          mountOptions: [String.t()],
          volumeMode: String.t(),
          nodeAffinity: K8s.Io.Api.Core.V1.VolumeNodeAffinity.t() | nil
        }
  defstruct [
    :capacity,
    :persistentVolumeSource,
    :accessModes,
    :claimRef,
    :persistentVolumeReclaimPolicy,
    :storageClassName,
    :mountOptions,
    :volumeMode,
    :nodeAffinity
  ]

  field :capacity, 1,
    repeated: true,
    type: K8s.Io.Api.Core.V1.PersistentVolumeSpec.CapacityEntry,
    map: true

  field :persistentVolumeSource, 2,
    optional: true,
    type: K8s.Io.Api.Core.V1.PersistentVolumeSource

  field :accessModes, 3, repeated: true, type: :string
  field :claimRef, 4, optional: true, type: K8s.Io.Api.Core.V1.ObjectReference
  field :persistentVolumeReclaimPolicy, 5, optional: true, type: :string
  field :storageClassName, 6, optional: true, type: :string
  field :mountOptions, 7, repeated: true, type: :string
  field :volumeMode, 8, optional: true, type: :string
  field :nodeAffinity, 9, optional: true, type: K8s.Io.Api.Core.V1.VolumeNodeAffinity
end

defmodule K8s.Io.Api.Core.V1.PersistentVolumeSpec.CapacityEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto2

  @type t :: %__MODULE__{
          key: String.t(),
          value: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity.t() | nil
        }
  defstruct [:key, :value]

  field :key, 1, optional: true, type: :string
  field :value, 2, optional: true, type: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity
end

defmodule K8s.Io.Api.Core.V1.PersistentVolumeStatus do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          phase: String.t(),
          message: String.t(),
          reason: String.t()
        }
  defstruct [:phase, :message, :reason]

  field :phase, 1, optional: true, type: :string
  field :message, 2, optional: true, type: :string
  field :reason, 3, optional: true, type: :string
end

defmodule K8s.Io.Api.Core.V1.PhotonPersistentDiskVolumeSource do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          pdID: String.t(),
          fsType: String.t()
        }
  defstruct [:pdID, :fsType]

  field :pdID, 1, optional: true, type: :string
  field :fsType, 2, optional: true, type: :string
end

defmodule K8s.Io.Api.Core.V1.Pod do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          spec: K8s.Io.Api.Core.V1.PodSpec.t() | nil,
          status: K8s.Io.Api.Core.V1.PodStatus.t() | nil
        }
  defstruct [:metadata, :spec, :status]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :spec, 2, optional: true, type: K8s.Io.Api.Core.V1.PodSpec
  field :status, 3, optional: true, type: K8s.Io.Api.Core.V1.PodStatus
end

defmodule K8s.Io.Api.Core.V1.PodAffinity do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          requiredDuringSchedulingIgnoredDuringExecution: [K8s.Io.Api.Core.V1.PodAffinityTerm.t()],
          preferredDuringSchedulingIgnoredDuringExecution: [
            K8s.Io.Api.Core.V1.WeightedPodAffinityTerm.t()
          ]
        }
  defstruct [
    :requiredDuringSchedulingIgnoredDuringExecution,
    :preferredDuringSchedulingIgnoredDuringExecution
  ]

  field :requiredDuringSchedulingIgnoredDuringExecution, 1,
    repeated: true,
    type: K8s.Io.Api.Core.V1.PodAffinityTerm

  field :preferredDuringSchedulingIgnoredDuringExecution, 2,
    repeated: true,
    type: K8s.Io.Api.Core.V1.WeightedPodAffinityTerm
end

defmodule K8s.Io.Api.Core.V1.PodAffinityTerm do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          labelSelector: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelector.t() | nil,
          namespaces: [String.t()],
          topologyKey: String.t()
        }
  defstruct [:labelSelector, :namespaces, :topologyKey]

  field :labelSelector, 1,
    optional: true,
    type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelector

  field :namespaces, 2, repeated: true, type: :string
  field :topologyKey, 3, optional: true, type: :string
end

defmodule K8s.Io.Api.Core.V1.PodAntiAffinity do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          requiredDuringSchedulingIgnoredDuringExecution: [K8s.Io.Api.Core.V1.PodAffinityTerm.t()],
          preferredDuringSchedulingIgnoredDuringExecution: [
            K8s.Io.Api.Core.V1.WeightedPodAffinityTerm.t()
          ]
        }
  defstruct [
    :requiredDuringSchedulingIgnoredDuringExecution,
    :preferredDuringSchedulingIgnoredDuringExecution
  ]

  field :requiredDuringSchedulingIgnoredDuringExecution, 1,
    repeated: true,
    type: K8s.Io.Api.Core.V1.PodAffinityTerm

  field :preferredDuringSchedulingIgnoredDuringExecution, 2,
    repeated: true,
    type: K8s.Io.Api.Core.V1.WeightedPodAffinityTerm
end

defmodule K8s.Io.Api.Core.V1.PodAttachOptions do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          stdin: boolean,
          stdout: boolean,
          stderr: boolean,
          tty: boolean,
          container: String.t()
        }
  defstruct [:stdin, :stdout, :stderr, :tty, :container]

  field :stdin, 1, optional: true, type: :bool
  field :stdout, 2, optional: true, type: :bool
  field :stderr, 3, optional: true, type: :bool
  field :tty, 4, optional: true, type: :bool
  field :container, 5, optional: true, type: :string
end

defmodule K8s.Io.Api.Core.V1.PodCondition do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          type: String.t(),
          status: String.t(),
          lastProbeTime: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time.t() | nil,
          lastTransitionTime: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time.t() | nil,
          reason: String.t(),
          message: String.t()
        }
  defstruct [:type, :status, :lastProbeTime, :lastTransitionTime, :reason, :message]

  field :type, 1, optional: true, type: :string
  field :status, 2, optional: true, type: :string
  field :lastProbeTime, 3, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time
  field :lastTransitionTime, 4, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time
  field :reason, 5, optional: true, type: :string
  field :message, 6, optional: true, type: :string
end

defmodule K8s.Io.Api.Core.V1.PodDNSConfig do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          nameservers: [String.t()],
          searches: [String.t()],
          options: [K8s.Io.Api.Core.V1.PodDNSConfigOption.t()]
        }
  defstruct [:nameservers, :searches, :options]

  field :nameservers, 1, repeated: true, type: :string
  field :searches, 2, repeated: true, type: :string
  field :options, 3, repeated: true, type: K8s.Io.Api.Core.V1.PodDNSConfigOption
end

defmodule K8s.Io.Api.Core.V1.PodDNSConfigOption do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          name: String.t(),
          value: String.t()
        }
  defstruct [:name, :value]

  field :name, 1, optional: true, type: :string
  field :value, 2, optional: true, type: :string
end

defmodule K8s.Io.Api.Core.V1.PodExecOptions do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          stdin: boolean,
          stdout: boolean,
          stderr: boolean,
          tty: boolean,
          container: String.t(),
          command: [String.t()]
        }
  defstruct [:stdin, :stdout, :stderr, :tty, :container, :command]

  field :stdin, 1, optional: true, type: :bool
  field :stdout, 2, optional: true, type: :bool
  field :stderr, 3, optional: true, type: :bool
  field :tty, 4, optional: true, type: :bool
  field :container, 5, optional: true, type: :string
  field :command, 6, repeated: true, type: :string
end

defmodule K8s.Io.Api.Core.V1.PodIP do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          ip: String.t()
        }
  defstruct [:ip]

  field :ip, 1, optional: true, type: :string
end

defmodule K8s.Io.Api.Core.V1.PodList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [K8s.Io.Api.Core.V1.Pod.t()]
        }
  defstruct [:metadata, :items]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta
  field :items, 2, repeated: true, type: K8s.Io.Api.Core.V1.Pod
end

defmodule K8s.Io.Api.Core.V1.PodLogOptions do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          container: String.t(),
          follow: boolean,
          previous: boolean,
          sinceSeconds: integer,
          sinceTime: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time.t() | nil,
          timestamps: boolean,
          tailLines: integer,
          limitBytes: integer
        }
  defstruct [
    :container,
    :follow,
    :previous,
    :sinceSeconds,
    :sinceTime,
    :timestamps,
    :tailLines,
    :limitBytes
  ]

  field :container, 1, optional: true, type: :string
  field :follow, 2, optional: true, type: :bool
  field :previous, 3, optional: true, type: :bool
  field :sinceSeconds, 4, optional: true, type: :int64
  field :sinceTime, 5, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time
  field :timestamps, 6, optional: true, type: :bool
  field :tailLines, 7, optional: true, type: :int64
  field :limitBytes, 8, optional: true, type: :int64
end

defmodule K8s.Io.Api.Core.V1.PodPortForwardOptions do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          ports: [integer]
        }
  defstruct [:ports]

  field :ports, 1, repeated: true, type: :int32
end

defmodule K8s.Io.Api.Core.V1.PodProxyOptions do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          path: String.t()
        }
  defstruct [:path]

  field :path, 1, optional: true, type: :string
end

defmodule K8s.Io.Api.Core.V1.PodReadinessGate do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          conditionType: String.t()
        }
  defstruct [:conditionType]

  field :conditionType, 1, optional: true, type: :string
end

defmodule K8s.Io.Api.Core.V1.PodSecurityContext do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          seLinuxOptions: K8s.Io.Api.Core.V1.SELinuxOptions.t() | nil,
          windowsOptions: K8s.Io.Api.Core.V1.WindowsSecurityContextOptions.t() | nil,
          runAsUser: integer,
          runAsGroup: integer,
          runAsNonRoot: boolean,
          supplementalGroups: [integer],
          fsGroup: integer,
          sysctls: [K8s.Io.Api.Core.V1.Sysctl.t()]
        }
  defstruct [
    :seLinuxOptions,
    :windowsOptions,
    :runAsUser,
    :runAsGroup,
    :runAsNonRoot,
    :supplementalGroups,
    :fsGroup,
    :sysctls
  ]

  field :seLinuxOptions, 1, optional: true, type: K8s.Io.Api.Core.V1.SELinuxOptions
  field :windowsOptions, 8, optional: true, type: K8s.Io.Api.Core.V1.WindowsSecurityContextOptions
  field :runAsUser, 2, optional: true, type: :int64
  field :runAsGroup, 6, optional: true, type: :int64
  field :runAsNonRoot, 3, optional: true, type: :bool
  field :supplementalGroups, 4, repeated: true, type: :int64
  field :fsGroup, 5, optional: true, type: :int64
  field :sysctls, 7, repeated: true, type: K8s.Io.Api.Core.V1.Sysctl
end

defmodule K8s.Io.Api.Core.V1.PodSignature do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          podController: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.OwnerReference.t() | nil
        }
  defstruct [:podController]

  field :podController, 1,
    optional: true,
    type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.OwnerReference
end

defmodule K8s.Io.Api.Core.V1.PodSpec do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          volumes: [K8s.Io.Api.Core.V1.Volume.t()],
          initContainers: [K8s.Io.Api.Core.V1.Container.t()],
          containers: [K8s.Io.Api.Core.V1.Container.t()],
          ephemeralContainers: [K8s.Io.Api.Core.V1.EphemeralContainer.t()],
          restartPolicy: String.t(),
          terminationGracePeriodSeconds: integer,
          activeDeadlineSeconds: integer,
          dnsPolicy: String.t(),
          nodeSelector: %{String.t() => String.t()},
          serviceAccountName: String.t(),
          serviceAccount: String.t(),
          automountServiceAccountToken: boolean,
          nodeName: String.t(),
          hostNetwork: boolean,
          hostPID: boolean,
          hostIPC: boolean,
          shareProcessNamespace: boolean,
          securityContext: K8s.Io.Api.Core.V1.PodSecurityContext.t() | nil,
          imagePullSecrets: [K8s.Io.Api.Core.V1.LocalObjectReference.t()],
          hostname: String.t(),
          subdomain: String.t(),
          affinity: K8s.Io.Api.Core.V1.Affinity.t() | nil,
          schedulerName: String.t(),
          tolerations: [K8s.Io.Api.Core.V1.Toleration.t()],
          hostAliases: [K8s.Io.Api.Core.V1.HostAlias.t()],
          priorityClassName: String.t(),
          priority: integer,
          dnsConfig: K8s.Io.Api.Core.V1.PodDNSConfig.t() | nil,
          readinessGates: [K8s.Io.Api.Core.V1.PodReadinessGate.t()],
          runtimeClassName: String.t(),
          enableServiceLinks: boolean,
          preemptionPolicy: String.t(),
          overhead: %{String.t() => K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity.t() | nil},
          topologySpreadConstraints: [K8s.Io.Api.Core.V1.TopologySpreadConstraint.t()]
        }
  defstruct [
    :volumes,
    :initContainers,
    :containers,
    :ephemeralContainers,
    :restartPolicy,
    :terminationGracePeriodSeconds,
    :activeDeadlineSeconds,
    :dnsPolicy,
    :nodeSelector,
    :serviceAccountName,
    :serviceAccount,
    :automountServiceAccountToken,
    :nodeName,
    :hostNetwork,
    :hostPID,
    :hostIPC,
    :shareProcessNamespace,
    :securityContext,
    :imagePullSecrets,
    :hostname,
    :subdomain,
    :affinity,
    :schedulerName,
    :tolerations,
    :hostAliases,
    :priorityClassName,
    :priority,
    :dnsConfig,
    :readinessGates,
    :runtimeClassName,
    :enableServiceLinks,
    :preemptionPolicy,
    :overhead,
    :topologySpreadConstraints
  ]

  field :volumes, 1, repeated: true, type: K8s.Io.Api.Core.V1.Volume
  field :initContainers, 20, repeated: true, type: K8s.Io.Api.Core.V1.Container
  field :containers, 2, repeated: true, type: K8s.Io.Api.Core.V1.Container
  field :ephemeralContainers, 34, repeated: true, type: K8s.Io.Api.Core.V1.EphemeralContainer
  field :restartPolicy, 3, optional: true, type: :string
  field :terminationGracePeriodSeconds, 4, optional: true, type: :int64
  field :activeDeadlineSeconds, 5, optional: true, type: :int64
  field :dnsPolicy, 6, optional: true, type: :string

  field :nodeSelector, 7,
    repeated: true,
    type: K8s.Io.Api.Core.V1.PodSpec.NodeSelectorEntry,
    map: true

  field :serviceAccountName, 8, optional: true, type: :string
  field :serviceAccount, 9, optional: true, type: :string
  field :automountServiceAccountToken, 21, optional: true, type: :bool
  field :nodeName, 10, optional: true, type: :string
  field :hostNetwork, 11, optional: true, type: :bool
  field :hostPID, 12, optional: true, type: :bool
  field :hostIPC, 13, optional: true, type: :bool
  field :shareProcessNamespace, 27, optional: true, type: :bool
  field :securityContext, 14, optional: true, type: K8s.Io.Api.Core.V1.PodSecurityContext
  field :imagePullSecrets, 15, repeated: true, type: K8s.Io.Api.Core.V1.LocalObjectReference
  field :hostname, 16, optional: true, type: :string
  field :subdomain, 17, optional: true, type: :string
  field :affinity, 18, optional: true, type: K8s.Io.Api.Core.V1.Affinity
  field :schedulerName, 19, optional: true, type: :string
  field :tolerations, 22, repeated: true, type: K8s.Io.Api.Core.V1.Toleration
  field :hostAliases, 23, repeated: true, type: K8s.Io.Api.Core.V1.HostAlias
  field :priorityClassName, 24, optional: true, type: :string
  field :priority, 25, optional: true, type: :int32
  field :dnsConfig, 26, optional: true, type: K8s.Io.Api.Core.V1.PodDNSConfig
  field :readinessGates, 28, repeated: true, type: K8s.Io.Api.Core.V1.PodReadinessGate
  field :runtimeClassName, 29, optional: true, type: :string
  field :enableServiceLinks, 30, optional: true, type: :bool
  field :preemptionPolicy, 31, optional: true, type: :string
  field :overhead, 32, repeated: true, type: K8s.Io.Api.Core.V1.PodSpec.OverheadEntry, map: true

  field :topologySpreadConstraints, 33,
    repeated: true,
    type: K8s.Io.Api.Core.V1.TopologySpreadConstraint
end

defmodule K8s.Io.Api.Core.V1.PodSpec.NodeSelectorEntry do
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

defmodule K8s.Io.Api.Core.V1.PodSpec.OverheadEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto2

  @type t :: %__MODULE__{
          key: String.t(),
          value: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity.t() | nil
        }
  defstruct [:key, :value]

  field :key, 1, optional: true, type: :string
  field :value, 2, optional: true, type: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity
end

defmodule K8s.Io.Api.Core.V1.PodStatus do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          phase: String.t(),
          conditions: [K8s.Io.Api.Core.V1.PodCondition.t()],
          message: String.t(),
          reason: String.t(),
          nominatedNodeName: String.t(),
          hostIP: String.t(),
          podIP: String.t(),
          podIPs: [K8s.Io.Api.Core.V1.PodIP.t()],
          startTime: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time.t() | nil,
          initContainerStatuses: [K8s.Io.Api.Core.V1.ContainerStatus.t()],
          containerStatuses: [K8s.Io.Api.Core.V1.ContainerStatus.t()],
          qosClass: String.t(),
          ephemeralContainerStatuses: [K8s.Io.Api.Core.V1.ContainerStatus.t()]
        }
  defstruct [
    :phase,
    :conditions,
    :message,
    :reason,
    :nominatedNodeName,
    :hostIP,
    :podIP,
    :podIPs,
    :startTime,
    :initContainerStatuses,
    :containerStatuses,
    :qosClass,
    :ephemeralContainerStatuses
  ]

  field :phase, 1, optional: true, type: :string
  field :conditions, 2, repeated: true, type: K8s.Io.Api.Core.V1.PodCondition
  field :message, 3, optional: true, type: :string
  field :reason, 4, optional: true, type: :string
  field :nominatedNodeName, 11, optional: true, type: :string
  field :hostIP, 5, optional: true, type: :string
  field :podIP, 6, optional: true, type: :string
  field :podIPs, 12, repeated: true, type: K8s.Io.Api.Core.V1.PodIP
  field :startTime, 7, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time
  field :initContainerStatuses, 10, repeated: true, type: K8s.Io.Api.Core.V1.ContainerStatus
  field :containerStatuses, 8, repeated: true, type: K8s.Io.Api.Core.V1.ContainerStatus
  field :qosClass, 9, optional: true, type: :string
  field :ephemeralContainerStatuses, 13, repeated: true, type: K8s.Io.Api.Core.V1.ContainerStatus
end

defmodule K8s.Io.Api.Core.V1.PodStatusResult do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          status: K8s.Io.Api.Core.V1.PodStatus.t() | nil
        }
  defstruct [:metadata, :status]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :status, 2, optional: true, type: K8s.Io.Api.Core.V1.PodStatus
end

defmodule K8s.Io.Api.Core.V1.PodTemplate do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          template: K8s.Io.Api.Core.V1.PodTemplateSpec.t() | nil
        }
  defstruct [:metadata, :template]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :template, 2, optional: true, type: K8s.Io.Api.Core.V1.PodTemplateSpec
end

defmodule K8s.Io.Api.Core.V1.PodTemplateList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [K8s.Io.Api.Core.V1.PodTemplate.t()]
        }
  defstruct [:metadata, :items]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta
  field :items, 2, repeated: true, type: K8s.Io.Api.Core.V1.PodTemplate
end

defmodule K8s.Io.Api.Core.V1.PodTemplateSpec do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          spec: K8s.Io.Api.Core.V1.PodSpec.t() | nil
        }
  defstruct [:metadata, :spec]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :spec, 2, optional: true, type: K8s.Io.Api.Core.V1.PodSpec
end

defmodule K8s.Io.Api.Core.V1.PortworxVolumeSource do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          volumeID: String.t(),
          fsType: String.t(),
          readOnly: boolean
        }
  defstruct [:volumeID, :fsType, :readOnly]

  field :volumeID, 1, optional: true, type: :string
  field :fsType, 2, optional: true, type: :string
  field :readOnly, 3, optional: true, type: :bool
end

defmodule K8s.Io.Api.Core.V1.Preconditions do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          uid: String.t()
        }
  defstruct [:uid]

  field :uid, 1, optional: true, type: :string
end

defmodule K8s.Io.Api.Core.V1.PreferAvoidPodsEntry do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          podSignature: K8s.Io.Api.Core.V1.PodSignature.t() | nil,
          evictionTime: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time.t() | nil,
          reason: String.t(),
          message: String.t()
        }
  defstruct [:podSignature, :evictionTime, :reason, :message]

  field :podSignature, 1, optional: true, type: K8s.Io.Api.Core.V1.PodSignature
  field :evictionTime, 2, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time
  field :reason, 3, optional: true, type: :string
  field :message, 4, optional: true, type: :string
end

defmodule K8s.Io.Api.Core.V1.PreferredSchedulingTerm do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          weight: integer,
          preference: K8s.Io.Api.Core.V1.NodeSelectorTerm.t() | nil
        }
  defstruct [:weight, :preference]

  field :weight, 1, optional: true, type: :int32
  field :preference, 2, optional: true, type: K8s.Io.Api.Core.V1.NodeSelectorTerm
end

defmodule K8s.Io.Api.Core.V1.Probe do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          handler: K8s.Io.Api.Core.V1.Handler.t() | nil,
          initialDelaySeconds: integer,
          timeoutSeconds: integer,
          periodSeconds: integer,
          successThreshold: integer,
          failureThreshold: integer
        }
  defstruct [
    :handler,
    :initialDelaySeconds,
    :timeoutSeconds,
    :periodSeconds,
    :successThreshold,
    :failureThreshold
  ]

  field :handler, 1, optional: true, type: K8s.Io.Api.Core.V1.Handler
  field :initialDelaySeconds, 2, optional: true, type: :int32
  field :timeoutSeconds, 3, optional: true, type: :int32
  field :periodSeconds, 4, optional: true, type: :int32
  field :successThreshold, 5, optional: true, type: :int32
  field :failureThreshold, 6, optional: true, type: :int32
end

defmodule K8s.Io.Api.Core.V1.ProjectedVolumeSource do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          sources: [K8s.Io.Api.Core.V1.VolumeProjection.t()],
          defaultMode: integer
        }
  defstruct [:sources, :defaultMode]

  field :sources, 1, repeated: true, type: K8s.Io.Api.Core.V1.VolumeProjection
  field :defaultMode, 2, optional: true, type: :int32
end

defmodule K8s.Io.Api.Core.V1.QuobyteVolumeSource do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          registry: String.t(),
          volume: String.t(),
          readOnly: boolean,
          user: String.t(),
          group: String.t(),
          tenant: String.t()
        }
  defstruct [:registry, :volume, :readOnly, :user, :group, :tenant]

  field :registry, 1, optional: true, type: :string
  field :volume, 2, optional: true, type: :string
  field :readOnly, 3, optional: true, type: :bool
  field :user, 4, optional: true, type: :string
  field :group, 5, optional: true, type: :string
  field :tenant, 6, optional: true, type: :string
end

defmodule K8s.Io.Api.Core.V1.RBDPersistentVolumeSource do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          monitors: [String.t()],
          image: String.t(),
          fsType: String.t(),
          pool: String.t(),
          user: String.t(),
          keyring: String.t(),
          secretRef: K8s.Io.Api.Core.V1.SecretReference.t() | nil,
          readOnly: boolean
        }
  defstruct [:monitors, :image, :fsType, :pool, :user, :keyring, :secretRef, :readOnly]

  field :monitors, 1, repeated: true, type: :string
  field :image, 2, optional: true, type: :string
  field :fsType, 3, optional: true, type: :string
  field :pool, 4, optional: true, type: :string
  field :user, 5, optional: true, type: :string
  field :keyring, 6, optional: true, type: :string
  field :secretRef, 7, optional: true, type: K8s.Io.Api.Core.V1.SecretReference
  field :readOnly, 8, optional: true, type: :bool
end

defmodule K8s.Io.Api.Core.V1.RBDVolumeSource do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          monitors: [String.t()],
          image: String.t(),
          fsType: String.t(),
          pool: String.t(),
          user: String.t(),
          keyring: String.t(),
          secretRef: K8s.Io.Api.Core.V1.LocalObjectReference.t() | nil,
          readOnly: boolean
        }
  defstruct [:monitors, :image, :fsType, :pool, :user, :keyring, :secretRef, :readOnly]

  field :monitors, 1, repeated: true, type: :string
  field :image, 2, optional: true, type: :string
  field :fsType, 3, optional: true, type: :string
  field :pool, 4, optional: true, type: :string
  field :user, 5, optional: true, type: :string
  field :keyring, 6, optional: true, type: :string
  field :secretRef, 7, optional: true, type: K8s.Io.Api.Core.V1.LocalObjectReference
  field :readOnly, 8, optional: true, type: :bool
end

defmodule K8s.Io.Api.Core.V1.RangeAllocation do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          range: String.t(),
          data: binary
        }
  defstruct [:metadata, :range, :data]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :range, 2, optional: true, type: :string
  field :data, 3, optional: true, type: :bytes
end

defmodule K8s.Io.Api.Core.V1.ReplicationController do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          spec: K8s.Io.Api.Core.V1.ReplicationControllerSpec.t() | nil,
          status: K8s.Io.Api.Core.V1.ReplicationControllerStatus.t() | nil
        }
  defstruct [:metadata, :spec, :status]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :spec, 2, optional: true, type: K8s.Io.Api.Core.V1.ReplicationControllerSpec
  field :status, 3, optional: true, type: K8s.Io.Api.Core.V1.ReplicationControllerStatus
end

defmodule K8s.Io.Api.Core.V1.ReplicationControllerCondition do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          type: String.t(),
          status: String.t(),
          lastTransitionTime: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time.t() | nil,
          reason: String.t(),
          message: String.t()
        }
  defstruct [:type, :status, :lastTransitionTime, :reason, :message]

  field :type, 1, optional: true, type: :string
  field :status, 2, optional: true, type: :string
  field :lastTransitionTime, 3, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time
  field :reason, 4, optional: true, type: :string
  field :message, 5, optional: true, type: :string
end

defmodule K8s.Io.Api.Core.V1.ReplicationControllerList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [K8s.Io.Api.Core.V1.ReplicationController.t()]
        }
  defstruct [:metadata, :items]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta
  field :items, 2, repeated: true, type: K8s.Io.Api.Core.V1.ReplicationController
end

defmodule K8s.Io.Api.Core.V1.ReplicationControllerSpec do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          replicas: integer,
          minReadySeconds: integer,
          selector: %{String.t() => String.t()},
          template: K8s.Io.Api.Core.V1.PodTemplateSpec.t() | nil
        }
  defstruct [:replicas, :minReadySeconds, :selector, :template]

  field :replicas, 1, optional: true, type: :int32
  field :minReadySeconds, 4, optional: true, type: :int32

  field :selector, 2,
    repeated: true,
    type: K8s.Io.Api.Core.V1.ReplicationControllerSpec.SelectorEntry,
    map: true

  field :template, 3, optional: true, type: K8s.Io.Api.Core.V1.PodTemplateSpec
end

defmodule K8s.Io.Api.Core.V1.ReplicationControllerSpec.SelectorEntry do
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

defmodule K8s.Io.Api.Core.V1.ReplicationControllerStatus do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          replicas: integer,
          fullyLabeledReplicas: integer,
          readyReplicas: integer,
          availableReplicas: integer,
          observedGeneration: integer,
          conditions: [K8s.Io.Api.Core.V1.ReplicationControllerCondition.t()]
        }
  defstruct [
    :replicas,
    :fullyLabeledReplicas,
    :readyReplicas,
    :availableReplicas,
    :observedGeneration,
    :conditions
  ]

  field :replicas, 1, optional: true, type: :int32
  field :fullyLabeledReplicas, 2, optional: true, type: :int32
  field :readyReplicas, 4, optional: true, type: :int32
  field :availableReplicas, 5, optional: true, type: :int32
  field :observedGeneration, 3, optional: true, type: :int64
  field :conditions, 6, repeated: true, type: K8s.Io.Api.Core.V1.ReplicationControllerCondition
end

defmodule K8s.Io.Api.Core.V1.ResourceFieldSelector do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          containerName: String.t(),
          resource: String.t(),
          divisor: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity.t() | nil
        }
  defstruct [:containerName, :resource, :divisor]

  field :containerName, 1, optional: true, type: :string
  field :resource, 2, optional: true, type: :string
  field :divisor, 3, optional: true, type: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity
end

defmodule K8s.Io.Api.Core.V1.ResourceQuota do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          spec: K8s.Io.Api.Core.V1.ResourceQuotaSpec.t() | nil,
          status: K8s.Io.Api.Core.V1.ResourceQuotaStatus.t() | nil
        }
  defstruct [:metadata, :spec, :status]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :spec, 2, optional: true, type: K8s.Io.Api.Core.V1.ResourceQuotaSpec
  field :status, 3, optional: true, type: K8s.Io.Api.Core.V1.ResourceQuotaStatus
end

defmodule K8s.Io.Api.Core.V1.ResourceQuotaList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [K8s.Io.Api.Core.V1.ResourceQuota.t()]
        }
  defstruct [:metadata, :items]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta
  field :items, 2, repeated: true, type: K8s.Io.Api.Core.V1.ResourceQuota
end

defmodule K8s.Io.Api.Core.V1.ResourceQuotaSpec do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          hard: %{String.t() => K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity.t() | nil},
          scopes: [String.t()],
          scopeSelector: K8s.Io.Api.Core.V1.ScopeSelector.t() | nil
        }
  defstruct [:hard, :scopes, :scopeSelector]

  field :hard, 1, repeated: true, type: K8s.Io.Api.Core.V1.ResourceQuotaSpec.HardEntry, map: true
  field :scopes, 2, repeated: true, type: :string
  field :scopeSelector, 3, optional: true, type: K8s.Io.Api.Core.V1.ScopeSelector
end

defmodule K8s.Io.Api.Core.V1.ResourceQuotaSpec.HardEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto2

  @type t :: %__MODULE__{
          key: String.t(),
          value: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity.t() | nil
        }
  defstruct [:key, :value]

  field :key, 1, optional: true, type: :string
  field :value, 2, optional: true, type: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity
end

defmodule K8s.Io.Api.Core.V1.ResourceQuotaStatus do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          hard: %{String.t() => K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity.t() | nil},
          used: %{String.t() => K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity.t() | nil}
        }
  defstruct [:hard, :used]

  field :hard, 1,
    repeated: true,
    type: K8s.Io.Api.Core.V1.ResourceQuotaStatus.HardEntry,
    map: true

  field :used, 2,
    repeated: true,
    type: K8s.Io.Api.Core.V1.ResourceQuotaStatus.UsedEntry,
    map: true
end

defmodule K8s.Io.Api.Core.V1.ResourceQuotaStatus.HardEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto2

  @type t :: %__MODULE__{
          key: String.t(),
          value: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity.t() | nil
        }
  defstruct [:key, :value]

  field :key, 1, optional: true, type: :string
  field :value, 2, optional: true, type: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity
end

defmodule K8s.Io.Api.Core.V1.ResourceQuotaStatus.UsedEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto2

  @type t :: %__MODULE__{
          key: String.t(),
          value: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity.t() | nil
        }
  defstruct [:key, :value]

  field :key, 1, optional: true, type: :string
  field :value, 2, optional: true, type: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity
end

defmodule K8s.Io.Api.Core.V1.ResourceRequirements do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          limits: %{String.t() => K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity.t() | nil},
          requests: %{String.t() => K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity.t() | nil}
        }
  defstruct [:limits, :requests]

  field :limits, 1,
    repeated: true,
    type: K8s.Io.Api.Core.V1.ResourceRequirements.LimitsEntry,
    map: true

  field :requests, 2,
    repeated: true,
    type: K8s.Io.Api.Core.V1.ResourceRequirements.RequestsEntry,
    map: true
end

defmodule K8s.Io.Api.Core.V1.ResourceRequirements.LimitsEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto2

  @type t :: %__MODULE__{
          key: String.t(),
          value: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity.t() | nil
        }
  defstruct [:key, :value]

  field :key, 1, optional: true, type: :string
  field :value, 2, optional: true, type: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity
end

defmodule K8s.Io.Api.Core.V1.ResourceRequirements.RequestsEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto2

  @type t :: %__MODULE__{
          key: String.t(),
          value: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity.t() | nil
        }
  defstruct [:key, :value]

  field :key, 1, optional: true, type: :string
  field :value, 2, optional: true, type: K8s.Io.Apimachinery.Pkg.Api.Resource.Quantity
end

defmodule K8s.Io.Api.Core.V1.SELinuxOptions do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          user: String.t(),
          role: String.t(),
          type: String.t(),
          level: String.t()
        }
  defstruct [:user, :role, :type, :level]

  field :user, 1, optional: true, type: :string
  field :role, 2, optional: true, type: :string
  field :type, 3, optional: true, type: :string
  field :level, 4, optional: true, type: :string
end

defmodule K8s.Io.Api.Core.V1.ScaleIOPersistentVolumeSource do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          gateway: String.t(),
          system: String.t(),
          secretRef: K8s.Io.Api.Core.V1.SecretReference.t() | nil,
          sslEnabled: boolean,
          protectionDomain: String.t(),
          storagePool: String.t(),
          storageMode: String.t(),
          volumeName: String.t(),
          fsType: String.t(),
          readOnly: boolean
        }
  defstruct [
    :gateway,
    :system,
    :secretRef,
    :sslEnabled,
    :protectionDomain,
    :storagePool,
    :storageMode,
    :volumeName,
    :fsType,
    :readOnly
  ]

  field :gateway, 1, optional: true, type: :string
  field :system, 2, optional: true, type: :string
  field :secretRef, 3, optional: true, type: K8s.Io.Api.Core.V1.SecretReference
  field :sslEnabled, 4, optional: true, type: :bool
  field :protectionDomain, 5, optional: true, type: :string
  field :storagePool, 6, optional: true, type: :string
  field :storageMode, 7, optional: true, type: :string
  field :volumeName, 8, optional: true, type: :string
  field :fsType, 9, optional: true, type: :string
  field :readOnly, 10, optional: true, type: :bool
end

defmodule K8s.Io.Api.Core.V1.ScaleIOVolumeSource do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          gateway: String.t(),
          system: String.t(),
          secretRef: K8s.Io.Api.Core.V1.LocalObjectReference.t() | nil,
          sslEnabled: boolean,
          protectionDomain: String.t(),
          storagePool: String.t(),
          storageMode: String.t(),
          volumeName: String.t(),
          fsType: String.t(),
          readOnly: boolean
        }
  defstruct [
    :gateway,
    :system,
    :secretRef,
    :sslEnabled,
    :protectionDomain,
    :storagePool,
    :storageMode,
    :volumeName,
    :fsType,
    :readOnly
  ]

  field :gateway, 1, optional: true, type: :string
  field :system, 2, optional: true, type: :string
  field :secretRef, 3, optional: true, type: K8s.Io.Api.Core.V1.LocalObjectReference
  field :sslEnabled, 4, optional: true, type: :bool
  field :protectionDomain, 5, optional: true, type: :string
  field :storagePool, 6, optional: true, type: :string
  field :storageMode, 7, optional: true, type: :string
  field :volumeName, 8, optional: true, type: :string
  field :fsType, 9, optional: true, type: :string
  field :readOnly, 10, optional: true, type: :bool
end

defmodule K8s.Io.Api.Core.V1.ScopeSelector do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          matchExpressions: [K8s.Io.Api.Core.V1.ScopedResourceSelectorRequirement.t()]
        }
  defstruct [:matchExpressions]

  field :matchExpressions, 1,
    repeated: true,
    type: K8s.Io.Api.Core.V1.ScopedResourceSelectorRequirement
end

defmodule K8s.Io.Api.Core.V1.ScopedResourceSelectorRequirement do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          scopeName: String.t(),
          operator: String.t(),
          values: [String.t()]
        }
  defstruct [:scopeName, :operator, :values]

  field :scopeName, 1, optional: true, type: :string
  field :operator, 2, optional: true, type: :string
  field :values, 3, repeated: true, type: :string
end

defmodule K8s.Io.Api.Core.V1.Secret do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          data: %{String.t() => binary},
          stringData: %{String.t() => String.t()},
          type: String.t()
        }
  defstruct [:metadata, :data, :stringData, :type]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :data, 2, repeated: true, type: K8s.Io.Api.Core.V1.Secret.DataEntry, map: true
  field :stringData, 4, repeated: true, type: K8s.Io.Api.Core.V1.Secret.StringDataEntry, map: true
  field :type, 3, optional: true, type: :string
end

defmodule K8s.Io.Api.Core.V1.Secret.DataEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto2

  @type t :: %__MODULE__{
          key: String.t(),
          value: binary
        }
  defstruct [:key, :value]

  field :key, 1, optional: true, type: :string
  field :value, 2, optional: true, type: :bytes
end

defmodule K8s.Io.Api.Core.V1.Secret.StringDataEntry do
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

defmodule K8s.Io.Api.Core.V1.SecretEnvSource do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          localObjectReference: K8s.Io.Api.Core.V1.LocalObjectReference.t() | nil,
          optional: boolean
        }
  defstruct [:localObjectReference, :optional]

  field :localObjectReference, 1, optional: true, type: K8s.Io.Api.Core.V1.LocalObjectReference
  field :optional, 2, optional: true, type: :bool
end

defmodule K8s.Io.Api.Core.V1.SecretKeySelector do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          localObjectReference: K8s.Io.Api.Core.V1.LocalObjectReference.t() | nil,
          key: String.t(),
          optional: boolean
        }
  defstruct [:localObjectReference, :key, :optional]

  field :localObjectReference, 1, optional: true, type: K8s.Io.Api.Core.V1.LocalObjectReference
  field :key, 2, optional: true, type: :string
  field :optional, 3, optional: true, type: :bool
end

defmodule K8s.Io.Api.Core.V1.SecretList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [K8s.Io.Api.Core.V1.Secret.t()]
        }
  defstruct [:metadata, :items]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta
  field :items, 2, repeated: true, type: K8s.Io.Api.Core.V1.Secret
end

defmodule K8s.Io.Api.Core.V1.SecretProjection do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          localObjectReference: K8s.Io.Api.Core.V1.LocalObjectReference.t() | nil,
          items: [K8s.Io.Api.Core.V1.KeyToPath.t()],
          optional: boolean
        }
  defstruct [:localObjectReference, :items, :optional]

  field :localObjectReference, 1, optional: true, type: K8s.Io.Api.Core.V1.LocalObjectReference
  field :items, 2, repeated: true, type: K8s.Io.Api.Core.V1.KeyToPath
  field :optional, 4, optional: true, type: :bool
end

defmodule K8s.Io.Api.Core.V1.SecretReference do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          name: String.t(),
          namespace: String.t()
        }
  defstruct [:name, :namespace]

  field :name, 1, optional: true, type: :string
  field :namespace, 2, optional: true, type: :string
end

defmodule K8s.Io.Api.Core.V1.SecretVolumeSource do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          secretName: String.t(),
          items: [K8s.Io.Api.Core.V1.KeyToPath.t()],
          defaultMode: integer,
          optional: boolean
        }
  defstruct [:secretName, :items, :defaultMode, :optional]

  field :secretName, 1, optional: true, type: :string
  field :items, 2, repeated: true, type: K8s.Io.Api.Core.V1.KeyToPath
  field :defaultMode, 3, optional: true, type: :int32
  field :optional, 4, optional: true, type: :bool
end

defmodule K8s.Io.Api.Core.V1.SecurityContext do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          capabilities: K8s.Io.Api.Core.V1.Capabilities.t() | nil,
          privileged: boolean,
          seLinuxOptions: K8s.Io.Api.Core.V1.SELinuxOptions.t() | nil,
          windowsOptions: K8s.Io.Api.Core.V1.WindowsSecurityContextOptions.t() | nil,
          runAsUser: integer,
          runAsGroup: integer,
          runAsNonRoot: boolean,
          readOnlyRootFilesystem: boolean,
          allowPrivilegeEscalation: boolean,
          procMount: String.t()
        }
  defstruct [
    :capabilities,
    :privileged,
    :seLinuxOptions,
    :windowsOptions,
    :runAsUser,
    :runAsGroup,
    :runAsNonRoot,
    :readOnlyRootFilesystem,
    :allowPrivilegeEscalation,
    :procMount
  ]

  field :capabilities, 1, optional: true, type: K8s.Io.Api.Core.V1.Capabilities
  field :privileged, 2, optional: true, type: :bool
  field :seLinuxOptions, 3, optional: true, type: K8s.Io.Api.Core.V1.SELinuxOptions

  field :windowsOptions, 10,
    optional: true,
    type: K8s.Io.Api.Core.V1.WindowsSecurityContextOptions

  field :runAsUser, 4, optional: true, type: :int64
  field :runAsGroup, 8, optional: true, type: :int64
  field :runAsNonRoot, 5, optional: true, type: :bool
  field :readOnlyRootFilesystem, 6, optional: true, type: :bool
  field :allowPrivilegeEscalation, 7, optional: true, type: :bool
  field :procMount, 9, optional: true, type: :string
end

defmodule K8s.Io.Api.Core.V1.SerializedReference do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          reference: K8s.Io.Api.Core.V1.ObjectReference.t() | nil
        }
  defstruct [:reference]

  field :reference, 1, optional: true, type: K8s.Io.Api.Core.V1.ObjectReference
end

defmodule K8s.Io.Api.Core.V1.Service do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          spec: K8s.Io.Api.Core.V1.ServiceSpec.t() | nil,
          status: K8s.Io.Api.Core.V1.ServiceStatus.t() | nil
        }
  defstruct [:metadata, :spec, :status]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :spec, 2, optional: true, type: K8s.Io.Api.Core.V1.ServiceSpec
  field :status, 3, optional: true, type: K8s.Io.Api.Core.V1.ServiceStatus
end

defmodule K8s.Io.Api.Core.V1.ServiceAccount do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          secrets: [K8s.Io.Api.Core.V1.ObjectReference.t()],
          imagePullSecrets: [K8s.Io.Api.Core.V1.LocalObjectReference.t()],
          automountServiceAccountToken: boolean
        }
  defstruct [:metadata, :secrets, :imagePullSecrets, :automountServiceAccountToken]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :secrets, 2, repeated: true, type: K8s.Io.Api.Core.V1.ObjectReference
  field :imagePullSecrets, 3, repeated: true, type: K8s.Io.Api.Core.V1.LocalObjectReference
  field :automountServiceAccountToken, 4, optional: true, type: :bool
end

defmodule K8s.Io.Api.Core.V1.ServiceAccountList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [K8s.Io.Api.Core.V1.ServiceAccount.t()]
        }
  defstruct [:metadata, :items]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta
  field :items, 2, repeated: true, type: K8s.Io.Api.Core.V1.ServiceAccount
end

defmodule K8s.Io.Api.Core.V1.ServiceAccountTokenProjection do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          audience: String.t(),
          expirationSeconds: integer,
          path: String.t()
        }
  defstruct [:audience, :expirationSeconds, :path]

  field :audience, 1, optional: true, type: :string
  field :expirationSeconds, 2, optional: true, type: :int64
  field :path, 3, optional: true, type: :string
end

defmodule K8s.Io.Api.Core.V1.ServiceList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [K8s.Io.Api.Core.V1.Service.t()]
        }
  defstruct [:metadata, :items]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta
  field :items, 2, repeated: true, type: K8s.Io.Api.Core.V1.Service
end

defmodule K8s.Io.Api.Core.V1.ServicePort do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          name: String.t(),
          protocol: String.t(),
          port: integer,
          targetPort: K8s.Io.Apimachinery.Pkg.Util.Intstr.IntOrString.t() | nil,
          nodePort: integer
        }
  defstruct [:name, :protocol, :port, :targetPort, :nodePort]

  field :name, 1, optional: true, type: :string
  field :protocol, 2, optional: true, type: :string
  field :port, 3, optional: true, type: :int32
  field :targetPort, 4, optional: true, type: K8s.Io.Apimachinery.Pkg.Util.Intstr.IntOrString
  field :nodePort, 5, optional: true, type: :int32
end

defmodule K8s.Io.Api.Core.V1.ServiceProxyOptions do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          path: String.t()
        }
  defstruct [:path]

  field :path, 1, optional: true, type: :string
end

defmodule K8s.Io.Api.Core.V1.ServiceSpec do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          ports: [K8s.Io.Api.Core.V1.ServicePort.t()],
          selector: %{String.t() => String.t()},
          clusterIP: String.t(),
          type: String.t(),
          externalIPs: [String.t()],
          sessionAffinity: String.t(),
          loadBalancerIP: String.t(),
          loadBalancerSourceRanges: [String.t()],
          externalName: String.t(),
          externalTrafficPolicy: String.t(),
          healthCheckNodePort: integer,
          publishNotReadyAddresses: boolean,
          sessionAffinityConfig: K8s.Io.Api.Core.V1.SessionAffinityConfig.t() | nil,
          ipFamily: String.t()
        }
  defstruct [
    :ports,
    :selector,
    :clusterIP,
    :type,
    :externalIPs,
    :sessionAffinity,
    :loadBalancerIP,
    :loadBalancerSourceRanges,
    :externalName,
    :externalTrafficPolicy,
    :healthCheckNodePort,
    :publishNotReadyAddresses,
    :sessionAffinityConfig,
    :ipFamily
  ]

  field :ports, 1, repeated: true, type: K8s.Io.Api.Core.V1.ServicePort

  field :selector, 2,
    repeated: true,
    type: K8s.Io.Api.Core.V1.ServiceSpec.SelectorEntry,
    map: true

  field :clusterIP, 3, optional: true, type: :string
  field :type, 4, optional: true, type: :string
  field :externalIPs, 5, repeated: true, type: :string
  field :sessionAffinity, 7, optional: true, type: :string
  field :loadBalancerIP, 8, optional: true, type: :string
  field :loadBalancerSourceRanges, 9, repeated: true, type: :string
  field :externalName, 10, optional: true, type: :string
  field :externalTrafficPolicy, 11, optional: true, type: :string
  field :healthCheckNodePort, 12, optional: true, type: :int32
  field :publishNotReadyAddresses, 13, optional: true, type: :bool
  field :sessionAffinityConfig, 14, optional: true, type: K8s.Io.Api.Core.V1.SessionAffinityConfig
  field :ipFamily, 15, optional: true, type: :string
end

defmodule K8s.Io.Api.Core.V1.ServiceSpec.SelectorEntry do
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

defmodule K8s.Io.Api.Core.V1.ServiceStatus do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          loadBalancer: K8s.Io.Api.Core.V1.LoadBalancerStatus.t() | nil
        }
  defstruct [:loadBalancer]

  field :loadBalancer, 1, optional: true, type: K8s.Io.Api.Core.V1.LoadBalancerStatus
end

defmodule K8s.Io.Api.Core.V1.SessionAffinityConfig do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          clientIP: K8s.Io.Api.Core.V1.ClientIPConfig.t() | nil
        }
  defstruct [:clientIP]

  field :clientIP, 1, optional: true, type: K8s.Io.Api.Core.V1.ClientIPConfig
end

defmodule K8s.Io.Api.Core.V1.StorageOSPersistentVolumeSource do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          volumeName: String.t(),
          volumeNamespace: String.t(),
          fsType: String.t(),
          readOnly: boolean,
          secretRef: K8s.Io.Api.Core.V1.ObjectReference.t() | nil
        }
  defstruct [:volumeName, :volumeNamespace, :fsType, :readOnly, :secretRef]

  field :volumeName, 1, optional: true, type: :string
  field :volumeNamespace, 2, optional: true, type: :string
  field :fsType, 3, optional: true, type: :string
  field :readOnly, 4, optional: true, type: :bool
  field :secretRef, 5, optional: true, type: K8s.Io.Api.Core.V1.ObjectReference
end

defmodule K8s.Io.Api.Core.V1.StorageOSVolumeSource do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          volumeName: String.t(),
          volumeNamespace: String.t(),
          fsType: String.t(),
          readOnly: boolean,
          secretRef: K8s.Io.Api.Core.V1.LocalObjectReference.t() | nil
        }
  defstruct [:volumeName, :volumeNamespace, :fsType, :readOnly, :secretRef]

  field :volumeName, 1, optional: true, type: :string
  field :volumeNamespace, 2, optional: true, type: :string
  field :fsType, 3, optional: true, type: :string
  field :readOnly, 4, optional: true, type: :bool
  field :secretRef, 5, optional: true, type: K8s.Io.Api.Core.V1.LocalObjectReference
end

defmodule K8s.Io.Api.Core.V1.Sysctl do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          name: String.t(),
          value: String.t()
        }
  defstruct [:name, :value]

  field :name, 1, optional: true, type: :string
  field :value, 2, optional: true, type: :string
end

defmodule K8s.Io.Api.Core.V1.TCPSocketAction do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          port: K8s.Io.Apimachinery.Pkg.Util.Intstr.IntOrString.t() | nil,
          host: String.t()
        }
  defstruct [:port, :host]

  field :port, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Util.Intstr.IntOrString
  field :host, 2, optional: true, type: :string
end

defmodule K8s.Io.Api.Core.V1.Taint do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          key: String.t(),
          value: String.t(),
          effect: String.t(),
          timeAdded: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time.t() | nil
        }
  defstruct [:key, :value, :effect, :timeAdded]

  field :key, 1, optional: true, type: :string
  field :value, 2, optional: true, type: :string
  field :effect, 3, optional: true, type: :string
  field :timeAdded, 4, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time
end

defmodule K8s.Io.Api.Core.V1.Toleration do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          key: String.t(),
          operator: String.t(),
          value: String.t(),
          effect: String.t(),
          tolerationSeconds: integer
        }
  defstruct [:key, :operator, :value, :effect, :tolerationSeconds]

  field :key, 1, optional: true, type: :string
  field :operator, 2, optional: true, type: :string
  field :value, 3, optional: true, type: :string
  field :effect, 4, optional: true, type: :string
  field :tolerationSeconds, 5, optional: true, type: :int64
end

defmodule K8s.Io.Api.Core.V1.TopologySelectorLabelRequirement do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          key: String.t(),
          values: [String.t()]
        }
  defstruct [:key, :values]

  field :key, 1, optional: true, type: :string
  field :values, 2, repeated: true, type: :string
end

defmodule K8s.Io.Api.Core.V1.TopologySelectorTerm do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          matchLabelExpressions: [K8s.Io.Api.Core.V1.TopologySelectorLabelRequirement.t()]
        }
  defstruct [:matchLabelExpressions]

  field :matchLabelExpressions, 1,
    repeated: true,
    type: K8s.Io.Api.Core.V1.TopologySelectorLabelRequirement
end

defmodule K8s.Io.Api.Core.V1.TopologySpreadConstraint do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          maxSkew: integer,
          topologyKey: String.t(),
          whenUnsatisfiable: String.t(),
          labelSelector: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelector.t() | nil
        }
  defstruct [:maxSkew, :topologyKey, :whenUnsatisfiable, :labelSelector]

  field :maxSkew, 1, optional: true, type: :int32
  field :topologyKey, 2, optional: true, type: :string
  field :whenUnsatisfiable, 3, optional: true, type: :string

  field :labelSelector, 4,
    optional: true,
    type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelector
end

defmodule K8s.Io.Api.Core.V1.TypedLocalObjectReference do
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

defmodule K8s.Io.Api.Core.V1.Volume do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          name: String.t(),
          volumeSource: K8s.Io.Api.Core.V1.VolumeSource.t() | nil
        }
  defstruct [:name, :volumeSource]

  field :name, 1, optional: true, type: :string
  field :volumeSource, 2, optional: true, type: K8s.Io.Api.Core.V1.VolumeSource
end

defmodule K8s.Io.Api.Core.V1.VolumeDevice do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          name: String.t(),
          devicePath: String.t()
        }
  defstruct [:name, :devicePath]

  field :name, 1, optional: true, type: :string
  field :devicePath, 2, optional: true, type: :string
end

defmodule K8s.Io.Api.Core.V1.VolumeMount do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          name: String.t(),
          readOnly: boolean,
          mountPath: String.t(),
          subPath: String.t(),
          mountPropagation: String.t(),
          subPathExpr: String.t()
        }
  defstruct [:name, :readOnly, :mountPath, :subPath, :mountPropagation, :subPathExpr]

  field :name, 1, optional: true, type: :string
  field :readOnly, 2, optional: true, type: :bool
  field :mountPath, 3, optional: true, type: :string
  field :subPath, 4, optional: true, type: :string
  field :mountPropagation, 5, optional: true, type: :string
  field :subPathExpr, 6, optional: true, type: :string
end

defmodule K8s.Io.Api.Core.V1.VolumeNodeAffinity do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          required: K8s.Io.Api.Core.V1.NodeSelector.t() | nil
        }
  defstruct [:required]

  field :required, 1, optional: true, type: K8s.Io.Api.Core.V1.NodeSelector
end

defmodule K8s.Io.Api.Core.V1.VolumeProjection do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          secret: K8s.Io.Api.Core.V1.SecretProjection.t() | nil,
          downwardAPI: K8s.Io.Api.Core.V1.DownwardAPIProjection.t() | nil,
          configMap: K8s.Io.Api.Core.V1.ConfigMapProjection.t() | nil,
          serviceAccountToken: K8s.Io.Api.Core.V1.ServiceAccountTokenProjection.t() | nil
        }
  defstruct [:secret, :downwardAPI, :configMap, :serviceAccountToken]

  field :secret, 1, optional: true, type: K8s.Io.Api.Core.V1.SecretProjection
  field :downwardAPI, 2, optional: true, type: K8s.Io.Api.Core.V1.DownwardAPIProjection
  field :configMap, 3, optional: true, type: K8s.Io.Api.Core.V1.ConfigMapProjection

  field :serviceAccountToken, 4,
    optional: true,
    type: K8s.Io.Api.Core.V1.ServiceAccountTokenProjection
end

defmodule K8s.Io.Api.Core.V1.VolumeSource do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          hostPath: K8s.Io.Api.Core.V1.HostPathVolumeSource.t() | nil,
          emptyDir: K8s.Io.Api.Core.V1.EmptyDirVolumeSource.t() | nil,
          gcePersistentDisk: K8s.Io.Api.Core.V1.GCEPersistentDiskVolumeSource.t() | nil,
          awsElasticBlockStore: K8s.Io.Api.Core.V1.AWSElasticBlockStoreVolumeSource.t() | nil,
          gitRepo: K8s.Io.Api.Core.V1.GitRepoVolumeSource.t() | nil,
          secret: K8s.Io.Api.Core.V1.SecretVolumeSource.t() | nil,
          nfs: K8s.Io.Api.Core.V1.NFSVolumeSource.t() | nil,
          iscsi: K8s.Io.Api.Core.V1.ISCSIVolumeSource.t() | nil,
          glusterfs: K8s.Io.Api.Core.V1.GlusterfsVolumeSource.t() | nil,
          persistentVolumeClaim: K8s.Io.Api.Core.V1.PersistentVolumeClaimVolumeSource.t() | nil,
          rbd: K8s.Io.Api.Core.V1.RBDVolumeSource.t() | nil,
          flexVolume: K8s.Io.Api.Core.V1.FlexVolumeSource.t() | nil,
          cinder: K8s.Io.Api.Core.V1.CinderVolumeSource.t() | nil,
          cephfs: K8s.Io.Api.Core.V1.CephFSVolumeSource.t() | nil,
          flocker: K8s.Io.Api.Core.V1.FlockerVolumeSource.t() | nil,
          downwardAPI: K8s.Io.Api.Core.V1.DownwardAPIVolumeSource.t() | nil,
          fc: K8s.Io.Api.Core.V1.FCVolumeSource.t() | nil,
          azureFile: K8s.Io.Api.Core.V1.AzureFileVolumeSource.t() | nil,
          configMap: K8s.Io.Api.Core.V1.ConfigMapVolumeSource.t() | nil,
          vsphereVolume: K8s.Io.Api.Core.V1.VsphereVirtualDiskVolumeSource.t() | nil,
          quobyte: K8s.Io.Api.Core.V1.QuobyteVolumeSource.t() | nil,
          azureDisk: K8s.Io.Api.Core.V1.AzureDiskVolumeSource.t() | nil,
          photonPersistentDisk: K8s.Io.Api.Core.V1.PhotonPersistentDiskVolumeSource.t() | nil,
          projected: K8s.Io.Api.Core.V1.ProjectedVolumeSource.t() | nil,
          portworxVolume: K8s.Io.Api.Core.V1.PortworxVolumeSource.t() | nil,
          scaleIO: K8s.Io.Api.Core.V1.ScaleIOVolumeSource.t() | nil,
          storageos: K8s.Io.Api.Core.V1.StorageOSVolumeSource.t() | nil,
          csi: K8s.Io.Api.Core.V1.CSIVolumeSource.t() | nil
        }
  defstruct [
    :hostPath,
    :emptyDir,
    :gcePersistentDisk,
    :awsElasticBlockStore,
    :gitRepo,
    :secret,
    :nfs,
    :iscsi,
    :glusterfs,
    :persistentVolumeClaim,
    :rbd,
    :flexVolume,
    :cinder,
    :cephfs,
    :flocker,
    :downwardAPI,
    :fc,
    :azureFile,
    :configMap,
    :vsphereVolume,
    :quobyte,
    :azureDisk,
    :photonPersistentDisk,
    :projected,
    :portworxVolume,
    :scaleIO,
    :storageos,
    :csi
  ]

  field :hostPath, 1, optional: true, type: K8s.Io.Api.Core.V1.HostPathVolumeSource
  field :emptyDir, 2, optional: true, type: K8s.Io.Api.Core.V1.EmptyDirVolumeSource

  field :gcePersistentDisk, 3,
    optional: true,
    type: K8s.Io.Api.Core.V1.GCEPersistentDiskVolumeSource

  field :awsElasticBlockStore, 4,
    optional: true,
    type: K8s.Io.Api.Core.V1.AWSElasticBlockStoreVolumeSource

  field :gitRepo, 5, optional: true, type: K8s.Io.Api.Core.V1.GitRepoVolumeSource
  field :secret, 6, optional: true, type: K8s.Io.Api.Core.V1.SecretVolumeSource
  field :nfs, 7, optional: true, type: K8s.Io.Api.Core.V1.NFSVolumeSource
  field :iscsi, 8, optional: true, type: K8s.Io.Api.Core.V1.ISCSIVolumeSource
  field :glusterfs, 9, optional: true, type: K8s.Io.Api.Core.V1.GlusterfsVolumeSource

  field :persistentVolumeClaim, 10,
    optional: true,
    type: K8s.Io.Api.Core.V1.PersistentVolumeClaimVolumeSource

  field :rbd, 11, optional: true, type: K8s.Io.Api.Core.V1.RBDVolumeSource
  field :flexVolume, 12, optional: true, type: K8s.Io.Api.Core.V1.FlexVolumeSource
  field :cinder, 13, optional: true, type: K8s.Io.Api.Core.V1.CinderVolumeSource
  field :cephfs, 14, optional: true, type: K8s.Io.Api.Core.V1.CephFSVolumeSource
  field :flocker, 15, optional: true, type: K8s.Io.Api.Core.V1.FlockerVolumeSource
  field :downwardAPI, 16, optional: true, type: K8s.Io.Api.Core.V1.DownwardAPIVolumeSource
  field :fc, 17, optional: true, type: K8s.Io.Api.Core.V1.FCVolumeSource
  field :azureFile, 18, optional: true, type: K8s.Io.Api.Core.V1.AzureFileVolumeSource
  field :configMap, 19, optional: true, type: K8s.Io.Api.Core.V1.ConfigMapVolumeSource

  field :vsphereVolume, 20,
    optional: true,
    type: K8s.Io.Api.Core.V1.VsphereVirtualDiskVolumeSource

  field :quobyte, 21, optional: true, type: K8s.Io.Api.Core.V1.QuobyteVolumeSource
  field :azureDisk, 22, optional: true, type: K8s.Io.Api.Core.V1.AzureDiskVolumeSource

  field :photonPersistentDisk, 23,
    optional: true,
    type: K8s.Io.Api.Core.V1.PhotonPersistentDiskVolumeSource

  field :projected, 26, optional: true, type: K8s.Io.Api.Core.V1.ProjectedVolumeSource
  field :portworxVolume, 24, optional: true, type: K8s.Io.Api.Core.V1.PortworxVolumeSource
  field :scaleIO, 25, optional: true, type: K8s.Io.Api.Core.V1.ScaleIOVolumeSource
  field :storageos, 27, optional: true, type: K8s.Io.Api.Core.V1.StorageOSVolumeSource
  field :csi, 28, optional: true, type: K8s.Io.Api.Core.V1.CSIVolumeSource
end

defmodule K8s.Io.Api.Core.V1.VsphereVirtualDiskVolumeSource do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          volumePath: String.t(),
          fsType: String.t(),
          storagePolicyName: String.t(),
          storagePolicyID: String.t()
        }
  defstruct [:volumePath, :fsType, :storagePolicyName, :storagePolicyID]

  field :volumePath, 1, optional: true, type: :string
  field :fsType, 2, optional: true, type: :string
  field :storagePolicyName, 3, optional: true, type: :string
  field :storagePolicyID, 4, optional: true, type: :string
end

defmodule K8s.Io.Api.Core.V1.WeightedPodAffinityTerm do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          weight: integer,
          podAffinityTerm: K8s.Io.Api.Core.V1.PodAffinityTerm.t() | nil
        }
  defstruct [:weight, :podAffinityTerm]

  field :weight, 1, optional: true, type: :int32
  field :podAffinityTerm, 2, optional: true, type: K8s.Io.Api.Core.V1.PodAffinityTerm
end

defmodule K8s.Io.Api.Core.V1.WindowsSecurityContextOptions do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          gmsaCredentialSpecName: String.t(),
          gmsaCredentialSpec: String.t(),
          runAsUserName: String.t()
        }
  defstruct [:gmsaCredentialSpecName, :gmsaCredentialSpec, :runAsUserName]

  field :gmsaCredentialSpecName, 1, optional: true, type: :string
  field :gmsaCredentialSpec, 2, optional: true, type: :string
  field :runAsUserName, 3, optional: true, type: :string
end
