output "vm_name" {
  value = upper(azurerm_virtual_machine.main[0].name)
}

output "vm_tags" {
  value = join(", ", [for key, value in azurerm_virtual_machine.main[0].tags : "${key}=${value}"])
}

output "vm_ids" {
  value = [for vm in azurerm_virtual_machine.main : vm.id]
}
