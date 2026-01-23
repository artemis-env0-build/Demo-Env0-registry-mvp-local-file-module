variable "filename" {
  type        = string
  description = "Filename relative to the module directory."

  validation {
    condition     = length(trimspace(var.filename)) > 0
    error_message = "filename must be a non-empty string."
  }

  validation {
    condition     = !contains(var.filename, "..")
    error_message = "filename must not contain '..' (path traversal)."
  }
}

variable "content" {
  type        = string
  description = "File contents."

  validation {
    condition     = length(var.content) > 0
    error_message = "content must be non-empty."
  }
}
