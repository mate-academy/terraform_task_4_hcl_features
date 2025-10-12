variable "prefix" {
  default = "tfvmex"
}

variable "vm_count" {
  description = "Number of VMs to create"
  default     = 2
}

variable "location" {
  default = "West Europe"
}

variable "admin_username" {
  default = "testadmin"
}

variable "admin_password" {
  default = "Password1234!"
}