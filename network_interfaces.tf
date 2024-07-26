locals {
  network_interface_names = ["${var.prefix}-nic-1", "${var.prefix}-nic-2"]
}


resource "azurerm_network_interface" "main" {
  for_each            = toset(local.network_interface_names)
  name                = each.value
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name


  ip_configuration {
    name                          = "testconfiguration-${each.key}"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
  }
}
