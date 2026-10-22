locals {
  network_interface_names = ["network_interface_1", "network_interface_2"]
  security_rules = [{
    name                       = "sr1"
    priority                   = 1000
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "9090"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    },
    {
      name                       = "sr2"
      priority                   = 1001
      direction                  = "Outbound"
      access                     = "Deny"
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "8080"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
  }]
}