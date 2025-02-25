variable "prefix" {
  default = "tfvmex"
}

variable "vm_count" {
  default = 3
}

variable "network_interface_names" {
  default = ["nic1", "nic2", "nic3"]
}

variable "network_security_rules" {
  default = [
    {
      name                       = "allow_http"
      priority                   = 1000
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    },
    {
      name                       = "allow_https"
      priority                   = 1001
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "443"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  ]
}
