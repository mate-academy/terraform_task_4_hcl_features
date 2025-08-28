resource "azurerm_linux_virtual_machine" "main" {
  count = length(local.network_interface_names)

  name                = "${var.prefix}-vm-${count.index}"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  size                = "Standard_B1s"
  admin_username      = "testadmin"

  disable_password_authentication = false

  network_interface_ids = [
    azurerm_network_interface.main[local.network_interface_names[count.index]].id
  ]

  admin_password = "Password1234!"

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  tags = {
    environment = "staging"
    group       = "example"
  }

  lifecycle {
    prevent_destroy = true
  }
}
