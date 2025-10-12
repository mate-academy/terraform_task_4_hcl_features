# Multiple VMs using count meta-argument
resource "azurerm_network_interface" "count_nics" {
  count               = var.vm_count
  name                = "${var.prefix}-nic-${count.index}"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
  }

  tags = local.common_tags
}

resource "azurerm_virtual_machine" "main" {
  count                 = var.vm_count
  name                  = "${var.prefix}-vm-${count.index}"
  location              = azurerm_resource_group.example.location
  resource_group_name   = azurerm_resource_group.example.name
  network_interface_ids = [azurerm_network_interface.count_nics[count.index].id]
  vm_size               = "Standard_DS1_v2"

  # Lifecycle block to prevent accidental deletion
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
    name              = "${var.prefix}-osdisk-${count.index}"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "hostname-${count.index}"
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  tags = merge(
    local.common_tags,
    {
      Name  = "${var.prefix}-vm-${count.index}"
      index = count.index
    }
  )
}
