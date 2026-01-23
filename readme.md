# env0 Module Registry MVP - Local File Module

This module is intentionally "safe" for demos:
- It uses only the `hashicorp/local` provider (no cloud credentials).
- The module tests run `tofu test` with `command = plan` so nothing is applied.

## Inputs
- filename (string): file name (relative to module folder)
- content (string): file content

## Outputs
- filename
- content_sha256
- content_length
