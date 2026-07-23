output "uppercase_vm_name" {
  value       = upper(azurerm_virtual_machine.main[0].name)
  description = "Имя первой ВМ в верхнем регистре"
}

output "joined_tag_values" {
  value       = join(", ", values(azurerm_virtual_machine.main[0].tags))
  description = "Значения тегов одной строкой"
}

output "all_vm_ids" {
  value       = [for vm in azurerm_virtual_machine.main : vm.id]
  description = "Список ID всех ВМ"
}