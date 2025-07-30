output "vm_name_uppercase" {
  description = "Ім'я першої віртуальної машини у верхньому регістрі"
  value       = upper(azurerm_virtual_machine.main[0].name)
}

output "combined_tags" {
  description = "Об'єднані значення тегів віртуальної машини"
  value       = join(", ", [for k, v in azurerm_virtual_machine.main[0].tags : "${k}:${v}"])
}

output "all_vm_ids" {
  description = "Список ідентифікаторів всіх віртуальних машин"
  value       = [for vm in azurerm_virtual_machine.main : vm.id]
}