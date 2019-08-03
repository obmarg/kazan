defmodule Kazan.Model do
  @moduledoc """
  Kazan.Model is a behaviour that provides encoding & decoding of JSON from a Kubernetes server.

  This is used internally in Kazan for all it's generated models, however it can also be used to add custom resource definition support.

  TODO: Add examples and docs
  """
  @callback decode(Map.t()) :: struct
  @callback encode(struct) :: Map.t()
  @callback model_desc() :: Kazan.ModelDesc.t()

  # TODO: tests of this module?

  defmacro __using__(_opts) do
    quote do
      import Kazan.Model, only: [defmodeldesc: 1, defmodellist: 1, defmodel: 1]

      @behaviour Kazan.Model

      @impl Kazan.Model
      def decode(data), do: Kazan.Models.decode(data, __MODULE__)

      @impl Kazan.Model
      def encode(data), do: Kazan.Models.encode(data)

      defoverridable Kazan.Model
    end
  end

  alias Kazan.Models.{ModelDesc, PropertyDesc}

  @doc """
  Builds a `Kazan.Models.ModelDesc` for a Model.

  Use this to build the result of your Models `model_desc/0` function.
  It reduces boilerplate by adding in the standard k8s API fields of
  `metadata`, `api_version` & `kind`.
  """
  def build_model_desc(model, properties) do
    %ModelDesc{
      module_name: model,
      properties:
        Map.merge(
          %{
            metadata: %Kazan.Models.PropertyDesc{
              field: "metadata",
              type: nil,
              ref: Kazan.Models.Apimachinery.Meta.V1.ObjectMeta
            },
            kind: %Kazan.Models.PropertyDesc{field: "kind", type: "string"},
            api_version: %Kazan.Models.PropertyDesc{
              field: "apiVersion",
              type: "string"
            }
          },
          properties
        )
    }
  end

  # TODO: Document
  defmacro defmodel(fields) do
    fields = fields ++ [:metadata, :kind, :api_version]

    quote do
      defstruct unquote(fields)
    end
  end

  # TODO: Document
  defmacro defmodeldesc(properties) do
    quote do
      @impl Kazan.Model
      def model_desc() do
        Kazan.Model.build_model_desc(__MODULE__, unquote(properties))
      end
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
  defmacro defmodellist(item_model) do
    quote do
      defstruct [:items, :metadata, :kind, :api_version]

      @impl Kazan.Model
      def model_desc() do
        alias Kazan.Models.{ModelDesc, PropertyDesc}

        alias Kazan.Models.Apimachinery.Meta.V1.ObjectMeta

        Kazan.Model.build_model_desc(__MODULE__, %{
          items: %PropertyDesc{
            field: "items",
            type: "array",
            items: %PropertyDesc{type: nil, ref: unquote(item_model)}
          }
        })
      end
    end
  end
end
