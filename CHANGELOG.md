# Changelog

All notable changes to this project will be documented in this file.

The format is roughly based on [Keep a
Changelog](http://keepachangelog.com/en/1.0.0/).

This project intends to inhere to [Semantic
Versioning](http://semver.org/spec/v2.0.0.html), but has not yet reached 1.0 so
all APIs might be changed.

## Unreleased - yyyy-mm-dd

### New Features

- Added an informational `server_info` field to Kazan.Server that can be used
  to check the names of the context, cluster & user that a Kazan.Server struct
  were initialised with.

### Bug Fixes

- We no longer require certificate-authority data for a server that's
  configured with `insecure-tls-verify: true` (#64)

## v0.11.0 - 2019-03-26

### New Features

- `Kazan.Server` now exposes `from_env/1` and `from_env!/0` functions for
  creating a `Kazan.Server` from application config. This should make it easier
  for users using GCP to continue to use application config.
- Added some new configuration options that allow users to provide their own
  OpenAPI spec files.   This should let users use kazan when they have
  k8s extensions installed.
- `Kazan.Server` now supports `username` and `password` fields in config files.
- HTTP Basic auth is now supported for authentication with [k3s](https://k3s.io).

### Bug Fixes

- Fix a crash in `Kazan.Watcher` if one of the destination processes crashes.

## v0.10.0 - 2018-10-17

### Breaking Changes

- Watch operations now return a `Watcher.Event` rather than a k8s WatchEvent
  struct.
- Watcher.Event has atoms for the type instead of strings.
- Added a new `gone` event type to watchers.  Processes listening for events
  should restart a watcher with a new rv when receiving one of these.
- Kazan.Request.create (which is used by most of the API request creation methods
  now returns `{:error, term}` rather than `{:err, term}`.  This was a bug fix
  as the typespec stated that they returned `{:error, term}`.

### New Features

- We now generate typespecs for all the generated functions &
  structs. This should allow dialyzer users to validate their code
  and improves the documentation.

### Bug Fixes

- Fixed an issue where watchers would crash repeatedly if the underlying k8s
  watch rv became invalid somehow. (#45)

## v0.9.0 - 2018-08-28

### New Features

- Kazan now supports talking to GKE via auth-provider config in kubeconfig.
  (Thanks @smn)
- Pulled in the kube specifications from v1.11.2. This means that
  Kazan should support any new features from kubernetes 1.10 & 1.11

### Bug Fixes

- `Kazan.Watcher` now monitors it's consumer and shuts down if the consumer
  dies. (#46)

## v0.8.0 - 2018-04-10

### Breaking Changes

- Kazan now depends on YamlElixir 2.0.  This isn't a breaking change for users
  of Kazan, but may be a breaking change if you use YamlElixir directly.
  However, the upgrade process should be reasonably easy - the read_from_x
  functions have just been renamed to read_from_x!

## v0.7.0 - 2018-04-04

### Changes

- `Kazan.run` now pattern matches on argument types, so if a user accidentally
  passes a `{:ok, request}` to it, they'll get a better error message.
- `Kazan.Watcher` no longer logs debug info by default.  This is now controlled
  with a `debug` option that defaults to false.
- Pulled in the k8s 1.9.6 specifications.
- Support HTTPoison 1.0 as well as 0.x

### Bug Fixes

- Handle the breaking change to `YamlElixir.read_from_file` in YamlElixir 1.4.0
- Token & certificate auth details can now be supplied in the mix config.

## v0.6.0 - 2018-02-19

### Breaking Changes

- The module names of most APIs & many models has been changed.
  - APIs module names have changed slightly to have a dot between the group name
    and the version. For example: `Kazan.Apis.CoreV1` is now `Kazan.Apis.Core.V1`.
  - Models that are associated with an API now live inside that APIs module,
    rather than under `Kazan.Models`.  For example `Kazan.Models.Api.V1.Container`
    now lives under `Kazan.Apis.Core.V1.Container`
  - Models that are not associated with specific APIs (e.g. Apimachinery models)
    still live under `Kazan.Models`. However, the capitalization of modules may
    have changed. For example `ApiMachinery` is now `Apimachinery`. This is
    mostly for consistencies sake - most module names only have the first letter
    capitalized, so `Apimachinery` etc. should be no different.
  - Some underlying changes in the names of models in the k8s spec may also have
    caused things to move around.
- It wasn't public API, but `Kazan.Codegen.Models.property_name/1` has been
  removed.

### New Features

- Updated Kubernetes specs to 1.8 (Thanks @chazsconi).
- Kazan can now load server details from kubeconfig provided in Mix configuration.
- Kazan can now be configured to use in cluster authentication from the Mix
  configuration.
- We now support watch requests with `Kazan.Watcher`.  (Thanks @chazsconi)

### Changes

- Switched CHANGELOG to use a format based on Keep a Changelog.
- Better documentation around how to authenticate with kubernetes.
- Changed the way "unknown" models are deserialized from k8s. We now try to
  match the `apiVersion` and `kind` fields with the data provided in the
  `x-kubernetes-group-version-kind` field in the OAI spec. If we're attempting
  to deserialize a model that doesn't hae this present in the spec, things may
  go wrong.
- Improved the documentation of API modules.

### Deprecations

- `Kazan.Models.oai_name_to_module` still supports the older OAI name format,
  but this is now deprecated and will be removed in a future version.
- `Kazan.Client` has been deprecated in favor of exposing these functions in
  `Kazan`.  See #23 for the justification.

### Bug Fixes

- API functions that take no arguments will no longer raise
  `Protocol.UndefinedError`.
- `read_namespaced_pod_log` and other calls that return plain text will now
  return that text, rather than attempting & failing to decode JSON. (thanks
  @chazsconi)
- In cluster authentication using `Kazan.Server.in_cluster` should now work
  properly.  It now reads the correct ca.crt file, and gets server details from
  environment variables, similar to the Go client.  (Thanks @mayppong)
- Non-bang versions of API function calls will no longer crash if parameters
  are missing, or another validation error occurs.

## v0.5.1 - 2018-01-17

### Bug Fixes

- Kazan now compiles on Elixir 1.6+
- Fixed a compiler warning.

## v0.5.0 - 2018-01-17

### New Features

- Adds support for Kubernetes 1.7 (Thanks @jeremytregunna and @thoughtmanifest)
- Adds a script for kazan developers to use for downloading new kubernetes open
  API specs.

## v0.4.0 - 2018-01-17

### Breaking Changes

- Support Kubernetes 1.6. This is a breaking change as many of the paths to
  model modules have changed.
- Dropped Elixir 1.3 support.
- Make Kazan.Models.model_descs private.  This is potentially a breaking change.

### New Features

- Support for token authentication & skipping TLS verification. (Thanks
  @izaakschroeder)
- In cluster service account authentication (Thanks @izaakschroeder)
- Functions to map from OpenAPI model name or operation ID into modules or
  functions. These are intended to be used for developers exploring the API in
  the REPL.

### Changes

- OpenAPI operation & definition IDs are now documented in the exdocs.
- No compiler warnings on Elixir 1.5
- Absolute paths in kubeconfig will now be interpreted as such. Previously they
  would be assumed as relative to the kubeconfig file.

### Bug Fixes

- Various functions will no longer leak atoms if called with the names of models
  or APIs that don't exist.

## v0.3.0 - 2017-02-03

- Relax some requirements dependencies.
- Add content-type & accepts headers into requests.
- Strip nil values from maps before sending to Kube
- Added some limited patching support
- Decode JSON in error responses.
- Fixed compiler warnings in Elixir 1.4

## v0.2.0 - 2017-01-04

- Improved documentation around model properties. Types of each of the
  properties should all be documented now.
- Tests are now run on travis.
- Can now load configuration from kubeconfig files.
- Added support for self signed HTTPs w/ ca_certificate validation.
- Added support for client certificate based auth.
- Added basic integration tests.

## v0.1.1 - 2016-12-31

- Fixed issue where hex.pm package was missing kube_specs dir

## v0.1.0 - 2016-12-31

- Initial release.
