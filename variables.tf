variable "prefix" {
  default = "tfvmex"
}

variable "nic_names" {
  default = {
    vm1 = "nic1"
    vm2 = "nic2"
    vm3 = "nic3"
  }
}

variable "security_rules" {
  description = "List of security rules for Network Security Group"

  type = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
}