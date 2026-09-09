#####################################################################################
# Terraform module examples are meant to show an _example_ on how to use a module
# per use-case. The code below should not be copied directly but referenced in order
# to build your own root module that invokes this module.
#
# This example generates a throwaway RSA key with the `tls` provider so it is
# runnable with only `project_id`. In real usage, pass your own public key, e.g.
# `public_key = file("~/.ssh/id_ed25519.pub")`.
#####################################################################################

resource "tls_private_key" "this" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

module "key_pair" {
  source = "../.."

  name       = "example-key-pair"
  public_key = trimspace(tls_private_key.this.public_key_openssh)

  labels = {
    managed_by = "terraform"
    example    = "basic"
  }
}
