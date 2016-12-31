defmodule Kazan.Swagger do
  @moduledoc false
  # Pre-processing utilities for Kube swagger data.

  # Takes a swagger dictionary and builds a map of
  # operation_name => operation
  def swagger_to_op_map(swagger_map) do
    swagger_map["paths"]
    |> Enum.flat_map(fn {path, path_data} ->
      parameters = Map.get(path_data, "parameters", %{})
      method_maps = Map.delete(path_data, "parameters")

      Enum.map(method_maps, fn {method, operation} ->
        operation
        |> Map.put("path", path)
        |> Map.put("method", method)
        |> Map.update("parameters", parameters, &Enum.concat(parameters, &1))
      end)
    end)
    |> Enum.map(fn (operation) ->
      {operation["operationId"], operation}
    end)
    |> Enum.into(%{})
  end
end
