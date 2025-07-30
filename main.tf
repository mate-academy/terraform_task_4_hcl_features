# resource group creation
resource "azurerm_resource_group" "example" {
  name     = "${var.prefix}-resources"
  location = "West Europe" # [cite: 1]
}

# virtual network creation
resource "azurerm_virtual_network" "main" {
  name                = "${var.prefix}-network"                 # [cite: 1]
  address_space       = ["10.0.0.0/16"]                         # [cite: 1]
  location            = azurerm_resource_group.example.location # [cite: 1]
  resource_group_name = azurerm_resource_group.example.name     # [cite: 1]
}

# subnet creation
resource "azurerm_subnet" "internal" {
  name                 = "internal"                          # [cite: 1, 2]
  resource_group_name  = azurerm_resource_group.example.name # [cite: 1, 2]
  virtual_network_name = azurerm_virtual_network.main.name   # [cite: 1, 2]
  address_prefixes     = ["10.0.2.0/24"]                     # [cite: 1, 2]
}

# Network Security Group (NSG) creation
resource "azurerm_network_security_group" "main" {
  name                = "${var.prefix}-nsg"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  # Dynamic block for security rules based on local.security_rules
  dynamic "security_rule" { # [cite: 3]
    for_each = local.security_rules
    content {
      name                       = security_rule.value.name
      priority                   = security_rule.value.priority
      direction                  = security_rule.value.direction # [cite: 4]
      access                     = security_rule.value.access
      protocol                   = security_rule.value.protocol
      source_port_range          = security_rule.value.source_port_range
      destination_port_range     = security_rule.value.destination_port_range
      source_address_prefix      = security_rule.value.source_address_prefix
      destination_address_prefix = security_rule.value.destination_address_prefix # [cite: 5]
    }
  }
}

# Associate NSG with Subnet
# Associate NSG with Subnet
resource "azurerm_subnet_network_security_group_association" "internal" {
  subnet_id                 = azurerm_subnet.internal.id
  network_security_group_id = azurerm_network_security_group.main.id
}

resource "azurerm_network_interface" "main" {
  for_each            = toset(local.nic_names) # Iterate over the list of NIC names defined in locals
  name                = "${var.prefix}-${each.value}"
  location            = azurerm_resource_group.example.location # [cite: 1]
  resource_group_name = azurerm_resource_group.example.name
  ip_configuration {
    name                          = "${each.value}-ipconfig" # [cite: 6]
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic" # [cite: 1, 6]
  }
}
resource "azurerm_virtual_machine" "main" {
  count                 = length(local.nic_names) # Create a VM for each NIC [cite: 1, 7]
  name                  = "${var.prefix}-vm-${count.index}"
  location              = azurerm_resource_group.example.location                           # [cite: 1, 7]
  resource_group_name   = azurerm_resource_group.example.name                               # [cite: 1, 7]
  network_interface_ids = [azurerm_network_interface.main[local.nic_names[count.index]].id] # Link to specific NIC by its key
  vm_size               = "Standard_DS1_v2"                                                 # [cite: 1, 7]

  storage_image_reference {
    publisher = "Canonical"                    # [cite: 1, 8]
    offer     = "0001-com-ubuntu-server-jammy" # [cite: 1, 8]
    sku       = "22_04-lts"                    # [cite: 1, 8]
    version   = "latest"                       # [cite: 1, 8]
  }

  storage_os_disk {
    name              = "myosdisk-${count.index}" # Make disk name unique for each VM
    caching           = "ReadWrite"               # [cite: 1, 9]
    create_option     = "FromImage"               # [cite: 1, 9]
    managed_disk_type = "Standard_LRS"            # [cite: 1, 9]
  }

  os_profile {
    computer_name  = "hostname-${count.index}" # Make computer name unique
    admin_username = "testadmin"               # [cite: 1, 9]
    admin_password = "Password1234!"           # [cite: 1, 10]
  }

  os_profile_linux_config {
    disable_password_authentication = false # [cite: 1, 10]
  }

  tags = {
    environment = "staging" # [cite: 1, 10]
    owner       = "terraform"
    project     = "hcl-features"
  }

  # Lifecycle block to prevent accidental deletion
  lifecycle {
    prevent_destroy = true
  }
}