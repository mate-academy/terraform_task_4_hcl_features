variable "prefix" {
  default = "tfvmex"
}

variable "vm_name" {
  type    = set(string)
  default = ["web", "db", "app"]
}