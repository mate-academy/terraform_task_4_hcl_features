# 1. Створення Public IP (по одному на VM)
resource "azurerm_public_ip" "main" {
  count               = 2
  name                = "${var.prefix}-pip-${count.index}"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

# 2. Virtual Machine
resource "azurerm_virtual_machine" "vm" {
  # ВИМОГА: Використання count для створення кількох екземплярів (наприклад, 2)
  count = 2

  name                = "${var.prefix}-vm-${count.index}"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  vm_size             = "Standard_B1s"

  # Прикріплюємо відповідний NIC до кожної VM
  network_interface_ids = [
    # Використовуємо count.index для вибору NIC з колекції for_each
    azurerm_network_interface.nic[local.nic_names[count.index]].id,
  ]

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  storage_os_disk {
    name              = "osdisk-${count.index}"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "host-${count.index}"
    admin_username = var.admin_username
    admin_password = var.admin_password
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = local.vm_tags

  # ВИМОГА: Додавання lifecycle block для запобігання видаленню
  lifecycle {
    prevent_destroy = true
  }
}