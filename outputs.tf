output "vm_names" {
  value = [for vm in azurerm_virtual_machine.main : upper(vm.name)]
}
output "tags_string" {
  value = join(", ", flatten([for vm in azurerm_virtual_machine.main : values(vm.tags)]))
}
output "ids_list" {
  value = [for vm in azurerm_virtual_machine.main : vm.id]
}
