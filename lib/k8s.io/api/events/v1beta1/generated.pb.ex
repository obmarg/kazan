defmodule K8s.Io.Api.Events.V1beta1.Event do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          eventTime: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.MicroTime.t() | nil,
          series: K8s.Io.Api.Events.V1beta1.EventSeries.t() | nil,
          reportingController: String.t(),
          reportingInstance: String.t(),
          action: String.t(),
          reason: String.t(),
          regarding: K8s.Io.Api.Core.V1.ObjectReference.t() | nil,
          related: K8s.Io.Api.Core.V1.ObjectReference.t() | nil,
          note: String.t(),
          type: String.t(),
          deprecatedSource: K8s.Io.Api.Core.V1.EventSource.t() | nil,
          deprecatedFirstTimestamp: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time.t() | nil,
          deprecatedLastTimestamp: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time.t() | nil,
          deprecatedCount: integer
        }
  defstruct [
    :metadata,
    :eventTime,
    :series,
    :reportingController,
    :reportingInstance,
    :action,
    :reason,
    :regarding,
    :related,
    :note,
    :type,
    :deprecatedSource,
    :deprecatedFirstTimestamp,
    :deprecatedLastTimestamp,
    :deprecatedCount
  ]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :eventTime, 2, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.MicroTime
  field :series, 3, optional: true, type: K8s.Io.Api.Events.V1beta1.EventSeries
  field :reportingController, 4, optional: true, type: :string
  field :reportingInstance, 5, optional: true, type: :string
  field :action, 6, optional: true, type: :string
  field :reason, 7, optional: true, type: :string
  field :regarding, 8, optional: true, type: K8s.Io.Api.Core.V1.ObjectReference
  field :related, 9, optional: true, type: K8s.Io.Api.Core.V1.ObjectReference
  field :note, 10, optional: true, type: :string
  field :type, 11, optional: true, type: :string
  field :deprecatedSource, 12, optional: true, type: K8s.Io.Api.Core.V1.EventSource

  field :deprecatedFirstTimestamp, 13,
    optional: true,
    type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time

  field :deprecatedLastTimestamp, 14,
    optional: true,
    type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time

  field :deprecatedCount, 15, optional: true, type: :int32
end

defmodule K8s.Io.Api.Events.V1beta1.EventList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [K8s.Io.Api.Events.V1beta1.Event.t()]
        }
  defstruct [:metadata, :items]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta
  field :items, 2, repeated: true, type: K8s.Io.Api.Events.V1beta1.Event
end

defmodule K8s.Io.Api.Events.V1beta1.EventSeries do
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
