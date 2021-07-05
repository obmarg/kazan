defmodule Kazan.Codegen.Models do
  @moduledoc false
  # Macros for generating client code from OAI specs.
  require EEx

  require Kazan.Models.ModelDesc

  alias Kazan.Models.{ModelDesc, PropertyDesc}
  alias Kazan.Codegen.Naming

  @doc """
  Generates structs for all the data definitions in an OAPI spec.

  This will read the provided file at compile time and use it to generate a
  struct for each data definition. The structs will be named as they are in the
  provided file.

  It will also generate some model description data that can be used to write
  serializers/deserializers for each of the structs.
  """
  defmacro from_spec() do
    spec_file = Kazan.Config.oai_spec()
    models = parse_models(spec_file)
    resource_id_index = build_resource_id_index(models)

    spec_forms =
      for {module_name, desc} <- models do
        property_names = Map.keys(desc.properties)

        typespec = typespec_for_model(desc)

        documentation = model_docs(desc.id, desc.description, desc.properties)

        quote do
          defmodule unquote(module_name) do
            @moduledoc unquote(documentation)

            defstruct unquote(property_names)

            @type t :: %__MODULE__{unquote_splicing(typespec)}

            use Kazan.Model

            @impl Kazan.Model
            def model_desc(), do: unquote(Macro.escape(desc))
          end
        end
      end

    quote do
      Module.put_attribute(__MODULE__, :external_resource, unquote(spec_file))

      unquote_splicing(spec_forms)

      # Returns a map of ResourceId to module
      defp resource_id_index do
        unquote(Macro.escape(resource_id_index))
      end
    end
  end

  @spec parse_models(String.t()) :: [ModelDesc.t()]
  defp parse_models(spec_file) do
    definitions =
      spec_file
      |> File.read!()
      |> Poison.decode!()
      |> Map.get("definitions")

    # First we need to go over all of the definitions and call module_name
    # on their names w/ unsafe.  This ensures that the atoms for each models module name are defined, and lets us use the safe module_name call everywhere else...
    Enum.each(definitions, fn {name, _} ->
      Naming.model_name_to_module(name, unsafe: true)
    end)

    # Most of the top-level definitions in the kube spec are models.
    # However, there are a few that are used in $ref statements to define common
    # property types instead.
    # We can tell these apart by whether or not they have "properties" or not.
    is_model = fn {_, model} -> Map.has_key?(model, "properties") end

    refs =
      definitions
      |> Enum.reject(is_model)
      |> Enum.map(fn {name, data} ->
        {Naming.model_name_to_module(name), data}
      end)
      |> Enum.into(%{})

    definitions
    |> Enum.filter(is_model)
    |> Enum.map(&ModelDesc.from_oai_desc(&1, refs))
    |> Enum.map(fn desc -> {desc.module_name, desc} end)
    |> Enum.into(%{})
  end

  @spec typespec_for_model(ModelDesc.t()) :: struct
  # Generates a typespec map for a model
  defp typespec_for_model(%ModelDesc{} = model_desc) do
    for {name, desc} <- model_desc.properties do
      {name,
       desc
       |> typespec_for_property()
       |> typespec_optional(name not in model_desc.required)}
    end
  end

  @spec typespec_optional([{atom, term}], boolean()) :: [{atom, term}]
  defp typespec_optional(typespec_ast, false), do: typespec_ast

  defp typespec_optional(typespec_ast, true) do
    {:|, [], [typespec_ast, nil]}
  end

  @spec typespec_for_property(PropertyDesc.t()) :: [{atom, term}]
  defp typespec_for_property(%PropertyDesc{ref: model})
       when not is_nil(model) do
    quote do
      unquote(model).t
    end
  end

  defp typespec_for_property(%PropertyDesc{items: items})
       when not is_nil(items) do
    [typespec_for_property(items)]
  end

  defp typespec_for_property(%PropertyDesc{type: :string}) do
    quote do
      String.t()
    end
  end

  defp typespec_for_property(%PropertyDesc{type: :integer}) do
    {:integer, [], Elixir}
  end

  defp typespec_for_property(%PropertyDesc{type: :number}) do
    {:float, [], Elixir}
  end

  defp typespec_for_property(%PropertyDesc{type: :boolean}) do
    {:boolean, [], Elixir}
  end

  defp typespec_for_property(%PropertyDesc{type: :object}) do
    {:map, [], Elixir}
  end

  EEx.function_from_string(
    :defp,
    :model_docs,
    """
    <%= model_description %>

    OpenAPI Definition: `<%= id %>`

    ### Properties

    <%= for {name, property} <- properties do %>
    * `<%= name %>` <%= if doc = property_type_doc(property) do %>:: <%= doc %> <% end %>
        * <%= process_description(property.description) %> <% end %>
    """,
    [:id, :model_description, :properties]
  )

  # Creates a property type doc string.
  @spec property_type_doc(Property.t()) :: String.t() | nil
  defp property_type_doc(property) do
    if property.ref do
      "`#{doc_ref(property.ref)}`"
    else
      case property.type do
        :array ->
          "[ #{property_type_doc(property.items)} ]"

        :integer ->
          "`Integer`"

        :number ->
          "`Float`"

        :object ->
          "`Map`"

        :string ->
          case property.format do
            "date" -> "`Date`"
            "date-time" -> "`DateTime`"
            _ -> "`String`"
          end

        :boolean ->
          "`Boolean`"
      end
    end
  end

  # Pre-processes a fields description.
  # Useful for making actual links out of HTTP links etc.
  @spec process_description(String.t()) :: String.t()
  defp process_description(nil), do: ""

  defp process_description(desc) do
    String.replace(
      desc,
      ~r{ (more info): (https?://.*)(\s|$)}i,
      " [\\1](\\2)."
    )
  end

  # Strips the `Elixir.` prefix from an atom for use in documentation.
  # Atoms will not be linked if they include the Elixir. prefix.
  defp doc_ref(str) do
    str |> Atom.to_string() |> String.replace(~r/^Elixir./, "")
  end

  @spec build_resource_id_index(%{atom => ModelDesc.t()}) :: %{
          ResourceId => atom
        }
  defp build_resource_id_index(model_map) do
    model_map
    |> Map.values()
    |> Enum.flat_map(fn model_desc ->
      Enum.map(model_desc.resource_ids, fn resource_id ->
        {resource_id, model_desc.module_name}
      end)
    end)
    |> Enum.into(%{})
  end
end
