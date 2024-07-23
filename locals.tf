locals {
  security_rules = [
    { name = "rule1", priority = 100, direction = "Inbound", access = "Allow", protocol = "*", source_port_range = "*", destination_port_range = "22", source_address_prefix = "*", destination_address_prefix = "*" },
    { name = "rule2", priority = 200, direction = "Inbound", access = "Allow", protocol = "*", source_port_range = "*", destination_port_range = "80", source_address_prefix = "*", destination_address_prefix = "*" }
  ]
}