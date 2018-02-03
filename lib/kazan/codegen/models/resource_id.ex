defmodule Kazan.Codegen.Models.ResourceId do
  @moduledoc false
  # Stores the kind, version & group of a kubernetes resource.

  @enforce_keys [:group, :version, :kind]
  defstruct [:group, :version, :kind]

  @type t :: %{
    group: String.t,
    version: String.t,
    kind: String.t
  }

  @doc """
  Parses some ResourceIds from a models OAI description.

  This reads from the x-kubernetes-group-version-kind data - if this isn't
  present then we assume the model has no ResourceID.
  """
  @spec from_oai_desc(Map.t) :: [t]
  def from_oai_desc(model_desc) do
    if model_desc["x-kubernetes-group-version-kind"] do
      parse_x_kube_gvk(model_desc["x-kubernetes-group-version-kind"])
    else
      []
    end
  end

  @spec parse_x_kube_gvk([Map.t] | Map.t) :: [t]
  defp parse_x_kube_gvk(gvks) when is_list(gvks) do
    Enum.flat_map(gvks, &parse_x_kube_gvk/1)
  end

  defp parse_x_kube_gvk(gvk) do
    %{
      "group" => group,
      "version" => version,
      "kind" => kind
    } = gvk

    [%__MODULE__{group: group, version: version, kind: kind}]
  end
end
