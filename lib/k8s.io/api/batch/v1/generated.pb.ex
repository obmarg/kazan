defmodule K8s.Io.Api.Batch.V1.Job do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          spec: K8s.Io.Api.Batch.V1.JobSpec.t() | nil,
          status: K8s.Io.Api.Batch.V1.JobStatus.t() | nil
        }
  defstruct [:metadata, :spec, :status]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :spec, 2, optional: true, type: K8s.Io.Api.Batch.V1.JobSpec
  field :status, 3, optional: true, type: K8s.Io.Api.Batch.V1.JobStatus
end

defmodule K8s.Io.Api.Batch.V1.JobCondition do
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

defmodule K8s.Io.Api.Batch.V1.JobList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [K8s.Io.Api.Batch.V1.Job.t()]
        }
  defstruct [:metadata, :items]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta
  field :items, 2, repeated: true, type: K8s.Io.Api.Batch.V1.Job
end

defmodule K8s.Io.Api.Batch.V1.JobSpec do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          parallelism: integer,
          completions: integer,
          activeDeadlineSeconds: integer,
          backoffLimit: integer,
          selector: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelector.t() | nil,
          manualSelector: boolean,
          template: K8s.Io.Api.Core.V1.PodTemplateSpec.t() | nil,
          ttlSecondsAfterFinished: integer
        }
  defstruct [
    :parallelism,
    :completions,
    :activeDeadlineSeconds,
    :backoffLimit,
    :selector,
    :manualSelector,
    :template,
    :ttlSecondsAfterFinished
  ]

  field :parallelism, 1, optional: true, type: :int32
  field :completions, 2, optional: true, type: :int32
  field :activeDeadlineSeconds, 3, optional: true, type: :int64
  field :backoffLimit, 7, optional: true, type: :int32
  field :selector, 4, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelector
  field :manualSelector, 5, optional: true, type: :bool
  field :template, 6, optional: true, type: K8s.Io.Api.Core.V1.PodTemplateSpec
  field :ttlSecondsAfterFinished, 8, optional: true, type: :int32
end

defmodule K8s.Io.Api.Batch.V1.JobStatus do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          conditions: [K8s.Io.Api.Batch.V1.JobCondition.t()],
          startTime: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time.t() | nil,
          completionTime: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time.t() | nil,
          active: integer,
          succeeded: integer,
          failed: integer
        }
  defstruct [:conditions, :startTime, :completionTime, :active, :succeeded, :failed]

  field :conditions, 1, repeated: true, type: K8s.Io.Api.Batch.V1.JobCondition
  field :startTime, 2, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time
  field :completionTime, 3, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time
  field :active, 4, optional: true, type: :int32
  field :succeeded, 5, optional: true, type: :int32
  field :failed, 6, optional: true, type: :int32
end
