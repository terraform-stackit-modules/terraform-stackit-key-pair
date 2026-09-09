output "name" {
  description = "The name of the key pair created by the example."
  value       = module.key_pair.name
}

output "fingerprint" {
  description = "The fingerprint of the key pair created by the example."
  value       = module.key_pair.fingerprint
}
