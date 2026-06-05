variable "prefix" {
  default = "tfvmex"
}

variable "vm_count" {
  default = 2
}

variable "admin_username" {
  default = "testadmin"
}

variable "admin_password" {
  default   = "Password1234!"
  sensitive = true
}
