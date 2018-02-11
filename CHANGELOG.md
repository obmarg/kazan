# Changelog

All notable changes to this project will be documented in this file.

The format is roughly based on [Keep a
Changelog](http://keepachangelog.com/en/1.0.0/).

This project intends to inhere to [Semantic
Versioning](http://semver.org/spec/v2.0.0.html), but has not yet reached 1.0 so
all APIs might be changed.

## Unreleased - yyyy-mm-dd

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

