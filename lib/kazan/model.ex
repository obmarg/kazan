defmodule Kazan.Model do
  @moduledoc """
  Kazan.Model is a behaviour that provides encoding & decoding of JSON from a Kubernetes server.

  This is used internally in Kazan for all it's generated models, however it can also be used to add custom resource definition support.

  TODO: Add examples and docs
  """
  @callback decode(Map.t()) :: struct
  @callback encode(struct) :: Map.t()
  @callback model_desc() :: Kazan.ModelDesc.t()

  defmacro __using__(_opts) do
    quote do
      @behaviour Kazan.Model

      @impl Kazan.Model
      def decode(data), do: Kazan.Models.decode(data, __MODULE__)

      @impl Kazan.Model
      def encode(data), do: Kazan.Models.encode(data)

      defoverridable Kazan.Model
    end
  end
end
