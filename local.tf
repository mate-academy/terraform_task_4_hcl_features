locals {
  nic_names = [
    "nic-1",
    "nic-2",
    "nic-3",
  ]
  nsg_rules = [
    {
      "name"                   = "SSH",
      "priority"               = 100,
      "direction"              = "Inbound",
      "access"                 = "Allow",
      "protocol"               = "Tcp",
      "source_port_range"      = "*",
      "destination_port_range" = "22",
      "source_address_prefix"  = "*",
    "destination_address_prefix" = "*" },
    {
      "name"                   = "HTTP",
      "priority"               = 100,
      "direction"              = "Inbound",
      "access"                 = "Allow",
      "protocol"               = "Tcp",
      "source_port_range"      = "*",
      "destination_port_range" = "80",
      "source_address_prefix"  = "*",
    "destination_address_prefix" = "*" }
  ]
}