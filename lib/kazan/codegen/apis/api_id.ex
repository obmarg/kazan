defmodule Kazan.Codegen.Apis.ApiId do
  @moduledoc false
  # Stores the kind, version & group of a kubernetes resource.

  @enforce_keys [:group, :version]
  defstruct [:group, :version]

  @type t :: %{
    group: String.t,
    version: String.t | nil
  }

  @spec from_oai_tag(String.t) :: t
  def from_oai_tag(operation_tag) do
    {group, version} =
      case String.split(operation_tag, "_") do
        [group, version] ->
          {String.capitalize(group), String.capitalize(version)}
        [group] ->
          {String.capitalize(group), nil}
      end

    %__MODULE__{group: group, version: version}
  end
end
