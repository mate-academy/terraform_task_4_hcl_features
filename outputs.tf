# Вивести імена ВМ у верхньому регістрі
output "vm_names_upper" {
  value = [for vm in azurerm_virtual_machine.main : upper(vm.name)]
}

# Об’єднати значення тегів у рядок
output "tags_joined" {
  value = join(", ", values(azurerm_virtual_machine.main[0].tags))
}

# Вивести всі VM IDs
output "vm_ids" {
  value = [for vm in azurerm_virtual_machine.main : vm.id]
}
