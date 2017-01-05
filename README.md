# Kazan

Kazan is a Kubernetes API client for Elixir. It uses the OpenAPI specifications
provided by elixir to generate most of it's functions and datastructures. This
allows the whole kube API to be supported with relatively little effort.

Kazan should mostly be functional, though it is still somewhat experimental and
untested. Parts of the API may not work, and the Kazan interface may be changed
at any time.

### Features

- Support for most Kubernetes API calls.
- Structs for most Kubernetes API structures.
- Documentation of all models & calls.
- Client certificate autentation.
- Loading config from kubeconfig files.

### Not Implemented

- Support for watch requests.
- Non-certificate based authentication.
- Patching with `application/json-patch+json` or
  `application/strategic-merge-patch+json` content types.
- Removing fields when patching with `application/merge-patch+json`.
- Comprehensive tests.
- Validation of requests.
- Typespecs for functions or structs.
- Probably some other things.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `kazan` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:kazan, "~> 0.1"}]
    end
    ```

  2. Ensure `kazan` is started before your application:

    ```elixir
    def application do
      [applications: [:kazan]]
    end
    ```

## Configuration

Assuming you're only intendeding to communicate with a single Kubernetes server,
it's recommended to configure this server in your `config.exs`:

    config :kazan, :server, %{url: "kubernetes.default"}

## Usage

Making a request with Kazan is done in two stages.

1. Build the request object using one of the functions in `Kazan.Api.*`.
2. Run that request using `Kazan.Client`.

For example, to get all of the pods from a server:

```elixir
Kazan.Apis.CoreV1.list_pod_for_all_namespaces!
|> Kazan.Client.run!
# %Kazan.Models.V1.PodList{...}
```

More details on building requests can be found in the documentation for
`Kazan.Apis`.

All the models reutrned by the application can be found under `Kazan.Models`
