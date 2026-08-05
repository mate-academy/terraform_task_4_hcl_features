locals {
  nic_names = [
    "${var.prefix}-nic-0",
    "${var.prefix}-nic-1"
  ]

  security_rules = [
    {
      name                   = "Allow-SSH"
      priority               = 100
      direction              = "Inbound"
      access                 = "Allow"
      protocol               = "Tcp"
      source_port_range      = "*"
      destination_port_range = "22"
    },
    {
      name                   = "Allow-HTTP"
      priority               = 200
      direction              = "Inbound"
      access                 = "Allow"
      protocol               = "Tcp"
      source_port_range      = "*"
      destination_port_range = "80"
    }
  ]

  common_tags = {
    environment = "staging"
    project     = "demo-infrastructure"
    managed_by  = "terraform"
  }
}