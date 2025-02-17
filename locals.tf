locals {
  network_security_rules = [
    {
      name                   = "block_dns"
      priority               = 100
      direction              = "Inbound"
      access                 = "Deny"
      protocol               = "Udp"
      source_port_range      = 53
      destination_port_range = 53
    }
  ]
}
