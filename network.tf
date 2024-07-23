resource "azurerm_resource_group" "rg" {
  name     = "${var.prefix}-rg"
  location = "West Europe"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "${var.prefix}-virtual-network"
  address_space       = [var.address_space]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "subnet" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.address_prefixes]
}

resource "azurerm_network_interface" "nic" {
  count               = 2
  name                = "${var.prefix}-nic-${count.index + 1}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

