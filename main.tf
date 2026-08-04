terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.105.0"
    }
  }
}



resource "azurerm_resource_group" "example" {
  count    = 2
  name     = "${var.prefix}${count.index}-resources"
  location = "Denmark East"
}

resource "azurerm_network_security_group" "example" {
  name                = "example-nsg"
  location            = azurerm_resource_group.example[0].location
  resource_group_name = azurerm_resource_group.example[0].name

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


resource "azurerm_virtual_machine" "main" {
  count                 = 2
  name                  = "${var.prefix}${count.index}-vm"
  location              = azurerm_resource_group.example[count.index].location
  resource_group_name   = azurerm_resource_group.example[count.index].name
  network_interface_ids = [azurerm_network_interface.main[tostring(count.index)].id]
  vm_size               = "Standard_DS1_v2"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk${count.index}"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "hostname${count.index}"
    admin_username = "testadmin"
    admin_password = "Password1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "staging"
    owner       = "devops-team"
    project     = "hcl-features"
  }
  lifecycle {
    prevent_destroy = true
  }
}
