defmodule Kazan.Server.ProviderAuth do
  @moduledoc """
  This struct stores details of how to auth with an auth provider.

  This is used to support authorization with GKE using gcloud for example.
  """
  alias Kazan.Server.TokenAuth

  @enforce_keys [:config]
  defstruct [:config, :token, :expiry]

  @typep config_t :: %{
           cmd_path: String.t(),
           cmd_args: [String.t()],
           token_key_path: [String.t()],
           expiry_key_path: [String.t()]
         }

  @type t :: %__MODULE__{
          config: config_t,
          token: TokenAuth.t() | nil,
          expiry: DateTime.t() | nil
        }
end
