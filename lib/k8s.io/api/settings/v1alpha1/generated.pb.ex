defmodule K8s.Io.Api.Settings.V1alpha1.PodPreset do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          spec: K8s.Io.Api.Settings.V1alpha1.PodPresetSpec.t() | nil
        }
  defstruct [:metadata, :spec]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :spec, 2, optional: true, type: K8s.Io.Api.Settings.V1alpha1.PodPresetSpec
end

defmodule K8s.Io.Api.Settings.V1alpha1.PodPresetList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [K8s.Io.Api.Settings.V1alpha1.PodPreset.t()]
        }
  defstruct [:metadata, :items]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta
  field :items, 2, repeated: true, type: K8s.Io.Api.Settings.V1alpha1.PodPreset
end

defmodule K8s.Io.Api.Settings.V1alpha1.PodPresetSpec do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          selector: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelector.t() | nil,
          env: [K8s.Io.Api.Core.V1.EnvVar.t()],
          envFrom: [K8s.Io.Api.Core.V1.EnvFromSource.t()],
          volumes: [K8s.Io.Api.Core.V1.Volume.t()],
          volumeMounts: [K8s.Io.Api.Core.V1.VolumeMount.t()]
        }
  defstruct [:selector, :env, :envFrom, :volumes, :volumeMounts]

  field :selector, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelector
  field :env, 2, repeated: true, type: K8s.Io.Api.Core.V1.EnvVar
  field :envFrom, 3, repeated: true, type: K8s.Io.Api.Core.V1.EnvFromSource
  field :volumes, 4, repeated: true, type: K8s.Io.Api.Core.V1.Volume
  field :volumeMounts, 5, repeated: true, type: K8s.Io.Api.Core.V1.VolumeMount
end
