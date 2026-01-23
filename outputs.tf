output "filename" {
  value       = local_file.this.filename
  description = "Full path of the file that would be created on apply."
}

output "content_sha256" {
  value       = sha256(var.content)
  description = "SHA256 of the content."
}

output "content_length" {
  value       = length(var.content)
  description = "Length of the content string."
}
