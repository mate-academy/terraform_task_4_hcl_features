locals {
  nic_names = [
    "${var.prefix}-nic-1",
    "${var.prefix}-nic-2",
  ]

  vm_names = [
    "${var.prefix}-vm-1",
    "${var.prefix}-vm-2",
  ]

  common_tags = {
    environment = "staging"
    project     = "terraform-hcl-features"
    owner       = "mate-academy"
  }

  security_rules = [
    {
      name                       = "allow-ssh"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    },
    {
      name                       = "allow-http"
      priority                   = 110
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    },
  ]
}
