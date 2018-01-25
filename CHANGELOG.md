### v0.5.1 (25/01/17)

- Kazan now compiles on Elixir 1.6+
- Fixed a compiler warning.

### v0.5.0 (17/01/17)

- Adds support for Kubernetes 1.7
- Adds a script for kazan developers to use for downloading new kubernetes open
  API specs.

### v0.4.0 (17/01/17)

#### Breaking Changes

- Support Kubernetes 1.6. This is a breaking change as many of the paths to
  model modules have changed.
- Dropped Elixir 1.3 support.
- Make Kazan.Models.model_descs private.  This is potentially a breaking change.

#### New Features.

- Support for token authentication & skipping TLS verification. (Thanks @izaakschroeder)
- In cluster service account authentication (Thanks @izaakschroeder)
- Functions to map from OpenAPI model name or operation ID into modules or
  functions. These are intended to be used for developers exploring the API in
  the REPL.

#### Improvements

- OpenAPI operation & definition IDs are now documented in the exdocs.
- No compiler warnings on Elixir 1.5
- Absolute paths in kubeconfig will now be interpreted as such. Previously they
  would be assumed as relative to the kubeconfig file.

#### Bug Fixes

- Various functions will no longer leak atoms if called with the names of models
  or APIs that don't exist.

### v0.3.0 (03/02/17)

- Relax some requirements dependencies.
- Add content-type & accepts headers into requests.
- Strip nil values from maps before sending to Kube
- Added some limited patching support
- Decode JSON in error responses.
- Fixed compiler warnings in Elixir 1.4

### v0.2.0 (04/01/17)

- Improved documentation around model properties. Types of each of the
  properties should all be documented now.
- Tests are now run on travis.
- Can now load configuration from kubeconfig files.
- Added support for self signed HTTPs w/ ca_certificate validation.
- Added support for client certificate based auth.
- Added basic integration tests.

### v0.1.1 (31/12/16)

- Fixed issue where hex.pm package was missing kube_specs dir

### v0.1.0 (31/12/16)

- Initial release.

