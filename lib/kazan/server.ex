defmodule Kazan.Server do
  @moduledoc """
  Kazan.Server is a struct containing connection details for a kube server.
  """

  defstruct [url: nil]

  @type t :: %{
    url: String.t
  }
end
