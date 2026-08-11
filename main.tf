resource "azurerm_resource_group" "example" {
  count    = 3
  name     = "${var.prefix}-resources-${count.index}"
  location = "West Europe"
}

resource "azurerm_virtual_network" "main" {
  count               = 3
  name                = "${var.prefix}-network-${count.index}"
  address_space       = ["10.${count.index}.0.0/16"]
  location            = azurerm_resource_group.example[count.index].location
  resource_group_name = azurerm_resource_group.example[count.index].name
}

resource "azurerm_subnet" "internal" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.example[0].name
  virtual_network_name = azurerm_virtual_network.main[0].name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "main" {
  for_each = toset(local.network_interface_names)

  name                = "${var.prefix}-nic-${each.key}"
  location            = azurerm_resource_group.example[0].location
  resource_group_name = azurerm_resource_group.example[0].name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "main" {
  count                 = 2
  name                  = "${var.prefix}-vm-${count.index}"
  location              = azurerm_resource_group.example[0].location
  resource_group_name   = azurerm_resource_group.example[0].name
  network_interface_ids = [azurerm_network_interface.main["web"].id]
  vm_size               = "Standard_DS1_v2"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1-${count.index}"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "hostname-${count.index}"
    admin_username = "testadmin"
    admin_password = "Password1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "staging"
    project     = "devops"
    owner       = "ivan"
  }

  lifecycle {
    prevent_destroy = true
  }
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
    }
  }
}