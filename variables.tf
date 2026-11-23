variable "prefix" {
  default = "tfvmex"
}

locals {
  nic_names = ["backend", "frontend"]

  security_rules = [
    {
      name     = "SSH"
      port     = "22"
      priority = "100"
    },
    {
      name     = "HTTP"
      port     = "80"
      priority = "110"
    }
  ]
}