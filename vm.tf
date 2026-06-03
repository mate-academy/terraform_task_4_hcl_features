resource "azurerm_virtual_machine" "main" {
  count                 = 3
  name                  = "${var.prefix}-VMexample-${count.index}"
  location              = azurerm_resource_group.example[0].location
  resource_group_name   = azurerm_resource_group.example[0].name
  network_interface_ids = [values(azurerm_network_interface.main)[0].id]
  vm_size               = "Standard_DS1_v2"
  lifecycle {
    prevent_destroy = true
  }

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
}


locals {
  nsg_rules = [
    {
      name                   = "allow-http"
      priority               = 100
      direction              = "Inbound"
      access                 = "Allow"
      protocol               = "Tcp"
      source_port_range      = "*"
      destination_port_range = "80"
    },
    {
      name                   = "allow-https"
      priority               = 110
      direction              = "Inbound"
      access                 = "Allow"
      protocol               = "Tcp"
      source_port_range      = "*"
      destination_port_range = "443"
    }
  ]
}