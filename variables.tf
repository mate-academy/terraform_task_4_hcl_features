variable "prefix" {
  description = "Prefix for the resources created by this example."
  type        = string
  default     = "tfhcl"
}

variable "location" {
  description = "Azure region for the virtual machines and their network."
  type        = string
  default     = "Sweden Central"
}

variable "vm_size" {
  description = "Size of each Azure virtual machine."
  type        = string
  default     = "Standard_B2ts_v2"
}

variable "ssh_public_key" {
  description = "OpenSSH RSA public key of at least 2048 bits for the VM administrator."
  type        = string
}
