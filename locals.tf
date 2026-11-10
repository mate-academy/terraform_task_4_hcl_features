locals {
  nic_names = ["${var.prefix}-nic-1", "${var.prefix}-nic-2"]

  vm_tags = {
    environment = "staging"
    purpose     = "hcl-features"
  }

  security_rules = [
    {
      name                   = "AllowSshFromVnet"
      priority               = 100
      access                 = "Allow"
      protocol               = "Tcp"
      source_address_prefix  = "VirtualNetwork"
      destination_port_range = "22"
    },
    {
      name                   = "DenyOtherInbound"
      priority               = 200
      access                 = "Deny"
      protocol               = "*"
      source_address_prefix  = "*"
      destination_port_range = "*"
    },
  ]
}
