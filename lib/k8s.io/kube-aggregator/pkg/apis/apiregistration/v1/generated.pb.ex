defmodule K8s.Io.KubeAggregator.Pkg.Apis.Apiregistration.V1.APIService do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          spec: K8s.Io.KubeAggregator.Pkg.Apis.Apiregistration.V1.APIServiceSpec.t() | nil,
          status: K8s.Io.KubeAggregator.Pkg.Apis.Apiregistration.V1.APIServiceStatus.t() | nil
        }
  defstruct [:metadata, :spec, :status]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta

  field :spec, 2,
    optional: true,
    type: K8s.Io.KubeAggregator.Pkg.Apis.Apiregistration.V1.APIServiceSpec

  field :status, 3,
    optional: true,
    type: K8s.Io.KubeAggregator.Pkg.Apis.Apiregistration.V1.APIServiceStatus
end

defmodule K8s.Io.KubeAggregator.Pkg.Apis.Apiregistration.V1.APIServiceCondition do
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

defmodule K8s.Io.KubeAggregator.Pkg.Apis.Apiregistration.V1.APIServiceList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [K8s.Io.KubeAggregator.Pkg.Apis.Apiregistration.V1.APIService.t()]
        }
  defstruct [:metadata, :items]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta

  field :items, 2,
    repeated: true,
    type: K8s.Io.KubeAggregator.Pkg.Apis.Apiregistration.V1.APIService
end

defmodule K8s.Io.KubeAggregator.Pkg.Apis.Apiregistration.V1.APIServiceSpec do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          service: K8s.Io.KubeAggregator.Pkg.Apis.Apiregistration.V1.ServiceReference.t() | nil,
          group: String.t(),
          version: String.t(),
          insecureSkipTLSVerify: boolean,
          caBundle: binary,
          groupPriorityMinimum: integer,
          versionPriority: integer
        }
  defstruct [
    :service,
    :group,
    :version,
    :insecureSkipTLSVerify,
    :caBundle,
    :groupPriorityMinimum,
    :versionPriority
  ]

  field :service, 1,
    optional: true,
    type: K8s.Io.KubeAggregator.Pkg.Apis.Apiregistration.V1.ServiceReference

  field :group, 2, optional: true, type: :string
  field :version, 3, optional: true, type: :string
  field :insecureSkipTLSVerify, 4, optional: true, type: :bool
  field :caBundle, 5, optional: true, type: :bytes
  field :groupPriorityMinimum, 7, optional: true, type: :int32
  field :versionPriority, 8, optional: true, type: :int32
end

defmodule K8s.Io.KubeAggregator.Pkg.Apis.Apiregistration.V1.APIServiceStatus do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          conditions: [K8s.Io.KubeAggregator.Pkg.Apis.Apiregistration.V1.APIServiceCondition.t()]
        }
  defstruct [:conditions]

  field :conditions, 1,
    repeated: true,
    type: K8s.Io.KubeAggregator.Pkg.Apis.Apiregistration.V1.APIServiceCondition
end

defmodule K8s.Io.KubeAggregator.Pkg.Apis.Apiregistration.V1.ServiceReference do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          namespace: String.t(),
          name: String.t(),
          port: integer
        }
  defstruct [:namespace, :name, :port]

  field :namespace, 1, optional: true, type: :string
  field :name, 2, optional: true, type: :string
  field :port, 3, optional: true, type: :int32
end
