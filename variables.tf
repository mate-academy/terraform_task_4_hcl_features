variable "prefix" {
  description = "Prefix for naming resources"
  type        = string
  default     = "tfvmex"
}
variable "address_space" {
  description = "The address space for the virtual network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}
variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
  default     = "internal"
}
variable "subnet_address_prefixes" {
  description = "The address prefixes for the subnet"
  type        = list(string)
  default     = ["10.0.2.0/24"]
}
variable "prod_is" {
  default = false
}
