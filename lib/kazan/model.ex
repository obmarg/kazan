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
      require Kazan.Model

      @behaviour Kazan.Model

      @impl Kazan.Model
      def decode(data), do: Kazan.Models.decode(data, __MODULE__)

      @impl Kazan.Model
      def encode(data), do: Kazan.Models.encode(data)

      defoverridable Kazan.Model
    end
  end

  @doc """
  Utility macro for definining lists of custom resources.

  This generates all the neccesary boilerplate for a `Kazan.Model` that
  represents a k8s list containing `item_model`.

  For example, if you needed to recreate a PodList that contains Pods:

      defmodule PodList do
        use Kazan.Model

        Kazan.Model.list_of(Pod)
      end
  """
  defmacro list_of(item_model) do

    quote do
      alias Kazan.Models.{ModelDesc, PropertyDesc}

      alias Kazan.Models.Apimachinery.Meta.V1.ObjectMeta

      defstruct [:items, :metadata, :kind, :api_version]

      def model_desc() do
        %ModelDesc{
          module_name: __MODULE__,
          properties: %{
            metadata: %PropertyDesc{field: "metadata", type: nil, ref: ObjectMeta},
            kind: %PropertyDesc{field: "kind", type: "string"},
            api_version: %PropertyDesc{field: "apiVersion", type: "string"},
            items: %PropertyDesc{
              field: "items",
              type: "array",
              items: %PropertyDesc{type: nil, ref: unquote(item_model)}
            }
          }
        }
      end
    end

  end
end
