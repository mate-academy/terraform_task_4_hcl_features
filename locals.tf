locals {
  nic_names = [
    "nic-0",
    "nic-1"
  ]
}

locals {
  security_rules = [
    {
      name                   = "SSH"
      priority               = 100
      direction              = "Inbound"
      access                 = "Allow"
      protocol               = "Tcp"
      source_port_range      = "*"
      destination_port_range = "22"
    },
    {
      name                   = "HTTP"
      priority               = 200
      direction              = "Inbound"
      access                 = "Allow"
      protocol               = "Tcp"
      source_port_range      = "*"
      destination_port_range = "80"
    }
  ]
}