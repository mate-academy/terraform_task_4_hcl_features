resource "azurerm_virtual_machine" "main" {
  count                 = var.vm_count
  name                  = format("%s-vm-%02d", var.prefix, count.index + 1)
  location              = azurerm_resource_group.example.location
  resource_group_name   = azurerm_resource_group.example.name
  network_interface_ids = [values(azurerm_network_interface.main)[count.index % length(azurerm_network_interface.main)].id]
  vm_size               = "Standard_DS1_v2"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  storage_os_disk {
    name              = format("myosdisk%02d", count.index + 1)
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = format("host%02d", count.index + 1)
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  lifecycle {
    prevent_destroy = true
  }

  tags = local.vm_tags
}
