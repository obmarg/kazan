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

