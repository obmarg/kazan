defmodule Kazan.Codegen.Models do
  @moduledoc false
  #Macros for generating client code from OAI specs.
  require EEx

  alias Kazan.Codegen.Models.ModelDesc

  @doc """
  Generates structs for all the data definitions in an OAPI spec.

  This will read the provided file at compile time and use it to generate a
  struct for each data definition. The structs will be named as they are in the
  provided file.

  It will also generate some model description data that can be used to write
  serializers/deserializers for each of the structs.
  """
  defmacro from_spec(spec_file) do
    models = parse_models(spec_file)
    resource_id_index = build_resource_id_index(models)

    spec_forms = for {module_name, desc} <- models do
      property_names = Map.keys(desc.properties)

      documentation = model_docs(desc.id, desc.description, desc.properties)

      quote do
        defmodule unquote(module_name) do
          @moduledoc unquote(documentation)

          defstruct unquote(property_names)
        end
      end
    end

    quote do
      Module.put_attribute(__MODULE__, :external_resource, unquote(spec_file))

      unquote_splicing(spec_forms)

      # Function returns a map of module name -> ModelDesc
      defp model_descs do
        unquote(Macro.escape(models))
      end

      # Returns a map of ResourceId to module
      defp resource_id_index do
        unquote(Macro.escape(resource_id_index))
      end
    end
  end

  @doc """
  Builds a module name atom from an OAI model name.
  """
  @spec module_name(String.t, Keyword.t) :: atom | nil
  def module_name(model_name, opts \\ []) do
    components = module_name_components(model_name)

    if Keyword.get(opts, :unsafe, false) do
      Module.concat(components)
    else
      try do
        Module.safe_concat(components)
      rescue ArgumentError ->
        nil
      end
    end
  end

  @doc """
  Parses a $ref for a definition into a models module name.
  """
  @spec definition_ref_to_module_name(String.t) :: nil | :atom
  def definition_ref_to_module_name(nil), do: nil
  def definition_ref_to_module_name("#/definitions/" <> model_def) do
    module_name(model_def)
  end

  @spec parse_models(String.t) :: [ModelDesc.t]
  defp parse_models(spec_file) do
    definitions =
      spec_file
      |> File.read!
      |> Poison.decode!
      |> Map.get("definitions")

    # First we need to go over all of the definitions and call module_name
    # on their names w/ unsafe.  This ensures that the atoms for each models module name are defined, and lets us use the safe module_name call everywhere else...
    Enum.each(definitions, fn {name, _} -> module_name(name, unsafe: true) end)

    # Most of the top-level definitions in the kube spec are models.
    # However, there are a few that are used in $ref statements to define common
    # property types instead.
    # We can tell these apart by whether or not they have "properties" or not.
    is_model = fn {_, model} -> Map.has_key?(model, "properties") end

    refs =
      definitions
      |> Enum.reject(is_model)
      |> Enum.map(fn {name, data} -> {module_name(name), data} end)
      |> Enum.into(%{})

    definitions
    |> Enum.filter(is_model)
    |> Enum.map(&ModelDesc.from_oai_desc(&1, refs))
    |> Enum.map(fn (desc) -> {desc.module_name, desc} end)
    |> Enum.into(%{})
  end

  EEx.function_from_string(:defp, :model_docs, """
  <%= model_description %>

  OpenAPI Definition: `<%= id %>`

  ### Properties

  <%= for {name, property} <- properties do %>
  * `<%= name %>` <%= if doc = property_type_doc(property) do %>:: <%= doc %> <% end %>
      * <%= process_description(property.description) %> <% end %>
  """, [:id, :model_description, :properties])

  # Creates a property type doc string.
  @spec property_type_doc(Property.t) :: String.t | nil
  defp property_type_doc(property) do
    if property.ref do
      "`#{doc_ref(property.ref)}`"
    else
      case property.type do
        "array" -> "[ #{property_type_doc(property.items)} ]"
        "integer" -> "`Integer`"
        "number" -> "`Float`"
        "object" -> "`Map`"
        "string" -> case property.format do
                      "date" -> "`Date`"
                      "date-time" -> "`DateTime`"
                      _ -> "`String`"
                    end
        "boolean" -> "`Boolean`"
      end
    end
  end

  # Pre-processes a fields description.
  # Useful for making actual links out of HTTP links etc.
  @spec process_description(String.t) :: String.t
  defp process_description(nil), do: ""
  defp process_description(desc) do
    String.replace(
      desc, ~r{ (more info): (https?://.*)(\s|$)}i, " [\\1](\\2)."
    )
  end

  # Strips the `Elixir.` prefix from an atom for use in documentation.
  # Atoms will not be linked if they include the Elixir. prefix.
  defp doc_ref(str) do
    str |> Atom.to_string |> String.replace(~r/^Elixir./, "")
  end

  # The Kube OAI specs have some extremely long namespace prefixes on them.
  # These really long names make for a pretty ugly API in Elixir, so we chop off
  # some common prefixes.
  # We also need to categorise things into API specific models or models that
  # live in the models module.
  @spec module_name_components(String.t) :: nonempty_improper_list(atom, String.t)
  defp module_name_components(name) do
    to_components = fn str ->
      str |> String.split(".") |> Enum.map(&titlecase_once/1)
    end

    case name do
      # Deprecated
      "io.k8s.kubernetes.pkg.api." <> rest ->
        [Kazan.Apis] ++ to_components.(rest)
      # Deprecated
      "io.k8s.kubernetes.pkg.apis." <> rest ->
        [Kazan.Apis] ++ to_components.(rest)
      "io.k8s.api." <> rest ->
        [Kazan.Apis] ++ to_components.(rest)
      "io.k8s.apimachinery.pkg.apis." <> rest ->
        [Kazan.Models.Apimachinery] ++ to_components.(rest)
      "io.k8s.apimachinery.pkg." <> rest ->
        [Kazan.Models.Apimachinery] ++ to_components.(rest)
      "io.k8s.kube-aggregator.pkg.apis." <> rest ->
        [Kazan.Models.KubeAggregator] ++ to_components.(rest)
      "io.k8s.apiextensions-apiserver.pkg.apis." <> rest ->
        [Kazan.Models.ApiextensionsApiserver] ++ to_components.(rest)
    end
  end

  @spec build_resource_id_index(%{atom => ModelDesc.t}) :: %{ResourceId => atom}
  defp build_resource_id_index(model_map) do
    model_map
    |> Map.values
    |> Enum.flat_map(fn model_desc ->
        Enum.map(model_desc.resource_ids, fn resource_id ->
          {resource_id, model_desc.module_name}
        end)
      end)
    |> Enum.into(%{})
  end

  # Uppercases the first character of str
  # This is different from capitalize, in that it leaves the rest of the string
  # alone.
  defp titlecase_once(str) do
    first_letter = String.first(str)
    String.replace_prefix(str, first_letter, String.upcase(first_letter))
  end
end
