output "vm_names_uppercase" {
  value = [for vm in azurerm_virtual_machine.main : upper(vm.name)]
}

output "vm_tags_single_string" {
  value = [for vm in azurerm_virtual_machine.main : join(", ", values(vm.tags))]
}

output "vm_IDs" {
  value = [for vm in azurerm_virtual_machine.main : vm.id]
}