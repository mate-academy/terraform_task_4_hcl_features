resource "azurerm_virtual_machine" "main" {
  count                 = 2
  name                  = "${var.prefix}-vm-${count.index}"
  location              = azurerm_resource_group.main.location
  resource_group_name   = azurerm_resource_group.main.name
  network_interface_ids = [azurerm_network_interface.main[local.network_interface_names[count.index]].id]
  vm_size               = "Standard_DS1_v2"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  storage_os_disk {
    name              = "myosdisk-${count.index}"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "hostname-${count.index}"
    admin_username = "testadmin"
    admin_password = bcrypt(var.admin_password)
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

locals {
  security_rules = [
    { name = "AllowSSH", priority = 1001, direction = "Inbound", access = "Allow", protocol = "Tcp", source_port_range = "*", destination_port_range = "22", source_address_prefix = "*", destination_address_prefix = "*" },
    { name = "AllowHTTP", priority = 1002, direction = "Inbound", access = "Allow", protocol = "Tcp", source_port_range = "*", destination_port_range = "80", source_address_prefix = "*", destination_address_prefix = "*" },
  ]
}

resource "azurerm_network_security_group" "main" {
  name                = "${var.prefix}-nsg"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  dynamic "security_rule" {
    for_each = local.security_rules
    content {
      name                       = security_rule.value.name
      priority                   = security_rule.value.priority
      direction                  = security_rule.value.direction
      access                     = security_rule.value.access
      protocol                   = security_rule.value.protocol
      source_port_range          = security_rule.value.source_port_range
      destination_port_range     = security_rule.value.destination_port_range
      source_address_prefix      = security_rule.value.source_address_prefix
      destination_address_prefix = security_rule.value.destination_address_prefix
    }
  }
}
