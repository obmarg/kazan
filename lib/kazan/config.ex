defmodule Kazan.Config do
  @moduledoc false

  # Loads the swagger filename from the config
  def oai_spec() do
    case Application.get_env(:kazan, :oai_spec) do
      nil ->
        "kube_specs/swagger.json"

      filename ->
        filename
    end
  end

  def oai_name_mappings do
    Application.get_env(:kazan, :oai_name_mappings, [])
    |> Enum.map(fn {oai_prefix, module_prefix} ->
      {ensure_ends_with_dot(oai_prefix), module_prefix}
    end)
  end

  defp ensure_ends_with_dot(name) do
    if String.ends_with?(name, ".") do
      name
    else
      name <> "."
    end
  end
end
