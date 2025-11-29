terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.105.0"
    }
  }
}

provider "azurerm" {
  features {}
  # Опціональне використання змінної для підписки
  subscription_id = var.subscription_id == "" ? null : var.subscription_id
}

# Resource Group
resource "azurerm_resource_group" "example" {
  name     = "${var.prefix}-resources"
  location = "West Europe"
}