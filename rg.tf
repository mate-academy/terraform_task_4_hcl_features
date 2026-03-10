resource "azurerm_resource_group" "taskgroup" {
  name     = "${var.prefix}-resources"
  location = "West Europe"
}