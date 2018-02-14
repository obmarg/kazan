defmodule Kazan.Server.CertificateAuth do
  defstruct [:certificate, :key]

  @type t :: %__MODULE__{
          certificate: binary,
          key: binary
        }

  defimpl Inspect, for: __MODULE__ do
    # We define a custom inspect implementation to avoid printing key details to
    # logs or anything.
    import Inspect.Algebra

    def inspect(_auth, _opts) do
      concat(["#CertificateAuth<...>"])
    end
  end
end
