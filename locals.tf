locals {
  nic_names = ["nic1", "nic2", "nic3"]

  nsg_rules = [
    {
      name                   = "SSH"
      priority               = 100
      destination_port_range = "22"
    },
    {
      name                   = "HTTP"
      priority               = 200
      destination_port_range = "80"
    }
  ]
}
