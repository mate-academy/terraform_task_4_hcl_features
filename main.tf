

############################
# Resource Group
############################
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = local.common_tags
}

############################
# VNET + Subnet
############################
resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-hcl-demo"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.42.0.0/16"]
  tags                = local.common_tags
}

resource "azurerm_subnet" "subnet" {
  name                 = "subnet-default"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.42.1.0/24"]
}

############################
# Public IP (для nic-a)
############################
resource "azurerm_public_ip" "pip" {
  name                = "pip-hcl-demo"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
  tags                = local.common_tags
}

############################
# NIC через for_each
############################
resource "azurerm_network_interface" "nic" {
  for_each            = toset(local.nic_names)
  name                = each.value
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = local.common_tags

  ip_configuration {
    name                          = "ipcfg"
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.subnet.id
    public_ip_address_id          = each.value == "nic-a" ? azurerm_public_ip.pip.id : null
  }
}



resource "azurerm_network_interface_security_group_association" "nic_a_nsg" {
  network_interface_id      = azurerm_network_interface.nic["nic-a"].id
  network_security_group_id = azurerm_network_security_group.nsg.id
}



resource "azurerm_linux_virtual_machine" "vm" {
  count               = var.vm_count
  name                = format("vm%02d", count.index + 1)
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  size                = "Standard_B1s"
  admin_username      = var.vm_admin_username

  disable_password_authentication = true
  admin_ssh_key {
    username   = var.vm_admin_username
    public_key = var.ssh_public_key
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  network_interface_ids = [
    azurerm_network_interface.nic[local.nic_names[count.index]].id
  ]

  lifecycle {
    prevent_destroy = true
  }

  tags = merge(local.common_tags, { idx = tostring(count.index) })
}
