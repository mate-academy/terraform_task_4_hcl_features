output "vm_names_upper" {
  value = [for vm in azurerm_virtual_machine.main : upper(vm.name)]
}

output "joined_tags" {
  value = join("-", flatten([
    for vm in azurerm_virtual_machine.main : values(vm.tags)
  ]))
}

output "vm_ids" {
  value = [for vm in azurerm_virtual_machine.main : vm.id]
}