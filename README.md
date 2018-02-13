# Kazan

Kazan is a Kubernetes API client for Elixir. It uses the OpenAPI specifications
provided by kube to generate most of it's functions and datastructures. This
allows the whole kube API to be supported with relatively little effort.

Kazan should mostly be functional, though it is still somewhat experimental and
untested. Parts of the API may not work, and the Kazan interface may be changed
at any time.

### Features

- Support for most Kubernetes API calls.
- Structs for most Kubernetes API structures.
- Documentation of all models & calls.
- Client certificate & token based authentication.
- Loading config from kubeconfig files.
- Support for watch requests.

### Not Implemented

- Other forms of authentication
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

Kazan uses the `Kazan.Server` struct to contain server & authentication
configuration details. `Kazan.Server` also provides some convenience functions
to create a `Kazan.Server` from external sources such as a kube config file, or
a kube service account.

If your application is only going to be talking to a single kubernetes cluster,
then it's recommended to configure that cluster in your mix config. This makes
working with kazan slightly easier, as you can call `Kazan.run` without
providing a server every time.

### In Cluster Authentication

If your code is going to be running on a kubernetes cluster and you wish to use
the kubernetes service account that can be configured like this:

```elixir
    config :kazan, :server, :in_cluster
```

Alternatively, the `Kazan.Server.in_cluster` function can be used to create a
server for passing straight into `Kazan.run`

### Configuration via kube config file.

If you have a kube config file that contains the cluster & auth details you wish to use, kazan can use that:

```elixir
    config :kazan, :server, {:kubeconfig, "path/to/file"}
```

Alternatively, the `Kazan.Server.from_kubeconfig` function can be used to create a
server for passing straight into `Kazan.run`

### Configuring server details directly

If you wish to configure the server details manually, kazan can also accept a map of server parameters:

```elixir
    config :kazan, :server, %{url: "kubernetes.default"}
```

See the `Kazan.Server` documentation to see what fields this supports.

## Usage

Making a request with Kazan is done in two stages.

1. Build the request object using one of the functions in `Kazan.Api.*`.
2. Run that request using `Kazan.run`.

For example, to get all of the pods from the server configured in the mix config:

```elixir
Kazan.Apis.CoreV1.list_pod_for_all_namespaces!
|> Kazan.Client.run!
# %Kazan.Models.V1.PodList{...}
```

Alternatively, you might want to specify the server to send the request to:

```elixir
server = Kazan.Server.in_cluster

Kazan.Apis.Core.V1.list_pod_for_all_namespaces!
|> Kazan.run!(server: server)
# %Kazan.Apis.Core.V1.PodList{...}
```

More details on building requests can be found in the documentation for
`Kazan.Apis`.

Details on creating watch requests can be found in the documentation for
`Kazan.Watcher`.
