output "vm_name_uppercase" {
  value = [for vm in azurerm_virtual_machine.main : upper(vm.name)]
}

output "tags_string" {
  value = join(", ", [for k, v in azurerm_virtual_machine.main[0].tags : "${k}=${v}"])
}

output "vm_ids" {
  value = [for vm in azurerm_virtual_machine.main : vm.id]
}
