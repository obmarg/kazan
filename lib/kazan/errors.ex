defmodule Kazan.RemoteError do
  @moduledoc """
  An exception that will be raised when we get an error from a Kube server.
  """
  defexception [:reason]

  def message(error) do
    "Server responded with #{inspect error.reason}"
  end
end

defmodule Kazan.BuildRequestError do
  @moduledoc """
  An exception that will be raised when we get an error from a Kube server.
  """
  defexception [:reason, :operation]

  def message(error) do
    "Error when building #{error.operation} request: #{error.reason}"
  end
end
