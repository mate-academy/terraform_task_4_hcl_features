locals {
  common_tags = {
    project = "hcl-demo"
    owner   = "vitaliy"
    env     = "lab"
  }

  # Імена NIC (for_each приклад)
  nic_names = ["nic-a", "nic-b"]

  # Динамічні NSG-правила (dynamic block приклад)
  nsg_rules = [
    {
      name                       = "Allow-SSH"
      priority                   = 1000
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    },
    {
      name                       = "Allow-HTTP"
      priority                   = 1010
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  ]
}
