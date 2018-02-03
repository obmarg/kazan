# Changelog

All notable changes to this project will be documented in this file.

The format is roughly based on [Keep a
Changelog](http://keepachangelog.com/en/1.0.0/).

This project intends to inhere to [Semantic
Versioning](http://semver.org/spec/v2.0.0.html), but has not yet reached 1.0 so
all APIs might be changed.

## Unreleased - yyyy-mm-dd

### Breaking Changes

- The k8s 1.8 specs changed the OAI names of most of the models in the API. As a
  result, most of the models under `Kazan.Models` have changed location.

### New Features

- Updated Kubernetes specs to 1.8 (Thanks @chazsconi).
- Kazan can now load server details from kubeconfig provided in Mix configuration.
- Kazan can now be configured to use in cluster authentication from the Mix
  configuration.

### Changes

- Switched CHANGELOG to use a format based on Keep a Changelog.

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

