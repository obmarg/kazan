defmodule Kazan.Models do
  @moduledoc """
  Contains structs for all k8s models that don't belong to a specific API group.

  Each module underneath Kazan.Models represents a single struct as used by
  the Kubernetes API.

  Also contains functions for serializing & deserializing these generated
  structs, though users should usually not need to interact with them.
  """
  require Kazan.Codegen.Models
  alias Kazan.Codegen
  alias Kazan.Models.{ModelDesc, PropertyDesc, ResourceId}

  Codegen.Models.from_spec()

  @doc """
  Decodes data from a Map into a Model struct.
  """
  @spec decode(Map.t(), atom | nil) :: {:ok, struct} | {:err, term}
  def decode(data, model \\ nil) do
    with {:ok, model} <- guess_model(data, model),
         desc = %ModelDesc{} = model.model_desc(),
         {:ok, model} <- do_decode(desc, data),
         do: {:ok, model}
  end

  @doc """
  Encodes data from a Kazan model to plain Maps suitable for JSON encoding.
  """
  @spec encode(struct) :: {:ok, Map.t()} | {:err, term}
  def encode(model) do
    model.__struct__.model_desc()
    |> do_encode(model)
  end

  @doc """
  Takes the name of a model in the OpenAPI spec, and returns the module that implements that model.
  """
  @spec oai_name_to_module(String.t()) :: atom | nil
  def oai_name_to_module(oai_name) do
    try do
      Kazan.Codegen.Naming.model_name_to_module(oai_name)
    rescue
      Kazan.UnknownName ->
        nil
    end
  end

  @spec guess_model(Map.t(), atom | nil) :: {:ok, atom} | {:err, term}
  defp guess_model(data, model) do
    cond do
      model ->
        {:ok, model}

      Map.has_key?(data, "kind") and Map.has_key?(data, "apiVersion") ->
        case model_from_version_and_kind(data["apiVersion"], data["kind"]) do
          nil ->
            {:err, :unknown_kind}

          module ->
            {:ok, module}
        end

      :otherwise ->
        {:err, :missing_kind}
    end
  end

  @spec model_from_version_and_kind(String.t(), String.t()) :: atom | nil
  defp model_from_version_and_kind(version, kind) do
    # version will be in one of two formats:
    # `version` for core resources
    # `group/version` for other resources.
    {group, version} =
      case String.split(version, "/") do
        [coreVersion] ->
          {"", coreVersion}

        [group, version] ->
          {group, version}
      end

    resource_id = %ResourceId{group: group, version: version, kind: kind}
    Map.get(resource_id_index(), resource_id)
  end

  @spec do_decode(ModelDesc.t(), Map.t()) :: {:ok, struct} | {:err, term}
  defp do_decode(model_desc, data) do
    result =
      model_desc.properties
      |> map_ok(fn {name, property_desc} ->
        property =
          data
          |> Map.get(property_desc.field)
          |> decode_property(property_desc)

        case property do
          {:ok, property} -> {:ok, {name, property}}
          {:err, _} = err -> err
        end
      end)

    case result do
      {:ok, properties} ->
        {:ok, struct!(model_desc.module_name, properties)}

      {:err, _} = err ->
        err
    end
  end

  @spec decode_property(term, PropertyDesc.t()) :: {:ok, term} | {:err, term}
  defp decode_property(value, property_desc)
  defp decode_property(nil, _), do: {:ok, nil}
  defp decode_property(value, %{type: :string}), do: {:ok, value}
  defp decode_property(value, %{type: :boolean}), do: {:ok, value}
  defp decode_property(value, %{type: :integer}), do: {:ok, value}
  defp decode_property(value, %{type: :object}), do: {:ok, value}

  defp decode_property(value, %{type: :array, items: items}) do
    map_ok(value, &decode_property(&1, items))
  end

  defp decode_property(value, %{type: {:array, items}}) do
    map_ok(value, &decode_property(&1, %{type: items}))
  end

  defp decode_property(value, %{type: nil, ref: ref}) do
    decode(value, ref)
  end

  defp decode_property(value, %{type: model}) when is_atom(model) do
    if Kernel.function_exported?(model, :decode, 1) do
      decode(value, model)
    else
      {:err, {:unknown_property_type, model}}
    end
  end

  defp decode_property(_value, %{type: type}) do
    {:err, {:unknown_property_type, type}}
  end

  @spec do_encode(ModelDesc.t(), struct) :: {:ok, Map.t()} | {:err, term}
  defp do_encode(model_desc, model) do
    result =
      model_desc.properties
      |> map_ok(fn {name, property_desc} ->
        property =
          model
          |> Map.get(name)
          |> encode_property(property_desc)

        case property do
          {:ok, property} -> {:ok, {property_desc.field, property}}
          {:err, _} = err -> err
        end
      end)

    case result do
      {:ok, properties} ->
        {:ok, properties |> Enum.reject(&val_is_nil?/1) |> Enum.into(%{})}

      {:err, _} = err ->
        err
    end
  end

  @spec encode_property(term, PropertyDesc.t()) :: {:ok, term} | {:err, term}
  defp encode_property(value, property_desc)
  defp encode_property(nil, _), do: {:ok, nil}
  defp encode_property(value, %{type: :string}), do: {:ok, value}
  defp encode_property(value, %{type: :boolean}), do: {:ok, value}
  defp encode_property(value, %{type: :integer}), do: {:ok, value}
  defp encode_property(value, %{type: :object}), do: {:ok, value}

  defp encode_property(value, %{type: :array, items: items}) do
    map_ok(value, &encode_property(&1, items))
  end

  defp encode_property(value, %{type: {:array, items}}) do
    map_ok(value, &encode_property(&1, items))
  end

  defp encode_property(value, %{type: nil, ref: model}) do
    model.encode(value)
  end

  defp encode_property(value, %{type: model}) when is_atom(model) do
    if Kernel.function_exported?(model, :encode, 1) do
      model.encode(value)
    else
      {:err, {:unknown_property_type, model}}
    end
  end

  defp encode_property(value, %{type: nil}) do
    encode(value)
  end

  defp encode_property(_, %{type: type}) do
    {:err, {:unknown_property_type, type}}
  end

  # map_ok acts like Enum.map, but for functions that can return {:ok, x} or
  # {:err, err}.  It also returns {:ok, res} or {:err, err}
  defp map_ok(enumerable, fun) do
    res =
      Enum.reduce_while(enumerable, [], fn elem, acc ->
        case fun.(elem) do
          {:ok, res} -> {:cont, [res | acc]}
          {:err, err} -> {:halt, {:err, err}}
        end
      end)

    case res do
      {:err, _} = err -> err
      results -> {:ok, Enum.reverse(results)}
    end
  end

  defp val_is_nil?({_, nil}), do: true
  defp val_is_nil?(_), do: false
end
