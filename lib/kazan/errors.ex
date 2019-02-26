defmodule Kazan.RemoteError do
  @moduledoc """
  Raised when we get an error from a Kube server.
  """
  defexception [:reason]

  def message(error) do
    "Server responded with #{inspect(error.reason)}"
  end
end

defmodule Kazan.BuildRequestError do
  @moduledoc """
  Raised when we get an error from a Kube server.
  """
  defexception [:reason, :operation]

  def message(error) do
    "Error when building #{error.operation} request: #{error.reason}"
  end
end

defmodule Kazan.UnknownName do
  @moduledoc """
  Raised when we come across a k8s api/model who's name we don't know how to
  map to an elixir module.

  Can be fixed by setting `oai_name_mappings` in config.
  """
  defexception [:name]

  def message(error) do
    "Could not map #{error.name} into an elixir module.   Please ensure that oai_name_mappings is set correctly"
  end
end
