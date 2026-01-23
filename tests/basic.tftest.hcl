variables {
  filename = "demo.txt"
  content  = "Hello from env0 Module Registry MVP"
}

run "plan_smoke" {
  command = plan

  assert {
    condition     = local_file.this.content == var.content
    error_message = "local_file content does not match the input content."
  }

  assert {
    condition     = endswith(local_file.this.filename, var.filename)
    error_message = "Expected filename to end with '${var.filename}', got '${local_file.this.filename}'."
  }

  assert {
    condition     = output.content_sha256 == sha256(var.content)
    error_message = "Output SHA256 did not match sha256(var.content)."
  }
}

run "validation_negative_filename" {
  command = plan

  variables {
    filename = ""
  }

  expect_failures = [
    var.filename,
  ]
}
