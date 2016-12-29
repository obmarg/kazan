defmodule Kazan.Request do
  @moduledoc """
  Kazan.Request is a struct that describes an HTTP request.
  """

  defstruct [:method, :url, :query_params, :body]

  @type t :: %__MODULE__{
    method: String.t,
    url: String.t,
    query_params: Map.t,
    body: String.t
  }

  @doc """
  Creates a kazan request for a given operation.

  ### Parameters

  - `operation` should be the nickname of an operation found in the swagger dict
  - `swagger_dict` should be a swagger dictionary for a kube API.
  - `params` should be a Map of parameters to send in the request.
  """
  @spec create(atom, Map.t, Map.t) :: {:ok, Map.t} | {:error, atom}
  def create(operation, swagger_dict, params) do
    op_map = swagger_to_op_map(swagger_dict)
    case validate_request(operation, op_map, params) do
      {:ok, op} ->
        {:ok, build_request(op, params)}
      {:err, _} = err ->
        err
    end
  end

  @spec validate_request(String.t, Map.t, Map.t) :: {:ok, Map.t} | {:err, term}
  defp validate_request(operation, op_map, params) do
    operation = op_map[operation]
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
  defp build_request(operation_map, params) do
    param_groups = Enum.group_by(
      operation_map["parameters"],
      fn (param) -> param["paramType"] end
    )

    %__MODULE__{
      method: operation_map["method"],
      url: build_url(operation_map["path"], param_groups, params),
      query_params: build_query_params(param_groups, params),
      body: build_body(param_groups, params)
    }
  end

  @spec build_url(String.t, Map.t, Map.t) :: String.t
  defp build_url(url, param_groups, params) do
    path_params = Map.get(param_groups, "path", [])

    Enum.reduce(path_params, url, fn (param, url) ->
      name = param["name"]
      String.replace(url, "{#{name}}", params[name])
    end)
  end

  @spec build_query_params(Map.t, Map.t) :: Map.t
  defp build_query_params(param_groups, params) do
    param_groups
    |> Map.get("query", [])
    |> Enum.filter_map(&(Map.has_key?(params, &1["name"])), fn (param) ->
      {param["name"], params[param["name"]]}
    end)
    |> Enum.into(%{})
  end

  @spec build_body(Map.t, Map.t) :: String.t | no_return
  defp build_body(param_groups, params) do
    case Map.get(param_groups, "body", []) do
      [body_param] ->
        Poison.encode!(params[body_param["name"]])
      [] ->
        :nil
      _others ->
        raise "More than one body param in swagger operation spec..."
    end
  end

  # Takes a swagger dictionary and builds a map of
  # operation_name => operation
  # TODO: Typespec this function.
  def swagger_to_op_map(swagger_map) do
    swagger_map["apis"]
    |> Enum.flat_map(fn (api) ->
      Enum.map(api["operations"], fn (op) ->
        Map.put(op, "path", api["path"])
      end)
    end)
    |> Enum.map(fn (operation) ->
      {operation["nickname"], operation}
    end)
    |> Enum.into(%{})
  end
end
