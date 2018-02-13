defmodule Kazan do
  @moduledoc """
  Kazan is a Kubernetes API client for Elixir.

  ### Module Overview

  - `Kazan.Apis` contains modules for building requests to send to the kube API.
    - `Kazan.Apis.*` modules represent one of the "groups" of API functionality
      exposed by k8s. The root of these modules usually contain functions for
      checking the capabilities of a k8s server.
    - `Kazan.Apis.*.*` modules represent a particular version of an API. These
      modules expose functions that can be called to build requests to send to
      the k8s API.
    - `Kazan.Apis.*.*.*` modules contain some struct definitions that can be
      used to build requests and can be received in responses from the API.
  - `Kazan.Models` contains other structs that can be sent and received by k8s,
    but are not specifically tied to any one API group.
  - `Kazan.run` is responsible for actually sending those requests.
  - `Kazan.Watcher` is responsible for watching for changes to kube resources.

  See the [README](readme.html) for example usage.
  """

  @doc """
  Makes a request against a kube server.

  The server must be set in the kazan config.
  """
  defdelegate run(request), to: Kazan.Client.Imp

  @doc """
  Makes a request against a kube server.

  The server should be set in the kazan config or provided in the options.

  ### Options

  * `server` - A `Kazan.Server` struct that defines which server we should send
  this request to. This will override any server provided in the Application
  config.
  """
  defdelegate run(request, opts), to: Kazan.Client.Imp

  @doc """
  Like `run/2`, but raises on Error.  See `run/2` for more details.
  """
  @spec run!(Request.t, Keyword.t) :: struct | no_return
  defdelegate run!(request, opts), to: Kazan.Client.Imp

  @doc """
  Like `run/1`, but raises on Error.  See `run/1` for more details.
  """
  @spec run!(Request.t) :: struct | no_return
  defdelegate run!(request), to: Kazan.Client.Imp
end
