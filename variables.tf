variable "prefix" {
  default = "tfvmex"
}

variable "vm_count" {
    description = "number of vm instances"
    type = number
  
}

variable "location" {
    default = "West Europe"
    type = string
}


variable "rg_name" {
    default = "tfvmex-resources"
    type = string
}