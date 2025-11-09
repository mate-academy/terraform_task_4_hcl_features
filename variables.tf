variable "resource_group_name" {
  type        = string
  description = "Name of RG"
  default     = "rg-hcl-demo"
}

variable "location" {
  type        = string
  description = "Azure region"
  default     = "westeurope"
}

variable "vm_count" {
  type        = number
  description = "How many VMs to create"
  default     = 2
}

variable "vm_admin_username" {
  type        = string
  description = "Admin username for the VMs"
  default     = "azureuser"
}

variable "ssh_public_key" {
  type        = string
  description = "SSH public key content for VM login"
  default     = ""
}

# За потреби можеш використовувати і ці (якщо не хочеш use_cli):
variable "subscription_id" {
  type        = string
  description = "Subscription ID (optional if use_cli=true)"
  default     = ""
}
variable "tenant_id" {
  type        = string
  description = "Tenant ID (optional if use_cli=true)"
  default     = ""
}
