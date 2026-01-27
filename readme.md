<h3 align="left">
  <img width="600" height="128" alt="image" src="https://raw.githubusercontent.com/artemis-env0/Packages/refs/heads/main/Images/Logo%20Pack/01%20Main%20Logo/Digital/SVG/envzero_logomark_fullcolor_rgb.svg" />
</h3>

----

Env0 (EnvZero) Module Registry Demo

````
version = 'v1.0.0'
````
---

````
Tag = 'mvp/v1.0.0'
````
---
````
repo = 'artemis-registry-mvp-local-file'
````
---

# Env0 Module Registry MVP

This module is intentionally safe for demos:
- Uses only the `hashicorp/local` provider (no cloud credentials).
- env0 module registry testing runs `tofu test` against `tests/*.tftest.hcl`.
- Tests run with `command = plan` so nothing is applied.

## Inputs
- filename (string): file name (relative to module folder)
- content (string): file content

## Outputs
- filename
- content_sha256
- content_length
