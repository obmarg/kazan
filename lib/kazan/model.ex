defmodule Kazan.Model do
  @moduledoc """
  Provides functionality for defining types for k8s custom resources.

  The easiest way to use this module is to make use of the `defmodel` macro:

      defmodule MyCustomResource do
        use Kazan.Model

        defmodel "MyCustomResource", "example.com", "v1" do
          property :an_int, "anInt", :integer
        end
      end

  ### Resource Lists

  When you define a custom resource in k8s, you automatically get a
  list type for that custom list, similar to the built in PodList etc. types.
  Kazan provides a helper for defining these list types:

      defmodule MyCustomResourceList do
        use Kazan.Model

        defmodellist "MyCustomResourceList",
                     "example.com",
                     "v1",
                     MyCustomResource
      end

  ### Custom encoding & decoding

  You might find that the Kazan serialization & deserialization is not
  suitable for your particular custom resource.  In that case, you can
  implement the `Kazan.Model` behaviour yourself to override this.

      defmodule ComplexResource do
        use Kazan.Model

        def encode(data) do
          # Encode things here
        end

        def decode(data) do
          # Decode things here
        end

        def model_desc() do
          nil
        end
      end
  """
  @callback decode(map :: Map.t()) :: struct
  @callback encode(model :: struct) :: Map.t()
  @callback model_desc() :: Kazan.ModelDesc.t()

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

  alias Kazan.Models.{PropertyDesc}

  @doc """
  Defines a model.

  This macro will create a struct in the current module with all the properties
  that are defined inside it's do block, and a model_desc function that the default
  `encode/1` & `decode/1` implementations can use.

  It also ensures that the struct has the standard k8s model fields: `kind`,
  `apiVersion` & `metadata`.

  For an example see the module documentation of `Kazan.Model`.

  ### Arguments

  * `kind` is the Kind to use when sending the type to k8s
  * `group` is the API group that this CRD belongs to.
  * `version` is the API version that this CRD belongs to.
  """
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
  Defines a property on a model.

  This is only intended to be used within the do block of a `defmodel/4` call

  ### Arguments

  * `local_name` is the name of the property in the struct that will be created.
  * `remote_name` is the name of the property when it's transmitted to k8s.
  * `type` is the type of the property
  * `default` is the default value of the property in the defined struct.

  ### Property Types

  * `:integer`
  * `:string`
  * `:number` is a floating point number
  * `:object` is an arbitrary Map
  * `{:array, item_type}` is a list of item_type
  * Any model module can be used here and we'll serialize/deserialize that Model.
  """
  defmacro property(local_name, remote_name, type, default \\ nil) do
    quote do
      @kazan_property_names {unquote(local_name), unquote(default)}
      @kazan_property_remote_names unquote(remote_name)
      @kazan_property_types unquote(type)
    end
  end

  @doc """
  Utility macro for definining lists of custom resources.

  This generates all the neccesary boilerplate for a `Kazan.Model` that
  represents a k8s list containing `item_model`.

  For example, if you needed to recreate a PodList that contains Pods:

      defmodule PodList do
        use Kazan.Model

        defmodellist "PodList", "core", "v1", Pod
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
