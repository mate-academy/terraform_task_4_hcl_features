variable "prefix" {
  default = "tfvmex"
}

variable "vm_count" {
  type        = number
  default     = 2
  description = "A quantety of creating virtual machine"
}