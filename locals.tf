locals {
  nic_names = ["nic-primary", "nic-secondary"]

  nsg_rules = [
    { name = "SSH", priority = 1001, port = 22 },
    { name = "HTTP", priority = 1002, port = 80 }
  ]
}