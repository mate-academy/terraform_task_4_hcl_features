variable "prefix" {
  default = "tfvmex"
}

variable "vm_count" {
  default = 3
}
variable "vm_names" {
  type    = map(string)
  default = {
    "vm1" = "tfvmex-vm-1"
    "vm2" = "tfvmex-vm-2"
  }
}