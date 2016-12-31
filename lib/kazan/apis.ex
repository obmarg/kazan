defmodule Kazan.Apis do
  @moduledoc """
  Contains generated API modules as defined in the OAI specs.

  This module contains many sub-modules, one corresponding to each API group
  present in the OpenAPI specification for Kubernetes.

  Each of these modules will contain functions that can be called to generate
  Kazan.Request structures that can be fed into Kazan.Client.

  The functions arguments are generated so that any HTTP body parameter is
  first, followed by any path parameters in path order, followed by any required
  query parameters. Optional query parameters should go in the optional final
  keyword argument.
  """
  require Kazan.Codegen.Apis
  alias Kazan.Codegen

  Codegen.Apis.from_spec("kube_specs/swagger.json")
end
