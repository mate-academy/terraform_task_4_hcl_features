resource "azurerm_resource_group" "example" {
  name     = "${var.prefix}-resources"
  location = var.location
}

resource "azurerm_linux_virtual_machine" "main" {
  count = length(local.nic_names)

  name                              = "${var.prefix}-vm-${count.index + 1}"
  location                          = azurerm_resource_group.example.location
  resource_group_name               = azurerm_resource_group.example.name
  network_interface_ids             = [azurerm_network_interface.main[keys(azurerm_network_interface.main)[count.index]].id]
  size                              = var.vm_size
  admin_username                    = "testadmin"
  disable_password_authentication   = true
  vm_agent_platform_updates_enabled = true

  admin_ssh_key {
    username   = "testadmin"
    public_key = var.ssh_public_key
  }

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

  tags = local.vm_tags

  lifecycle {
    prevent_destroy = true
  }
}
