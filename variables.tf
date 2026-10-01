variable "prefix" {
  default = "tfvmex"
}

locals {
  network_interface_names = ["tfvmex-nic-1", "tfvmex-nic-2"]

  nsg_rules = [
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
}
