terraform {
  # IMPORTANT:
  # This keeps us compatible with both.
  required_version = ">= 1.5.0, < 2.0.0"

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

resource "local_file" "this" {
  filename = "${path.module}/${var.filename}"
  content  = var.content
}
