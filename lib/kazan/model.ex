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
      import Kazan.Model, only: [defmodeldesc: 1, defmodellist: 1, defmodel: 1, property: 3]

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

  defmacro property(local_name, remote_name, type) do
    quote do
      @kazan_property_names unquote(local_name)
      @kazan_property_remote_names unquote(remote_name)
      @kazan_property_types unquote(type)
    end
  end

  # TODO: Possibly move the DSL stuff out into a DSL module?

  # TODO: Need a compile hook that'll run before or after compile, read
  # @_kazan_property and output the appropriate defstruct * defmodeldesc calls...

  defmacro defmodel(block) do
    prelude = quote do
      Module.register_attribute(__MODULE__, :kazan_property_names, accumulate: true)
      Module.register_attribute(__MODULE__, :kazan_properties, accumulate: true)

      property :metadata, "a_string", Kazan.Models.Apimachinery.Meta.V1.ObjectMeta
      property :api_version, "apiVersion", "string"
      property :kind, "kind", "string"

      unquote(block)
    end

    postlude = quote unquote: false do
      property_names = @kazan_property_names |> Enum.reverse
      property_remote_names = @kazan_property_names |> Enum.reverse
      property_remote_types = @kazan_property_names |> Enum.reverse

      defstruct @kazan_property_names

      # TODO: Generate a model_desc function as well...
    end

    quote do
      unquote(prelude)
      unquote(postlude)
    end
  end

  defmacro __before_compile_model__(_env) do
    quote do
      @_kazan_property_names Enum.map(@_kazan_property, fn {name, _, _} -> name end)

      defmodel @_kazan_property_names
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
