defmodule K8s.Io.Api.Scheduling.V1.PriorityClass do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          value: integer,
          globalDefault: boolean,
          description: String.t(),
          preemptionPolicy: String.t()
        }
  defstruct [:metadata, :value, :globalDefault, :description, :preemptionPolicy]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :value, 2, optional: true, type: :int32
  field :globalDefault, 3, optional: true, type: :bool
  field :description, 4, optional: true, type: :string
  field :preemptionPolicy, 5, optional: true, type: :string
end

defmodule K8s.Io.Api.Scheduling.V1.PriorityClassList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [K8s.Io.Api.Scheduling.V1.PriorityClass.t()]
        }
  defstruct [:metadata, :items]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta
  field :items, 2, repeated: true, type: K8s.Io.Api.Scheduling.V1.PriorityClass
end
