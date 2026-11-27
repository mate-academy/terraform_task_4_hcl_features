variable "tags" {
  type = map(string)

  default = {
    environment = "dev"
    owner       = "Kolya"
    project     = "Terraform"
  }
}