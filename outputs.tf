# ВИМОГА 1: Вбудована функція - Перетворення імені VM на ВЕРХНІЙ РЕГІСТР (upper())
output "vm_name_uppercase" {
  description = "Ім'я першої VM у верхньому регістрі"
  value       = upper(azurerm_virtual_machine.vm[0].name)
}

# ВИМОГА 2: Вбудована функція - Об'єднання значень тегів (join(), values())
output "joined_vm_tags" {
  description = "Об'єднані значення тегів першої VM"
  # values() отримує значення тегів, join() об'єднує їх через кому
  value = join(",", values(azurerm_virtual_machine.vm[0].tags))
}

# ВИМОГА 3: Використання циклу 'for' для отримання ID всіх VMs
output "all_vm_ids_for_loop" {
  description = "Список ID всіх створених віртуальних машин"
  # [for item in collection: item.attribute]
  value = [for vm in azurerm_virtual_machine.vm : vm.id]
}

# Додатковий output для демонстрації for_each
output "all_nic_ids_for_each" {
  description = "Список ID всіх мережевих інтерфейсів"
  # Використовуємо for для ітерації по колекції for_each
  value = [for nic in azurerm_network_interface.nic : nic.id]
}