locals {
  nic_names = ["nic-1", "nic-2", "nic-3"]
  security_rules = [
    {
      name                       = "ssh"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      destination_port_range     = "22"
      source_port_range          = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    },

    {
      name                       = "nginx"
      priority                   = 110
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      destination_port_range     = "80"
      source_port_range          = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  ]
}

