output "vm_names_upper" {
  value = [for vm in azurerm_virtual_machine.main : upper(vm.name)]
}

output "vm_tags_joined" {
  value = [for vm in azurerm_virtual_machine.main : join(", ", values(vm.tags))]
}

output "vm_ids" {
  value = [for vm in azurerm_virtual_machine.main : vm.id]
}
