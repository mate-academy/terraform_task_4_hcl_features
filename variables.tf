variable "prefix" {
  description = "Prefix for resource names"
  type        = string
  default     = "tfvmex"
}

variable "vm_count" {
  description = "Number of VMs to create"
  type        = number
  default     = 2
}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "West Europe"
}

variable "admin_username" {
  description = "Admin username for VMs"
  type        = string
  default     = "testadmin"
}

variable "admin_password" {
  description = "Admin password for VMs"
  type        = string
  sensitive   = true
}