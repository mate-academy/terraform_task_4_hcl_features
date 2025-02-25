output "vm_names_uppercase" {
  value = [for vm in azurerm_virtual_machine.main : upper(vm.name)]
}

output "vm_ids" {
  value = [for vm in azurerm_virtual_machine.main : vm.id]
}

output "combined_tags" {
  value = join(", ", flatten([for tag, value in azurerm_virtual_machine.main[0].tags : "${tag}=${value}"]))
}
