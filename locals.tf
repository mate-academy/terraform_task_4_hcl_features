locals {
  security_rules = [
    {
      name                   = "allow-ssh"
      priority               = 100
      direction              = "Inbound"
      access                 = "Allow"
      protocol               = "Tcp"
      source_port_range      = "*"
      destination_port_range = "22"
    }
  ]

  network_interface_names = {
    web = "web"
    app = "app"
    db  = "db"
  }

  nic_assignment = {
    0 = "web"
    1 = "app"
  }
}