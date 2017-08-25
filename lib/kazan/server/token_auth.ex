defmodule Kazan.Server.TokenAuth do
  defstruct [:token]

  @type t :: %__MODULE__{
    token: binary
  }

  defimpl Inspect, for: __MODULE__ do
    # We define a custom inspect implementation to avoid printing key details to
    # logs or anything.
    import Inspect.Algebra

    def inspect(_auth, _opts) do
      concat ["#TokenAuth<...>"]
    end
  end
end