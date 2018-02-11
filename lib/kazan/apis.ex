defmodule Kazan.Apis do
  @moduledoc """
  Contains generated API modules as defined in the OAI specs.

  This module contains many sub-modules, one corresponding to each API group
  present in the OpenAPI specification for Kubernetes.

  Each of these modules will contain submodules that repreesent the different
  versions of the API group. Within those submodules will be functions that can
  be called to generate `Kazan.Request` structures that can be fed into
  `Kazan.run`. The version submodules will also contain any structs that can be
  sent & received by that particular version of the API group.

  Each request functions arguments are generated so that any HTTP body parameter
  is first, followed by any path parameters in path order, followed by any
  required query parameters. Optional query parameters should go in the optional
  final keyword argument.
  """

  require Kazan.Codegen.Apis
  alias Kazan.Codegen

  Codegen.Apis.from_spec("kube_specs/swagger.json")

  @doc """
  Maps OpenAPI spec operation IDs into functions that implement that operation.

  Takes the ID of an operation in the OpenAPI spec, and returns the functions
  that implement that operation as a list of {module, function} tuples.

  Returns an empty list if no matching operation was found.
  """
  def oai_id_to_functions(oai_operation_id) do
    operation_descs()
    |> Enum.find(fn op -> op.operation_id == oai_operation_id end)
    |> case do
         nil -> []
         operation ->
           bang_function_name = String.to_existing_atom(
             Atom.to_string(operation.function_name) <> "!"
           )

           [{operation.api_module, operation.function_name},
            {operation.api_module, bang_function_name}]
       end
  end
end
