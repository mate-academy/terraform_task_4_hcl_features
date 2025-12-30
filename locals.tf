locals {
  nic_names = [
    "nic-1",
    "nic-2"
  ]

  security_rules = [
    {
      name     = "AllowSSH"
      priority = 100
      port     = 22
    },
    {
      name     = "AllowHTTP"
      priority = 200
      port     = 80
    }
  ]

  tags = {
    environment = "dev"
    project     = "terraform-hcl"
  }
}
