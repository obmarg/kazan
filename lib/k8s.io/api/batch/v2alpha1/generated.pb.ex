defmodule K8s.Io.Api.Batch.V2alpha1.CronJob do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          spec: K8s.Io.Api.Batch.V2alpha1.CronJobSpec.t() | nil,
          status: K8s.Io.Api.Batch.V2alpha1.CronJobStatus.t() | nil
        }
  defstruct [:metadata, :spec, :status]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :spec, 2, optional: true, type: K8s.Io.Api.Batch.V2alpha1.CronJobSpec
  field :status, 3, optional: true, type: K8s.Io.Api.Batch.V2alpha1.CronJobStatus
end

defmodule K8s.Io.Api.Batch.V2alpha1.CronJobList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [K8s.Io.Api.Batch.V2alpha1.CronJob.t()]
        }
  defstruct [:metadata, :items]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta
  field :items, 2, repeated: true, type: K8s.Io.Api.Batch.V2alpha1.CronJob
end

defmodule K8s.Io.Api.Batch.V2alpha1.CronJobSpec do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          schedule: String.t(),
          startingDeadlineSeconds: integer,
          concurrencyPolicy: String.t(),
          suspend: boolean,
          jobTemplate: K8s.Io.Api.Batch.V2alpha1.JobTemplateSpec.t() | nil,
          successfulJobsHistoryLimit: integer,
          failedJobsHistoryLimit: integer
        }
  defstruct [
    :schedule,
    :startingDeadlineSeconds,
    :concurrencyPolicy,
    :suspend,
    :jobTemplate,
    :successfulJobsHistoryLimit,
    :failedJobsHistoryLimit
  ]

  field :schedule, 1, optional: true, type: :string
  field :startingDeadlineSeconds, 2, optional: true, type: :int64
  field :concurrencyPolicy, 3, optional: true, type: :string
  field :suspend, 4, optional: true, type: :bool
  field :jobTemplate, 5, optional: true, type: K8s.Io.Api.Batch.V2alpha1.JobTemplateSpec
  field :successfulJobsHistoryLimit, 6, optional: true, type: :int32
  field :failedJobsHistoryLimit, 7, optional: true, type: :int32
end

defmodule K8s.Io.Api.Batch.V2alpha1.CronJobStatus do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          active: [K8s.Io.Api.Core.V1.ObjectReference.t()],
          lastScheduleTime: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time.t() | nil
        }
  defstruct [:active, :lastScheduleTime]

  field :active, 1, repeated: true, type: K8s.Io.Api.Core.V1.ObjectReference
  field :lastScheduleTime, 4, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time
end

defmodule K8s.Io.Api.Batch.V2alpha1.JobTemplate do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          template: K8s.Io.Api.Batch.V2alpha1.JobTemplateSpec.t() | nil
        }
  defstruct [:metadata, :template]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :template, 2, optional: true, type: K8s.Io.Api.Batch.V2alpha1.JobTemplateSpec
end

defmodule K8s.Io.Api.Batch.V2alpha1.JobTemplateSpec do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          spec: K8s.Io.Api.Batch.V1.JobSpec.t() | nil
        }
  defstruct [:metadata, :spec]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :spec, 2, optional: true, type: K8s.Io.Api.Batch.V1.JobSpec
end
