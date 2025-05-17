variable "prefix" {
  default = "tfvmex"
}

variable "resource_group_name" {
  default = "resources"
}

variable "location" {
  default = "West Europe"
}

variable "vm_count" {
  default = 2
}

variable "azurerm_subnet" {
  default = "internal"
}

variable "azurerm_network_security_group" {
  default = "konstantinou77TestSecurityGroup"
}