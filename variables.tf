variable "prefix" {
  description = "Prefix used for all Azure resources."
  type        = string
  default     = "tfvmex"
}

variable "location" {
  description = "Azure region for all resources."
  type        = string
  default     = "West Europe"
}
