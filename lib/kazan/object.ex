defmodule Kazan.Object do
  @moduledoc """
  Utility functions for manipulating k8s "objects".
  """
  alias Kazan.Models.Apimachinery.Meta.V1.ObjectMeta

  @doc """
  Updates an object with a name.

  Designed to be used in pipes:

  TODO: A docstring/example
  """
  @spec with_name(struct(), String.t) :: struct()
  def with_name(%{metadata: nil} = object, name) do
    with_name(%{object | metadata: %ObjectMeta{}}, name)
  end

  def with_name(%{metadata: %ObjectMeta{} = meta} = object, name) do
    %{object | metadata: %{meta | name: name}}
  end
end
