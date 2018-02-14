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
