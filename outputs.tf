output "vm_name_upper" {
  description = "Ім'я VM у верхньому регістрі"
  value = [
    for vm in azurerm_virtual_machine.main :
    upper(vm.name)
  ]
}

output "tags_joined_per_vm" {
  description = "З’єднані теги для кожної VM окремо"
  value = [
    for vm in azurerm_virtual_machine.main :
    join(", ", values(vm.tags))
  ]
}

output "all_vm_ids_count" {
  description = "ID всіх VM (через count)"
  value       = azurerm_virtual_machine.main[*].id
}

output "all_vm_ids_for_each" {
  description = "ID всіх VM (через for_each)"
  value = [
    for vm in values(azurerm_virtual_machine.main) :
    vm.id
  ]
}
