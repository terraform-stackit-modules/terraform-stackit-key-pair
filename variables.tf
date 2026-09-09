variable "create_key_pair" {
  description = "Whether to create the key pair. Set to false to disable the resource in this module."
  type        = bool
  default     = true
}

variable "name" {
  description = "The name of the SSH key pair."
  type        = string
}

variable "public_key" {
  description = "A string representation of the public SSH key, e.g. `ssh-rsa <key_data>` or `ssh-ed25519 <key_data>`."
  type        = string

  validation {
    # Permissive on purpose: catch obvious mistakes (missing prefix, or a pasted
    # PRIVATE key) while letting the STACKIT API be the final authority on which
    # key types it accepts. STACKIT documents ssh-rsa and ssh-ed25519; other
    # OpenSSH types (ecdsa-*, sk-*) are allowed through rather than pre-rejected.
    condition     = can(regex("^(ssh-|ecdsa-|sk-)", var.public_key))
    error_message = "public_key must be an OpenSSH PUBLIC key (e.g. ssh-rsa, ssh-ed25519, ecdsa-sha2-*, or sk-*). Never pass a private key."
  }
}

variable "labels" {
  description = "Key-value string pairs to attach to the key pair."
  type        = map(string)
  default     = {}
}
