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
      import Kazan.Model,
        only: [defmodellist: 4, defmodel: 4, property: 3, property: 4]

      @behaviour Kazan.Model

      @impl Kazan.Model
      def decode(data), do: Kazan.Models.decode(data, __MODULE__)

      @impl Kazan.Model
      def encode(data), do: Kazan.Models.encode(data)

      defoverridable Kazan.Model
    end
  end

  alias Kazan.Models.{ModelDesc, PropertyDesc}

  defmacro property(local_name, remote_name, type, default \\ nil) do
    quote do
      @kazan_property_names {unquote(local_name), unquote(default)}
      @kazan_property_remote_names unquote(remote_name)
      @kazan_property_types unquote(type)
    end
  end

  defmacro defmodel(kind, group, version, block) do
    prelude =
      quote do
        Module.register_attribute(__MODULE__, :kazan_property_names,
          accumulate: true
        )

        Module.register_attribute(__MODULE__, :kazan_property_remote_names,
          accumulate: true
        )

        Module.register_attribute(__MODULE__, :kazan_property_types,
          accumulate: true
        )

        property :metadata,
                 "metadata",
                 Kazan.Models.Apimachinery.Meta.V1.ObjectMeta

        group_version = "#{unquote(group)}/#{unquote(version)}"

        property :api_version, "apiVersion", :string, group_version
        property :kind, "kind", :string, unquote(kind)

        unquote(block)
      end

    postlude =
      quote unquote: false do
        property_names = @kazan_property_names |> Enum.reverse()
        property_remote_names = @kazan_property_remote_names |> Enum.reverse()
        property_remote_types = @kazan_property_types |> Enum.reverse()

        @properties Enum.zip([
                      property_names,
                      property_remote_names,
                      property_remote_types
                    ])
                    |> Enum.map(fn {{name, _default}, remote_name, type} ->
                      {name, %PropertyDesc{field: remote_name, type: type}}
                    end)
                    |> Enum.into(%{})

        defstruct @kazan_property_names

        @impl Kazan.Model
        def model_desc() do
          %Kazan.Models.ModelDesc{
            module_name: __MODULE__,
            properties: @properties
          }
        end
      end

    quote do
      unquote(prelude)
      unquote(postlude)
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
  defmacro defmodellist(kind, group, version, item_model) do
    quote do
      defmodel unquote(kind), unquote(group), unquote(version) do
        property :items, "items", {:array, unquote(item_model)}
      end
    end
  end
end
