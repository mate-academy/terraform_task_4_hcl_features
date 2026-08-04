resource "azurerm_virtual_network" "main" {
  count               = 2
  name                = "${var.prefix}${count.index}-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example[count.index].location
  resource_group_name = azurerm_resource_group.example[count.index].name
}

resource "azurerm_subnet" "internal" {
  count                = 2
  name                 = "internal-${count.index}"
  resource_group_name  = azurerm_resource_group.example[count.index].name
  virtual_network_name = azurerm_virtual_network.main[count.index].name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "main" {
  for_each = { for idx, name in local.nic_names : tostring(idx) => name }

  name                = each.value
  location            = azurerm_resource_group.example[tonumber(each.key)].location
  resource_group_name = azurerm_resource_group.example[tonumber(each.key)].name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.internal[tonumber(each.key)].id
    private_ip_address_allocation = "Dynamic"
  }
}
