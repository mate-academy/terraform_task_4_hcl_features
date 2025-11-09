terraform {
  required_version = ">= 1.6.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.52.0"
    }
  }
}

provider "azurerm" {
  features {}
  # Використовуємо ваш активний az CLI акаунт.
  # Якщо хочеш — можна явно задати:
  # subscription_id = var.subscription_id
  # tenant_id       = var.tenant_id
  use_cli = true
}
