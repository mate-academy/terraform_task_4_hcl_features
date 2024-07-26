variable "prefix" {
  default     = "tfvmex-hcl"
  type        = string
  description = "Variable for prefix on resource group"
}

variable "admin_password" {
  description = "Admin password for the virtual machines"
  type        = string
  sensitive   = true
}
