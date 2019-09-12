defmodule K8s.Io.Api.Certificates.V1beta1.CertificateSigningRequest do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          spec: K8s.Io.Api.Certificates.V1beta1.CertificateSigningRequestSpec.t() | nil,
          status: K8s.Io.Api.Certificates.V1beta1.CertificateSigningRequestStatus.t() | nil
        }
  defstruct [:metadata, :spec, :status]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta

  field :spec, 2,
    optional: true,
    type: K8s.Io.Api.Certificates.V1beta1.CertificateSigningRequestSpec

  field :status, 3,
    optional: true,
    type: K8s.Io.Api.Certificates.V1beta1.CertificateSigningRequestStatus
end

defmodule K8s.Io.Api.Certificates.V1beta1.CertificateSigningRequestCondition do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          type: String.t(),
          reason: String.t(),
          message: String.t(),
          lastUpdateTime: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time.t() | nil
        }
  defstruct [:type, :reason, :message, :lastUpdateTime]

  field :type, 1, optional: true, type: :string
  field :reason, 2, optional: true, type: :string
  field :message, 3, optional: true, type: :string
  field :lastUpdateTime, 4, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time
end

defmodule K8s.Io.Api.Certificates.V1beta1.CertificateSigningRequestList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [K8s.Io.Api.Certificates.V1beta1.CertificateSigningRequest.t()]
        }
  defstruct [:metadata, :items]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta
  field :items, 2, repeated: true, type: K8s.Io.Api.Certificates.V1beta1.CertificateSigningRequest
end

defmodule K8s.Io.Api.Certificates.V1beta1.CertificateSigningRequestSpec do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          request: binary,
          usages: [String.t()],
          username: String.t(),
          uid: String.t(),
          groups: [String.t()],
          extra: %{String.t() => K8s.Io.Api.Certificates.V1beta1.ExtraValue.t() | nil}
        }
  defstruct [:request, :usages, :username, :uid, :groups, :extra]

  field :request, 1, optional: true, type: :bytes
  field :usages, 5, repeated: true, type: :string
  field :username, 2, optional: true, type: :string
  field :uid, 3, optional: true, type: :string
  field :groups, 4, repeated: true, type: :string

  field :extra, 6,
    repeated: true,
    type: K8s.Io.Api.Certificates.V1beta1.CertificateSigningRequestSpec.ExtraEntry,
    map: true
end

defmodule K8s.Io.Api.Certificates.V1beta1.CertificateSigningRequestSpec.ExtraEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto2

  @type t :: %__MODULE__{
          key: String.t(),
          value: K8s.Io.Api.Certificates.V1beta1.ExtraValue.t() | nil
        }
  defstruct [:key, :value]

  field :key, 1, optional: true, type: :string
  field :value, 2, optional: true, type: K8s.Io.Api.Certificates.V1beta1.ExtraValue
end

defmodule K8s.Io.Api.Certificates.V1beta1.CertificateSigningRequestStatus do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          conditions: [K8s.Io.Api.Certificates.V1beta1.CertificateSigningRequestCondition.t()],
          certificate: binary
        }
  defstruct [:conditions, :certificate]

  field :conditions, 1,
    repeated: true,
    type: K8s.Io.Api.Certificates.V1beta1.CertificateSigningRequestCondition

  field :certificate, 2, optional: true, type: :bytes
end

defmodule K8s.Io.Api.Certificates.V1beta1.ExtraValue do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          items: [String.t()]
        }
  defstruct [:items]

  field :items, 1, repeated: true, type: :string
end
