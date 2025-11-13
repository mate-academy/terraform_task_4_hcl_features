variable "prefix" {
  default = "tfvmex"
}

variable "location" {
  type    = string
  default = "West Europe"
}

variable "vm_count" {
  type    = number
  default = 2
}

variable "common_tags" {
  type = map(string)
  default = {
    environment = "staging"
    owner       = "dev-team"
  }
}
