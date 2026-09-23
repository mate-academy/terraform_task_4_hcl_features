locals {
  network_interface_names = ["nic1", "nic2", "nic3"]

  security_rules = [
    {
      name                   = "ssh"
      priority               = 1000
      direction              = "Inbound"
      access                 = "Allow"
      protocol               = "Tcp"
      source_port_range      = "*"
      destination_port_range = "22"
    }
  ]
}

