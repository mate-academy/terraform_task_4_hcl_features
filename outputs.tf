# Робить імена машин великими літерами (UPPER)
output "uppercase_vm_names" {
  value = [for vm in azurerm_virtual_machine.main : upper(vm.name)]
}

# Об'єднує всі теги в один рядок (JOIN)
output "joined_tags" {
  value = join(", ", values(azurerm_virtual_machine.main[0].tags))
}

# Витягує ID усіх віртуальних машин через цикл (FOR)
output "all_vm_ids" {
  value = [for vm in azurerm_virtual_machine.main : vm.id]
}