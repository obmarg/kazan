defmodule Kazan.Request do
  @moduledoc """
  Kazan.Request is a struct that describes an HTTP request.

  Users should mostly treat this struct as opaque - `Kazan.run` consumes it, and
  functions in the various `Kazan.Apis` submodules construct it.
  """
  defstruct [:method, :path, :query_params, :content_type, :body, :response_schema]

  import Kazan.Codegen.Models, only: [definition_ref_to_module_name: 1]

  @type t :: %__MODULE__{
    method: String.t,
    path: String.t,
    query_params: Map.t,
    content_type: String.t,
    body: String.t,
    response_schema: atom | nil
  }

  @op_map File.read!("kube_specs/swagger.json") |> Poison.decode! |> Kazan.Swagger.swagger_to_op_map

  @doc """
  Creates a kazan request for a given operation.

  ### Parameters

  - `operation` should be the nickname of an operation found in the swagger dict
  - `params` should be a Map of parameters to send in the request.
  """
  @spec create(atom, Map.t) :: {:ok, Map.t} | {:error, atom}
  def create(operation, params) do
    case validate_request(operation, params) do
      {:ok, op} ->
        {:ok, build_request(op, params)}
      {:err, _} = err ->
        err
    end
  end

  # Checks that we have all the expected parameters for our request.
  @spec validate_request(String.t, Map.t) :: {:ok, Map.t} | {:err, term}
  defp validate_request(operation, params) do
    operation = @op_map[operation]
    if operation != nil do
      operation
      |> Map.get("parameters", [])
      |> Enum.filter(&Map.get(&1, "required", false))
      |> Enum.map(&Map.get(&1, "name"))
      |> Enum.reject(&Map.has_key?(params, &1))
      |> case do
            [] -> {:ok, operation}
            missing -> {:err, {:missing_params, missing}}
          end
    else
      {:err, :unknown_op}
    end
  end

  @spec build_request(Map.t, Map.t) :: __MODULE__.t
  defp build_request(operation, params) do
    param_groups = Enum.group_by(
      operation["parameters"],
      fn (param) -> param["in"] end
    )

    %__MODULE__{
      method: operation["method"],
      path: build_path(operation["path"], param_groups, params),
      query_params: build_query_params(param_groups, params),
      content_type: content_type(operation),
      body: build_body(param_groups, params),
      response_schema: definition_ref_to_module_name(
        operation["responses"]["200"]["schema"]["$ref"]
      )
    }
  end

  @spec build_path(String.t, Map.t, Map.t) :: String.t
  defp build_path(path, param_groups, params) do
    path_params = Map.get(param_groups, "path", [])

    Enum.reduce(path_params, path, fn (param, path) ->
      name = param["name"]
      String.replace(path, "{#{name}}", params[name])
    end)
  end

  @spec build_query_params(Map.t, Map.t) :: Map.t
  defp build_query_params(param_groups, params) do
    param_groups
    |> Map.get("query", [])
    |> Enum.filter(&(Map.has_key?(params, &1["name"])))
    |> Enum.map(fn (param) -> {param["name"], params[param["name"]]} end)
    |> Enum.into(%{})
  end

  @spec build_body(Map.t, Map.t) :: String.t | no_return
  defp build_body(param_groups, params) do
    case Map.get(param_groups, "body", []) do
      [body_param] ->
        {:ok, data} = Kazan.Models.encode(params[body_param["name"]])
        Poison.encode!(data)
      [] ->
        :nil
      _others ->
        raise "More than one body param in swagger operation spec..."
    end
  end

  @spec content_type(Map.t) :: String.t | no_return
  defp content_type(operation) do
    cond do
      operation["method"] == "get" ->
        nil
      "application/json" in operation["consumes"] ->
        "application/json"
      "application/merge-patch+json" in operation["consumes"] ->
        "application/merge-patch+json"
      "*/*" in operation["consumes"] ->
        "application/json"
      :otherwise ->
        raise "Can't find supported content-type: #{inspect operation}"
    end
  end
end
