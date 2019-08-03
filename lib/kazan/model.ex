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
      import Kazan.Model, only: [defmodel: 1]

      @behaviour Kazan.Model

      @impl Kazan.Model
      def decode(data), do: Kazan.Models.decode(data, __MODULE__)

      @impl Kazan.Model
      def encode(data), do: Kazan.Models.encode(data)

      defoverridable Kazan.Model
    end
  end

  defmacro defmodel(properties) do
    properties = Macro.expand(properties, __ENV__)

    full_properties =
      Map.merge(
        %{
          metadata: %Kazan.Models.PropertyDesc{
            field: "metadata",
            type: nil,
            ref: Kazan.Models.Apimachinery.Meta.V1.ObjectMeta
          },
          kind: %Kazan.Models.PropertyDesc{field: "kind", type: "String"},
          api_version: %Kazan.Models.PropertyDesc{field: "apiVersion", type: "String"}
        },
        properties
      )

    property_names = Map.keys(properties)

    quote do
      defstruct unquote(property_names)

      def model_desc() do
        %ModelDesc{
          module_name: __MODULE__,
          properties: Macro.escape(unquote(full_properties))
        }
      end
    end
  end
end
