resource "azurerm_virtual_machine" "main" {
  count               = var.vm_count
  name                = "${var.prefix}-vm-${count.index}"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  network_interface_ids = [
    for name in local.nic_names : azurerm_network_interface.main[name].id
  ]

  lifecycle {
    prevent_destroy = true
  }

  vm_size = "Standard_DS1_v2"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  storage_os_disk {
    name              = "${var.prefix}-osdisk-${count.index}"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "${var.prefix}-vm-${count.index}"
    admin_username = "testadmin"
    admin_password = var.admin_password
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }

  tags = {
    environment = "staging"
  }
}
