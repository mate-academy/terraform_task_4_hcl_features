# azurerm_virtual_machine is superseded by >>
resource "azurerm_linux_virtual_machine" "main" {
  count                           = var.vm-count
  name                            = "${var.prefix}-vm-${count.index + 1}"
  resource_group_name             = azurerm_resource_group.example.name
  location                        = azurerm_resource_group.example.location
  size                            = "Standard_B1s"
  admin_username                  = var.vm_user
  admin_password                  = var.vm_pass
  disable_password_authentication = false
  # refers to relevantly indexed NIC
  network_interface_ids = [
    local.nic_id_map["${var.prefix}-nic-${count.index + 1}"]
  ]

  # Premium SSD \ Local redundancy \ 64 Gb - to meet free subscription req's
  os_disk {
    name                 = "myosdisk${count.index + 1}"
    caching              = "ReadWrite"
    disk_size_gb         = "64"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    output = "vm-tag"
  }
}
