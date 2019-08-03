defmodule Kazan.Server.ServerInfo do
  @moduledoc """
  Contains information about the details that Kazan.Server was set up with.
  """
  defstruct [:context_name, :user_name, :cluster_name]

  @type t :: %__MODULE__{
          context_name: String.t(),
          user_name: String.t(),
          cluster_name: String.t()
        }
end
