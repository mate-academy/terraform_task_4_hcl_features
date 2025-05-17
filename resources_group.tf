resource "azurerm_resource_group" "example" {
  name     = "${var.prefix}-${var.resource_group_name}"
  location = var.location
}