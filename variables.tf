variable "prefix" {
  type    = string
  default = "tfvmex"
}

variable "location" {
  type    = string
  default = "norwayeast"
}

variable "vm_size" {
  type    = string
  default = "Standard_DS1_v2"
}

variable "vm_count" {
  type    = number
  default = 1
}

variable "admin_username" {
  type    = string
  default = "testadmin"
}

variable "admin_password" {
  type        = string
  sensitive   = true
  description = "VM admin password (pass via env: TF_VAR_admin_password)"
}

variable "prevent_destroy" {
  type        = bool
  default     = false
  description = "Turn on to demonstrate lifecycle prevent_destroy"
}

variable "tags" {
  type = map(string)
  default = {
    environment = "staging"
    project     = "terraform-hcl-task"
  }
}
