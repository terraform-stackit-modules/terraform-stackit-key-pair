resource "stackit_key_pair" "this" {
  count = var.create_key_pair ? 1 : 0

  name       = var.name
  public_key = var.public_key
  labels     = var.labels
}
