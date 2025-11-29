variable "prefix" {
  description = "Префікс для унікальності імен ресурсів"
  default     = "tfvmex"
}

variable "location" {
  description = "Регіон Azure"
  default     = "West Europe"
}

variable "subscription_id" {
  description = "ID підписки Azure. Залиште порожнім, щоб використовувати підписку за замовчуванням."
  default     = ""
}

variable "admin_username" {
  default = "testadmin"
}

variable "admin_password" {
  default   = "Password1234!"
  sensitive = true
}