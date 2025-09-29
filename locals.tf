locals {
  network_interface_names = var.network_interface_names

  security_rules = {
    for rule in var.security_rules :
    rule.name => rule
  }
}