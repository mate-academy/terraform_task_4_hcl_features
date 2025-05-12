locals {

  nic_names = [
    for i in range(var.vm_count) : "${var.prefix}-nic-${i}"
  ]


  security_rules = [
    {
      name                   = "Allow-HTTP"
      priority               = 100
      direction              = "Inbound"
      access                 = "Allow"
      protocol               = "Tcp"
      source_port_range      = "*"
      destination_port_range = "80"
    },
    {
      name                   = "Allow-SSH"
      priority               = 200
      direction              = "Inbound"
      access                 = "Allow"
      protocol               = "Tcp"
      source_port_range      = "*"
      destination_port_range = "22"
    }
  ]
}