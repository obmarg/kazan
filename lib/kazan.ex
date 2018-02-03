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
  - `Kazan.Client` is responsible for actually sending those requests.

  See the [README](readme.html) for example usage.
  """
end
