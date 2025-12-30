resource "azurerm_linux_virtual_machine" "vm" {
  count = length(local.nic_names)

  name                = "${var.prefix}-vm-${count.index}"
  location            = var.location
  resource_group_name = azurerm_resource_group.example.name
  size                = "Standard_B1s"

  admin_username = "azureuser"
  admin_password = "Password1234!"

  network_interface_ids = [
    values(azurerm_network_interface.nic)[count.index].id
  ]

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

  disable_password_authentication = false

  lifecycle {
    prevent_destroy = true
  }

  tags = local.tags
}
