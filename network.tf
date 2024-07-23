resource "azurerm_resource_group" "ts4" {
  name     = "${var.prefix}-resources"
  location = "West Europe"
}

resource "azurerm_virtual_network" "main" {
  name                = "${var.prefix}-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.ts4.location
  resource_group_name = azurerm_resource_group.ts4.name
}

resource "azurerm_subnet" "internal" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.ts4.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "main" {
  count               = length(local.nic_names)
  #name                = "${var.prefix}-nic-${count.index + 1}"
  name                = local.nic_names [count.index]
  location            = azurerm_resource_group.ts4.location
  resource_group_name = azurerm_resource_group.ts4.name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
  }
}
