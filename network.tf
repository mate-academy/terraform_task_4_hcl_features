resource "azurerm_virtual_network" "main" {
  name                = "${var.prefix}-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_subnet" "internal" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_security_group" "main" {
  name                = "${var.prefix}-SecurityGroup"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  dynamic "security_rule" {
    for_each = local.security-rules
    content {
      name                       = security_rule.value.name
      protocol                   = security_rule.value.protocol
      source_port_range          = security_rule.value.source_port_range
      destination_port_range     = security_rule.value.destination_port_range
      source_address_prefix      = security_rule.value.source_address_prefix
      destination_address_prefix = security_rule.value.destination_address_prefix
      access                     = security_rule.value.access
      priority                   = security_rule.value.priority
      direction                  = security_rule.value.direction
    }
  }

  tags = {
    output = "nsg-tag"
  }
}

# No need to insert ${count.index} in resource Local_Name - Terraform handles it itself
resource "azurerm_network_interface" "main" {
  for_each            = toset(local.nic-names)
  name                = each.key
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  # different NIC's may have identical ip_configurations
  ip_configuration {
    name                          = "ip-config-${replace(each.key, "${var.prefix}-nic-", "")}"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
    # currently we have no goal to have access from outside
  }
}

# associates security group to with each of the NIC which are to be created
resource "azurerm_network_interface_security_group_association" "example" {
  for_each                  = azurerm_network_interface.main
  network_interface_id      = each.value.id
  network_security_group_id = azurerm_network_security_group.main.id
}
