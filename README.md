<h3 align="left">
  <img width="600" height="128" alt="image" src="https://raw.githubusercontent.com/artemis-env0/Packages/refs/heads/main/Images/Logo%20Pack/01%20Main%20Logo/Digital/SVG/envzero_logomark_fullcolor_rgb.svg" />
</h3>

Env0 (EnvZero) Module Registry Demo

````
version = 'v1.0.0'
````
````
Tag = 'mvp/v1.0.0'
````

**env0 Module Registry MVP · Safe, Plan-Only Demo Module**

<p align="left">
  <img alt="Terraform" src="https://img.shields.io/badge/Terraform-%3E%3D1.5-blueviolet" />
  <img alt="OpenTofu" src="https://img.shields.io/badge/OpenTofu-%3E%3D1.5-2ea44f" />
  <img alt="Provider" src="https://img.shields.io/badge/Provider-hashicorp%2Flocal-informational" />
  <img alt="Env0" src="https://img.shields.io/badge/env0-Module%20Registry-0b7285" />
</p>

> **Purpose:** Prove out env0 Module Registry end-to-end with **no cloud credentials** and **no real apply required**.  
> **Registry Testing:** Works with env0’s module registry test runner (OpenTofu).  
> **Safe:** Uses `hashicorp/local` only.

## Table of Contents
- [What this module does](#what-this-module-does)
- [Quickstart (env0 consumer repo)](#quickstart-env0-consumer-repo)
- [How versioning works in env0 registry](#how-versioning-works-in-env0-registry)
- [Module usage examples](#module-usage-examples)
- [Version & resources matrix](#version--resources-matrix)
- [Inputs](#inputs)
- [Outputs](#outputs)
- [Testing](#testing)
- [Troubleshooting](#troubleshooting)

---

## What this module does
This module creates a local file during apply using the Local provider:

- `local_file.this` writes a file to disk
- For env0 demos, you can run plan-only to prove module fetch + evaluation  
- Outputs help you demonstrate the module executed and returned results

---

## Quickstart (env0 consumer repo)

### 1) Add this module to your consumer environment repo (Repo B)
Paste this into your consumer `main.tf`:

```hcl
module "mvp_local_file" {
  # env0 Module Registry source address format:
  # api.env0.com/<ORG_ID>/<MODULE_NAME>/<PROVIDER>
  source  = "api.env0.com/bde19c6d-d0dc-4b11-a951-8f43fe49db92/artemis-registry-mvp-local-file/local"

  # Use a version that exists in env0 Registry (derived from Git tags in the module repo)
  version = "1.0.1"

  filename = "artifacts/env0-demo.txt"
  content  = "Hello from env0 Module Registry!"
}
```

### 2) Run plan-only in env0
In your env0 Environment:
- Ensure Terraform Version is set to a supported version (your org uses 1.5.x).
- Run Deploy / Plan to confirm:
  - env0 fetches the module version from the private registry
  - Terraform init succeeds
  - module outputs appear after plan

> Tip: If you’re demoing safely, keep the environment plan-only and avoid auto-apply.

---

## How versioning works in env0 registry

env0 registry versions come from SemVer Git tags in the module repo:

Valid examples (Tag Prefix blank):
- `1.0.0`
- `1.0.1`

Invalid examples (will not become registry versions):
- `v1.0.0`
- `mvp/1.0.0` (unless Tag Prefix is set to `mvp` in module settings)

### Create & push a new version tag
From the module repo (Repo A):

```bash
git tag -a "1.0.1" -m "Release 1.0.1"
git push origin "1.0.1"
```

Then confirm in env0:
- Registry → Modules → artemis-registry-mvp-local-file → Version dropdown

---

## Module usage examples

### Example: Basic usage
```hcl
module "mvp_local_file" {
  source  = "api.env0.com/bde19c6d-d0dc-4b11-a951-8f43fe49db92/artemis-registry-mvp-local-file/local"
  version = "1.0.1"

  filename = "artifacts/hello.txt"
  content  = "Hello!"
}
```

### Example: Parameterized via variables
```hcl
module "mvp_local_file" {
  source  = "api.env0.com/bde19c6d-d0dc-4b11-a951-8f43fe49db92/artemis-registry-mvp-local-file/local"
  version = "1.0.1"

  filename = var.filename
  content  = var.content
}
```

```hcl
variable "filename" { type = string }
variable "content"  { type = string }
```

---

## Version & resources matrix

### Supported runtimes
| Runtime | Supported | Notes |
|---|---:|---|
| Terraform |  `>= 1.5.0, < 2.0.0` | Compatible with env0 Terraform 1.5.x |
| OpenTofu |  `>= 1.5.0, < 2.0.0` | Compatible with env0 Registry tests (OpenTofu 1.11.x) |

### Dependencies
| Category | Name | Version | Link |
|---|---|---:|---|
| Provider | `hashicorp/local` | `~> 2.5` | https://registry.terraform.io/providers/hashicorp/local |
| Resource | `local_file` | n/a | https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file |

### Release matrix (sample - keep updated as you tag)
| Version | Status | Notes | Commit / Tag |
|---:|---|---|---|
| `1.0.1` |  Recommended | Supports Terraform 1.5.x + OpenTofu tests | `1.0.1` |
| `1.0.0` |  Initial | First registry MVP | `1.0.0` |

---

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> terraform | `>= 1.5.0, < 2.0.0` |
| <a name="requirement_local"></a> local | `~> 2.5` |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_local"></a> local | `~> 2.5` |

## Resources

| Name | Type |
|------|------|
| <a name="resource_local_file"></a> [local_file.this](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |

---

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_filename"></a> `filename` | Filename relative to module directory | `string` | n/a | 
| <a name="input_content"></a> `content` | File contents | `string` | n/a | 

---

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_filename"></a> `filename` | Full path of the file that would be created |
| <a name="output_content_sha256"></a> `content_sha256` | SHA256 hash of `content` |
| <a name="output_content_length"></a> `content_length` | Length of `content` |

---

## Testing

env0 registry testing uses OpenTofu test files under:

- `tests/*.tftest.hcl`

Run locally (optional):
```bash
tofu test
```

> For demo safety, tests use `command = plan` so no apply is required.

---

## Troubleshooting

### README not showing in env0 Module Registry
- Ensure the file is named `README.md` (case-sensitive)
- Ensure it exists in the tagged version you are viewing in the registry

### `401 Unauthorized` when fetching module versions
- In env0 deployments, you typically do not need to set `TF_TOKEN_api_env0_com`
- Remove any manually-set token if it causes auth override issues

### “Module has no versions”
- Confirm you pushed a SemVer tag like `1.0.1`
- If Tag Prefix is set, ensure the tag matches the prefix format

---

## Links
- env0 Module Registry: https://app.env0.com/registry/modules  
- Local provider docs: https://registry.terraform.io/providers/hashicorp/local/latest/docs
