# variables.tf
variable "prefix" {
  description = "Prefix for resource names"
  type        = string
  default     = "tfvmex"
}

variable "location" {
  description = "Location for Azure resources"
  type        = string
  default     = "West Europe"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "tfvmex-resources"
}
