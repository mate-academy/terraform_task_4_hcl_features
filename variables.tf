variable "prefix" {
  description = "Prefix used for naming Azure resources"
  type        = string
  default     = "tfvmex"
}

variable "location" {
  description = "Azure region for all resources"
  type        = string
  default     = "West Europe"
}

variable "vm_count" {
  description = "Number of virtual machines to create"
  type        = number
  default     = 2
}
