defmodule Kazan.Codegen.Models do
  @moduledoc false
  #Macros for generating client code from OAI specs.

  alias Kazan.Codegen.Models.{PropertyDesc, ModelDesc}

  @doc """
  Generates structs for all the data definitions in an OAPI spec.

  This will read the provided file at compile time and use it to generate a
  struct for each data definition. The structs will be named as they are in the
  provided file.

  It will also generate some model description data that can be used to write
  serializers/deserializers for each of the structs.
  """
  defmacro from_spec(spec_file) do
    models =
      spec_file
      |> File.read!
      |> Poison.decode!
      |> Map.get("definitions")
      |> Enum.filter(fn {_, model} -> Map.has_key?(model, "properties") end)
      |> Enum.map(&ModelDesc.from_oai_desc/1)
      |> Enum.map(fn (desc) -> {desc.module_name, desc} end)
      |> Enum.into(%{})

    spec_forms = for {module_name, desc} <- models do
      property_names = Map.keys(desc.properties)

      documentation = model_docs(desc.description, desc.properties)

      quote do
        IO.puts "Creating model #{unquote(module_name)}"

        defmodule unquote(module_name) do
          @moduledoc unquote(documentation)

          defstruct unquote(property_names)
        end
      end
    end

    quote do
      Module.put_attribute(__MODULE__, :external_resource, unquote(spec_file))

      unquote_splicing(spec_forms)

      def model_descs do
        unquote(Macro.escape(models))
      end
    end
  end

  # Builds a module name atom from a OAI model name.
  @spec module_name(String.t) :: atom
  def module_name(model_name) do
    fixed_name =
      model_name
      |> String.split(".")
      |> Enum.map(fn (str) ->
      {first, rest} = String.Casing.titlecase_once(str)
      first <> rest
    end)
    |> Enum.join(".")

      Module.concat(Kazan.Models, fixed_name)
  end

  # Builds an atom property name from an OAI property name.
  @spec property_name(String.t) :: atom
  def property_name(str) do
    str |> Macro.underscore |> String.to_atom
  end

  @spec model_docs(String.t, ModelDesc.property_map) :: String.t
  defp model_docs(model_description, properties) do
    property_docs =
      properties
      |> Enum.map(fn {name, property} ->
        "* `#{name}` - #{property.description}"
      end)
      |> Enum.join("\n")

    """
    #{model_description}

    ### Properties

    #{property_docs}
    """
  end
end
