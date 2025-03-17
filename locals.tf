locals {
  network_interface_names = ["nic1", "nic2", "nic3"]
  security_rules = [
    {
      name                   = "Deny_All"
      priority               = 1000
      direction              = "Inbound"
      access                 = "Deny"
      protocol               = "Tcp"
      source_port_range      = "*"
      destination_port_range = ["1-65535"]
    },
    {
      name                   = "Allow_HTTP_HTTPS"
      priority               = 900
      direction              = "Inbound"
      access                 = "Allow"
      protocol               = "Tcp"
      source_port_range      = "*"
      destination_port_range = ["80", "8008", "8080", "443"]
    },
    {
      name                   = "Allow_SSH"
      priority               = 800
      direction              = "Inbound"
      access                 = "Allow"
      protocol               = "Tcp"
      source_port_range      = "*"
      destination_port_range = "22"
    }
  ]

  security_rules_map = {
    for idx, rule in local.security_rules : rule.name => rule
  }
}
