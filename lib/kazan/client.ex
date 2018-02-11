defmodule Kazan.Client do
  @moduledoc """
  DEPRECATED: This module will become private API and/or removed in the
  future. Use the `Kazan` module instead.
  """
  @type run_result :: {:ok, struct} | {:error, term}

  @deprecated "Use Kazan.run/1 instead"
  defdelegate run(request), to: Kazan.Client.Imp

  @deprecated "Use Kazan.run/2 instead"
  defdelegate run(request, opts), to: Kazan.Client.Imp

  @deprecated "Use Kazan.run!/1 instead"
  defdelegate run!(request), to: Kazan.Client.Imp

  @deprecated "Use Kazan.run!/2 instead"
  defdelegate run!(request, opts), to: Kazan.Client.Imp
end
