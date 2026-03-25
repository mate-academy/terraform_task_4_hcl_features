output "vm_names_upper" {
  value = [for vm in azurerm_virtual_machine.main : upper(vm.name)]
}

output "tags_joined" {
  value = join(", ", values(azurerm_virtual_machine.main[0].tags))
}

output "all_vm_ids" {
  value = [for vm in azurerm_virtual_machine.main : vm.id]
}
