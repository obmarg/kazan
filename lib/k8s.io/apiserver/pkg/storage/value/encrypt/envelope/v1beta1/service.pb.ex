defmodule V1beta1.VersionRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          version: String.t()
        }
  defstruct [:version]

  field :version, 1, type: :string
end

defmodule V1beta1.VersionResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          version: String.t(),
          runtime_name: String.t(),
          runtime_version: String.t()
        }
  defstruct [:version, :runtime_name, :runtime_version]

  field :version, 1, type: :string
  field :runtime_name, 2, type: :string
  field :runtime_version, 3, type: :string
end

defmodule V1beta1.DecryptRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          version: String.t(),
          cipher: binary
        }
  defstruct [:version, :cipher]

  field :version, 1, type: :string
  field :cipher, 2, type: :bytes
end

defmodule V1beta1.DecryptResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          plain: binary
        }
  defstruct [:plain]

  field :plain, 1, type: :bytes
end

defmodule V1beta1.EncryptRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          version: String.t(),
          plain: binary
        }
  defstruct [:version, :plain]

  field :version, 1, type: :string
  field :plain, 2, type: :bytes
end

defmodule V1beta1.EncryptResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          cipher: binary
        }
  defstruct [:cipher]

  field :cipher, 1, type: :bytes
end
