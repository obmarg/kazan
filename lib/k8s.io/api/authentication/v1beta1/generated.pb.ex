defmodule K8s.Io.Api.Authentication.V1beta1.ExtraValue do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          items: [String.t()]
        }
  defstruct [:items]

  field :items, 1, repeated: true, type: :string
end

defmodule K8s.Io.Api.Authentication.V1beta1.TokenReview do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          spec: K8s.Io.Api.Authentication.V1beta1.TokenReviewSpec.t() | nil,
          status: K8s.Io.Api.Authentication.V1beta1.TokenReviewStatus.t() | nil
        }
  defstruct [:metadata, :spec, :status]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :spec, 2, optional: true, type: K8s.Io.Api.Authentication.V1beta1.TokenReviewSpec
  field :status, 3, optional: true, type: K8s.Io.Api.Authentication.V1beta1.TokenReviewStatus
end

defmodule K8s.Io.Api.Authentication.V1beta1.TokenReviewSpec do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          token: String.t(),
          audiences: [String.t()]
        }
  defstruct [:token, :audiences]

  field :token, 1, optional: true, type: :string
  field :audiences, 2, repeated: true, type: :string
end

defmodule K8s.Io.Api.Authentication.V1beta1.TokenReviewStatus do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          authenticated: boolean,
          user: K8s.Io.Api.Authentication.V1beta1.UserInfo.t() | nil,
          audiences: [String.t()],
          error: String.t()
        }
  defstruct [:authenticated, :user, :audiences, :error]

  field :authenticated, 1, optional: true, type: :bool
  field :user, 2, optional: true, type: K8s.Io.Api.Authentication.V1beta1.UserInfo
  field :audiences, 4, repeated: true, type: :string
  field :error, 3, optional: true, type: :string
end

defmodule K8s.Io.Api.Authentication.V1beta1.UserInfo do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          username: String.t(),
          uid: String.t(),
          groups: [String.t()],
          extra: %{String.t() => K8s.Io.Api.Authentication.V1beta1.ExtraValue.t() | nil}
        }
  defstruct [:username, :uid, :groups, :extra]

  field :username, 1, optional: true, type: :string
  field :uid, 2, optional: true, type: :string
  field :groups, 3, repeated: true, type: :string

  field :extra, 4,
    repeated: true,
    type: K8s.Io.Api.Authentication.V1beta1.UserInfo.ExtraEntry,
    map: true
end

defmodule K8s.Io.Api.Authentication.V1beta1.UserInfo.ExtraEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto2

  @type t :: %__MODULE__{
          key: String.t(),
          value: K8s.Io.Api.Authentication.V1beta1.ExtraValue.t() | nil
        }
  defstruct [:key, :value]

  field :key, 1, optional: true, type: :string
  field :value, 2, optional: true, type: K8s.Io.Api.Authentication.V1beta1.ExtraValue
end
