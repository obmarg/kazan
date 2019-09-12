defmodule K8s.Io.Apiserver.Pkg.Apis.Example2.V1.ReplicaSet do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          spec: K8s.Io.Apiserver.Pkg.Apis.Example2.V1.ReplicaSetSpec.t() | nil,
          status: K8s.Io.Apiserver.Pkg.Apis.Example2.V1.ReplicaSetStatus.t() | nil
        }
  defstruct [:metadata, :spec, :status]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :spec, 2, optional: true, type: K8s.Io.Apiserver.Pkg.Apis.Example2.V1.ReplicaSetSpec
  field :status, 3, optional: true, type: K8s.Io.Apiserver.Pkg.Apis.Example2.V1.ReplicaSetStatus
end

defmodule K8s.Io.Apiserver.Pkg.Apis.Example2.V1.ReplicaSetSpec do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          replicas: integer
        }
  defstruct [:replicas]

  field :replicas, 1, optional: true, type: :int32
end

defmodule K8s.Io.Apiserver.Pkg.Apis.Example2.V1.ReplicaSetStatus do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          replicas: integer
        }
  defstruct [:replicas]

  field :replicas, 1, optional: true, type: :int32
end
