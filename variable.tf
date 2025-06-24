variable "prefix" {
  default = "tfvmex"
}

variable "count_vm" {
  type    = number
  default = 3
}

variable "for_each_network_interface" {
  default = ["network1", "network2", "network3"]
}

variable "security_rules" {
  default = [
    {
      name                       = "test123"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "0.0.0.0/0"
      destination_address_prefix = "*"
    },

    {
      name                       = "test"
      priority                   = 110
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "443"
      source_address_prefix      = "0.0.0.0/0"
      destination_address_prefix = "*"
    }
  ]
}
