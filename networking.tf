resource "azurerm_network_interface" "main" {
  for_each = toset(local.nic_names)

  name                = each.value
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  ip_configuration {
    name                          = "ipcfg-${each.value}"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
  }
}
