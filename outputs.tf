output "name" {
  description = "The name of the created key pair (null when create_key_pair is false)."
  value       = var.create_key_pair ? stackit_key_pair.this[0].name : null
}

output "id" {
  description = "Terraform's internal resource ID of the key pair (equals its name; null when create_key_pair is false)."
  value       = var.create_key_pair ? stackit_key_pair.this[0].id : null
}

output "fingerprint" {
  description = "The fingerprint of the public SSH key (null when create_key_pair is false)."
  value       = var.create_key_pair ? stackit_key_pair.this[0].fingerprint : null
}

output "labels" {
  description = "Labels attached to the created key pair (null when create_key_pair is false)."
  value       = var.create_key_pair ? stackit_key_pair.this[0].labels : null
}
