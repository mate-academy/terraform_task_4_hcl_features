# Перетворення імені ВМ у верхній регістр (upper)
output "vm_names_upper" {
  description = "Virtual machine names in uppercase"
  value       = [for vm in azurerm_virtual_machine.main : upper(vm.name)]
}

# Об'єднання тегів в один рядок (join)
output "tags_joined" {
  description = "All tag values joined into a single string"
  value       = join(", ", local.tag_list)
}

# Отримання ID усіх ВМ через for loop
output "vm_ids" {
  description = "IDs of all virtual machines"
  value       = [for vm in azurerm_virtual_machine.main : vm.id]
}