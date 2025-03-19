variable "prefix" {
  default = "tfvmex"
}
variable "locations" {
  type        = list(string)
  default     = ["UK West", "East US", "North Europe"]
  description = "Locations for deploy"
}
variable "environment" {
  type        = string
  default     = "staging"
  description = "Environment for deploing"
}