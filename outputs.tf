output "vm_name_upper" {
  value = upper(azurerm_virtual_machine.main[0].name)
}

output "vm_tags" {
  value = join(", ", values(azurerm_virtual_machine.main[0].tags))
}

output "vm_ids" {
  value = [for vm in azurerm_virtual_machine.main : vm.id]
}