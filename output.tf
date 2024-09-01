output "uppercase_vm_names" {
  value = [for vm in azurerm_virtual_machine.main : upper(vm.name)]
}

output "joined_tag_values" {
  value = join(", ", [for vm in azurerm_virtual_machine.main : vm.tags.environment])
}

output "vm_ids" {
  value = [for vm in azurerm_virtual_machine.main : vm.id]
}

