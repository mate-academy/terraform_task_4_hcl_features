# 1. Virtual Network
resource "azurerm_virtual_network" "main" {
  name                = "${var.prefix}-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

# 2. Subnet
resource "azurerm_subnet" "internal" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.2.0/24"]
}

# 3. Network Security Group (NSG)
resource "azurerm_network_security_group" "main" {
  name                = "${var.prefix}-nsg"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  # ВИМОГА: Додавання dynamic blocks для security rules
  dynamic "security_rule" {
    # Ітеруємо по мапі правил, визначених у locals.tf
    for_each = local.security_rules

    # security_rule.value - це значення (мапа) для поточної ітерації
    content {
      name                       = security_rule.key # Використовуємо ключ мапи як назву правила
      priority                   = security_rule.value.priority
      direction                  = security_rule.value.direction
      access                     = security_rule.value.access
      protocol                   = security_rule.value.protocol
      source_port_range          = "*"
      destination_port_range     = security_rule.value.port_range
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }
}

# 4. Network Interfaces (NICs)
resource "azurerm_network_interface" "nic" {
  # ВИМОГА: Використання for_each для створення кількох NICs
  for_each = toset(local.nic_names)

  name                = "${var.prefix}-${each.key}"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  ip_configuration {
    name                          = "ipconfig1-${each.key}"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
  }
}