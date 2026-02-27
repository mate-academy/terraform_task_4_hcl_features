resource "azurerm_linux_virtual_machine" "main" {
  count = var.vm_count

  name                = "${var.prefix}-vm-${count.index}"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  size                = "Standard_B1s"
  admin_username      = "azureuser"

  network_interface_ids = [
    azurerm_network_interface.main["${var.prefix}-nic-${count.index + 1}"].id
  ]

  lifecycle {
    prevent_destroy = true
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

  admin_ssh_key {
    username   = "azureuser"
    public_key = file("${path.module}/id_rsa_terraform.pub")
  }

  tags = {
    environment = "staging"
    project     = "terraform"
  }
}