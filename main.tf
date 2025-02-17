resource "azurerm_resource_group" "example" {
  name     = var.prefix
  location = "West Europe"
}

resource "azurerm_virtual_machine" "main" {
  count                 = var.counts_of_VM
  name                  = "${var.prefix}-vm-${count.index}"
  location              = azurerm_resource_group.example.location
  resource_group_name   = azurerm_resource_group.example.name
  network_interface_ids = [azurerm_network_interface.main[count.index].id]
  vm_size               = "Standard_DS1_v2"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "hostname"
    admin_username = "testadmin"
    admin_password = "Password1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "staging"
  }
  lifecycle {
    prevent_destroy = true
  }
}

output "virtual_machine_name" {
  value = upper(azurerm_virtual_machine.main[0].name)
}

output "vm_tags" {
  value = join(", ", [for k, v in azurerm_virtual_machine.main[0].tags : "${k}=${v}"])
}

output "vm_ids" {
  value = [for vm in azurerm_virtual_machine.main : vm.id]
}
