# artemis-registry-mvp-local-file (env0 Module Registry MVP)

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
