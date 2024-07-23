variable "prefix" {
  default = "tfvmex"
}

variable "vm_count" {
  description = "Number of virtual machines to create"
  type        = number
  default     = 3
}
