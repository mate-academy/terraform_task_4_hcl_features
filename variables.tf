variable "prefix" {
  type    = string
  default = "tfvmex"
}

variable "location" {
  type    = string
  default = "West Europe"
}

variable "vm_count" {
  type    = number
  default = 3
}

variable "admin_username" {
  type    = string
  default = "azureuser"
}

variable "ssh_public_key" {
  type        = string
  description = "SSH public key content (e.g. starts with ssh-rsa or ssh-ed25519)"
}
