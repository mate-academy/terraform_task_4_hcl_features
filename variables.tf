variable "prefix" {
  default = "tfvmex"
}
variable "security_rules" {
  default = {
    "rule-1" = {"name" = "test123",
                "priority"                    = 100
                "direction"                   = "Outbound"
                "access"                      = "Allow"
                "protocol"                    = "Tcp"
                "source_port_range"           = "*"
                "destination_port_range"      = "*"
                "source_address_prefix"       = "0.0.0.0/0"
                "destination_address_prefix"  = "*"
                }
  }
}