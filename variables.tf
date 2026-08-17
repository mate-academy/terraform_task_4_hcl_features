variable "prefix" {
  type    = string
  default = "tfvmex"
}

variable "location" {
  type    = string
  default = "Denmark East"
}

variable "resource_group_name" {
  type    = string
  default = "mate-tf-task-4"
}

variable "vm_count" {
  description = "Number of VM instances to create"
  type        = number
  default     = 2
}

variable "vm_size" {
  type    = string
  default = "Standard_B1s"
}

variable "admin_username" {
  type    = string
  default = "testadmin"
}

variable "admin_password" {
  type      = string
  sensitive = true
}

variable "tags" {
  type = map(string)
  default = {
    environment = "dev"
    owner       = "mate-academy"
    project     = "terraform-task-4"
  }
}