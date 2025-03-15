output "uppercase_vm_names" {
  value = [for vm in values(azurerm_virtual_machine.main) : upper(vm.name)]
}

output "joined_tags" {
  value = join(", ", flatten([for vm in values(azurerm_virtual_machine.main) : values(vm.tags)]))
}

output "vm_ids" {
  value = [for vm in values(azurerm_virtual_machine.main) : vm.id]
}
