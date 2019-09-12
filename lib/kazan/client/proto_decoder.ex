defmodule Kazan.Client.ProtoDecoder do
  @moduledoc """
  Protocol Buffers decoder
  """

  def decode(data, object) do
    [_kind, _apiVersion | value] = String.split(data, <<0>>)

    encoded = Enum.join(value, <<0>>)

    object.decode(encoded)
  end
end
