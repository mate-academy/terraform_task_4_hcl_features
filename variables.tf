variable "prefix" {
  default = "tfvmex"
}

variable "tags" {
  default = {
    Environment = "Production"
    Owner       = "DevOps"
    Project     = "Infrastructure"
  }
}
