variable "prefix" {
  default = "tfvmex"
}

variable "vm_count" {
  default = 3
}

variable "common_tags" {
  type = map(string)
  default = {
    owner       = "DevOps Team"
    environment = "staging"
    project     = "Terraform Deployment"
  }
}
