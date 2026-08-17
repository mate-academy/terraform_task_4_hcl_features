variable "prefix" {
  default = "tfvmex"
}

variable "vm_count" {
  description = "Number of virtual machines to create"
  type        = number
  default     = 2
}

variable "admin_username" {
  type    = string
  default = "testadmin"
}

variable "admin_password" {
  type      = string
  default   = "Password1234!"
  sensitive = true
}