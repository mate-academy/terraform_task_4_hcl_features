locals {
  # Вимога: Використовуємо local value для списку NIC names (для for_each)
  nic_names = [
    "frontend-nic",
    "backend-nic",
    "db-nic"
  ]

  # Вимога: Використовуємо local value для списку правил NSG (для dynamic blocks)
  security_rules = {
    # Ключ: ім'я правила
    SSH_Access = {
      priority   = 100
      direction  = "Inbound"
      access     = "Allow"
      protocol   = "Tcp"
      port_range = "22"
    },
    HTTP_Access = {
      priority   = 101
      direction  = "Inbound"
      access     = "Allow"
      protocol   = "Tcp"
      port_range = "80"
    },
    Monitoring_Port = {
      priority   = 102
      direction  = "Inbound"
      access     = "Allow"
      protocol   = "Tcp"
      port_range = "9090"
    }
  }

  # Теги, які будуть об'єднані в output
  vm_tags = {
    Environment = "Staging"
    Project     = "HCL_Demo"
    Owner       = "DevOps"
  }
}