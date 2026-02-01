output "vm_name_uppercase" {
  value = upper(azurerm_virtual_machine.main[0].name)
}

output "vm-tag-string" {
  value = join(", ", values(azurerm_virtual_machine.main[0].tags))
}

output "all_vm_ids" {
  value = [for vm in azurerm_virtual_machine.main : vm.id]
}
