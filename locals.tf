locals {
  networks_interfaces = ["nic_1", "nic_2", "nic_3"]
  security_rules = [
    {
      name                   = "rule_1"
      priority               = "100"
      direction              = "Inbound"
      access                 = "Allow"
      protocol               = "Tcp"
      source_port_range      = "*"
      destination_port_range = "22"
    },
    {
      name                   = "rule_2"
      priority               = "200"
      direction              = "Inbound"
      access                 = "Allow"
      protocol               = "Tcp"
      source_port_range      = "*"
      destination_port_range = "80"
    }
  ]
}
