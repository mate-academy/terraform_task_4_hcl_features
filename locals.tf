
# in order to follow the task we iterate names not via count.index
locals {
  nic-names = [
    for i in range(var.vm-count) : "${var.prefix}-nic-${i + 1}"
  ]
}

# Work-Around to connect `count` and `for_each` indexing
locals {
  nic_id_map = {
    for nic in azurerm_network_interface.main : nic.name => nic.id
  }
}

locals {
  description = "dynamic list of Network Security Rules"
  /*
  Following fields are Required
    name                       = string
    protocol                   = Tcp, Udp, Icmp, Esp, Ah or *
    source_port_range          = 0 - 65535 or *
    destination_port_range     = 0 - 65535 or *
    source_address_prefix      = CIDR or source IP range or *
                                 to match any IP. Tags such as VirtualNetwork,
                                 AzureLoadBalancer and Internet can also be used.
    destination_address_prefix = Same values available as for source_address_prefix
    access                     = Allow / Deny
    priority                   = 100 - 4097
    direction                  = Inbound / Outbound
  */
  security-rules = [
    {
      name                       = "Allow-HTTP"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
      access                     = "Allow"
      priority                   = 101
      direction                  = "Inbound"
    },
    {
      name                       = "Allow-HTTPS"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "443"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
      access                     = "Allow"
      priority                   = 102
      direction                  = "Inbound"
    }
  ]
}
