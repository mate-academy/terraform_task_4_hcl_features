resource "azurerm_linux_virtual_machine" "vm" {
  count               = var.vm_count
  name                = format("%s-vm-%02d", var.prefix, count.index + 1)
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  size                = var.vm_size

  admin_username                  = var.admin_username
  admin_password                  = var.admin_password
  disable_password_authentication = false

  network_interface_ids = [
    azurerm_network_interface.nic[local.nic_names[count.index]].id
  ]

  os_disk {
    name                 = format("%s-os-%02d", var.prefix, count.index + 1)
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  tags = var.tags

  lifecycle {

    prevent_destroy = true

    ignore_changes = [tags]
  }
}
