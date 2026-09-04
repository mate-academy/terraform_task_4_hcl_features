output "vm_names_uppercase" {
  value = [
    for vm in azurerm_virtual_machine.main : upper(vm.name)
  ]
}

output "joined_tags" {
  value = join(", ", values(azurerm_virtual_machine.main[0].tags))
}

output "vm_ids" {
  value = [
    for vm in azurerm_virtual_machine.main : vm.id
  ]
}