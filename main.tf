resource "azurerm_resource_group" "example" {
  count    = 3
  name     = "${var.prefix}-resources-${count.index}"
  location = "West Europe"
}

resource "azurerm_virtual_machine" "main" {
  for_each              = toset(var.nic_indexes)
  name                  = "${var.prefix}-vm-${each.key}"
  location              = azurerm_resource_group.example[0].location
  resource_group_name   = azurerm_resource_group.example[0].name
  network_interface_ids = [azurerm_network_interface.main[each.key].id]
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

output "tags" {
  value = join(" - ", [
    for vm in azurerm_virtual_machine.main : vm.tags.environment
  ])
}

output "vm_IDs" {
  value = [for vm in azurerm_virtual_machine.main : vm.id]
}

output "vm_name_uppercase" {
  value = [for vm in azurerm_virtual_machine.main : upper(vm.name)]
}