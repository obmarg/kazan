defmodule Kazan.Codegen.Apis do
  @moduledoc false
  # Macros for generating API clients from OAI specs.
  import Kazan.Swagger, only: [swagger_to_op_map: 1]
  alias Kazan.Codegen.Apis.{ApiId, Operation, Parameter}

  require EEx

  @doc """
  Generates API client modules for all the operations defined in an OAPI spec.

  This reads the provided file at compile time and uses it to generate functions
  and their corresponding models.

  The modules will be defined by the tags for each of the operations, and the
  functions will be named using a camel case version of the operationId.

  Currently the operationId has some tag-related data embedded in it, which we
  remove for the sake of brevity.
  """
  defmacro from_spec(spec_file) do
    operations =
      File.read!(spec_file)
      |> Poison.decode!
      |> swagger_to_op_map
      |> Map.values
      |> Enum.flat_map(&duplicate_on_tags/1)

    # Create the atoms for all the names of our operations.
    :ok =
      operations
      |> Enum.map(fn (op_desc) -> op_desc["tag"] end)
      |> Enum.uniq
      |> Enum.map(&ApiId.from_oai_tag/1)
      |> Enum.each(&api_module &1, unsafe: true)

    operations = Enum.map(operations, &Operation.from_oai_desc/1)

    api_groups = Enum.group_by(operations, fn (op) -> op.api_id end)

    module_forms = for {api_id, functions} <- api_groups do
      function_forms = Enum.map(functions, &function_form/1)
      module_doc = module_doc(api_id)
      module_name = api_module(api_id)

      quote do
        defmodule unquote(module_name) do
          @moduledoc unquote(module_doc)

          unquote_splicing(function_forms)
        end
      end
    end

    quote do
      @external_resource unquote(spec_file)

      unquote_splicing(module_forms)

      defp operation_descs do
        unquote(Macro.escape(operations))
      end
    end
  end

  @doc """
  Builds an api module name from an ApiId.
  """
  @spec api_module(ApiId.t, Keyword.t) :: atom
  def api_module(api_id, opts \\ []) do
    components =
      if api_id.version != nil do
        [Kazan.Apis, api_id.group, api_id.version]
      else
        [Kazan.Apis, api_id.group]
      end

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
  Builds a function name from the operationId of an OAI operation.

  We take the operation tag in here too, because the Kube OAI operations use IDs
  like listCoreV1ConfigMapForAllNamespaces where the operation is on the core_v1
  API. We don't want to have such large function names, so we try to strip the
  API name out.
  """
  @spec function_name(String.t, String.t | atom) :: atom
  def function_name(operation_id, tag, opts \\ []) when is_binary(tag) do
    string_name =
      operation_id
      |> String.replace(Macro.camelize(tag), "")
      |> Macro.underscore

    if Keyword.get(opts, :unsafe, false) do
      String.to_atom(string_name)
    else
      try do
        String.to_existing_atom(string_name)
      rescue ArgumentError ->
          nil
      end
    end
  end

  # Swagger tags are a list. There _appears_ to only be one tag per operation,
  # but there could be more.  We handle that by duplicating on tags.
  # Once this function is finished, we will have a bunch of operations with a
  # single tag.
  @spec duplicate_on_tags(Map.t) :: [Map.t]
  defp duplicate_on_tags(operation) do
    for tag <- operation["tags"] do
      operation |> Map.put("tag", tag) |> Map.delete("tags")
    end
  end

  # Builds the quoted function form for an operation function.
  @spec function_form(Operation.t) :: term
  defp function_form(operation) do
    param_groups = Enum.group_by(
      operation.parameters,
      fn (param) -> param.type end
    )

    is_required = fn (param) -> param.required end
    query_params = Map.get(param_groups, :query, [])

    path_params =
      param_groups |> Map.get(:path, []) |> sort_path_params(operation.path)

    # The main arguments our function will take:
    argument_params =
      Map.get(param_groups, :body, [])
      ++ path_params
      ++ Enum.filter(query_params, is_required)

    optional_params = Enum.reject(query_params, is_required)

    arguments = argument_forms(argument_params, optional_params)
    docs = function_docs(
      operation.operation_id, operation.description, argument_params, optional_params, operation.response_schema
    )

    param_unpacking = if Enum.empty?(argument_params) do
      quote do
        %{}
      end
    else
      argument_map_pairs = for arg <- argument_params do
        {arg.var_name, Macro.var(arg.var_name, __MODULE__)}
      end
      quote location: :keep do
        %{unquote_splicing(argument_map_pairs)}
      end
    end

    option_merging = cond do
      Enum.empty?(optional_params) ->
        quote do
          params
        end
      Enum.empty?(argument_params) ->
        quote location: :keep do
          Enum.into(options, %{})
        end
      :otherwise ->
        quote location: :keep do
          Map.merge(Enum.into(options, %{}), params)
        end
    end

    transform_map = for parameter <- operation.parameters, into: %{} do
      {parameter.var_name, parameter.field_name}
    end

    bang_function_name = String.to_atom(
      Atom.to_string(operation.function_name) <> "!"
    )
    argument_forms_in_call = argument_call_forms(
      argument_params, optional_params
    )

    quote location: :keep do
      @doc unquote(docs)
      def unquote(operation.function_name)(unquote_splicing(arguments)) do
        params = unquote(param_unpacking)
        params = unquote(option_merging)
        {:ok, req} = Kazan.Request.create(
          unquote(operation.operation_id),
          Kazan.Codegen.Apis.transform_request_parameters(
            unquote(Macro.escape(transform_map)),
            params
          )
        )
      end

      @doc unquote(docs)
      def unquote(bang_function_name)(unquote_splicing(arguments)) do
        rv = unquote(operation.function_name)(
          unquote_splicing(argument_forms_in_call)
        )
        case rv do
          {:ok, result} -> result
          {:err, reason} ->
            raise Kazan.BuildRequestError,
              reason: reason, operation: unquote(operation.function_name)
        end
      end
    end
  end

  # Transforms a map of function arguments into a map of request parameters.
  def transform_request_parameters(parameter_descs, parameters) do
    for {k, v} <- parameters, into: %{} do
      {parameter_descs[k], v}
    end
  end

  # List of argument forms to go in function argument lists.
  @spec argument_forms([Map.t], [Map.t]) :: [term]
  defp argument_forms(argument_params, []) do
    for param <- argument_params do
      Macro.var(param.var_name, __MODULE__)
    end
  end
  defp argument_forms(argument_params, _optional_params) do
    argument_forms(argument_params, [])
    ++ [{:\\, [], [Macro.var(:options, __MODULE__), []]}]
  end

  # List of arugment forms to go in call to function from bang function.
  @spec argument_call_forms([Map.t], [Map.t]) :: [term]
  defp argument_call_forms(argument_params, []) do
    for param <- argument_params do
      Macro.var(param.var_name, __MODULE__)
    end
  end
  defp argument_call_forms(argument_params, _optional_params) do
    argument_forms(argument_params, [])
    ++ [Macro.var(:options, __MODULE__)]
  end

  # The Kube API specs provide path parameters in an unintuitive order,
  # so we sort them by the order they appear in the request path here.
  @spec sort_path_params([Parameter.t], String.t) :: [Parameter.t]
  defp sort_path_params(parameters, path) do
    Enum.sort(parameters, fn (param1, param2) ->
      loc1 = str_index("{#{param1.field_name}}", path)
      loc2 = str_index("{#{param2.field_name}}", path)
      loc1 <= loc2
    end)
  end

  # I can't believe I'm having to implement this myself :/
  defp str_index(needle, haystack) do
    case String.split(haystack, needle, parts: 2) do
      [left, _] -> String.length(left)
      [_] -> nil
    end
  end

  EEx.function_from_string(:defp, :function_docs, """
  <%= if description do description end %>

  OpenAPI Operation ID: `<%= operation_id %>`
  <%= unless Enum.empty?(parameters) do %>
  ### Parameters

  <%= for param <- parameters do %>
  * `<%= param.var_name %>` - <%= param.description %><%= if param.schema do %>See `<%= doc_ref(param.schema) %>`. <% end %> <% end %>
  <% end %>

  <%= unless Enum.empty?(options) do %>

  ### Options

  <%= for option <- options do %>
  * `<%= option.var_name %>` - <%= option.description %>
  <% end %>
  <% end %>

  <%= if response_schema do %>
  ### Response

  See `<%= doc_ref(response_schema) %>`
  <% end %>

  """, [:operation_id, :description, :parameters, :options, :response_schema])

  defp module_doc(api_id) do
    case api_id do
      %{group: group, version: nil} ->
        """
        Module for the #{group} API group.

        This module contains functions that can be used to query the avaliable
        versions of the #{group} API in a k8s server. Each of these functions
        will output a `Kazan.Request` suitable for passing to `Kazan.run`.

        The submodules of this module provide implementations of each of those
        versions.
        """
      %{group: group, version: version} ->
        """
        Contains functions for #{version} of the #{group} API group.

        Each of these functions will output a `Kazan.Request` suitable for passing
        to `Kazan.run`.

        This module also contains struct submodules that can be sent & received
        from this version of the #{group} API.
        """
    end
  end

  # Strips the `Elixir.` prefix from an atom for use in documentation.
  # Atoms will not be linked if they include the Elixir. prefix.
  defp doc_ref(str) do
    str |> Atom.to_string |> String.replace(~r/^Elixir./, "")
  end
end
