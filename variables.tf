variable "prefix" {
  description = "Prefix for resource name"
  type        = string
  default     = "tfvmex"
}

variable "vm_count" {
  description = "Number of vm to create"
  type        = number
  default     = 2
}

variable "location" {
  description = "Location for resources"
  type        = string
  default     = "West Europe"
}

variable "admin_password" {
  description = "Admin password to VM"
  type        = string
  sensitive   = true
}