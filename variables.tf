variable "prefix" {
  description = "Prefix for resource names"
  type        = string
  default     = "tfvmex"
}

variable "vm_count" {
  description = "Number of VMs to create"
  type        = number
  default     = 2

  validation {
    condition     = var.vm_count >= 1
    error_message = "VM count must be at least 1."
  }
}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "westeurope"
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
  # No default - must be provided via tfvars or environment variable
}
