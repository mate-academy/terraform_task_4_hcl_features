output "vm_name_upper_case" {
  value = upper(azurerm_virtual_machine.main[1].name)
}

output "tags_to_string" {
  value = jsonencode(azurerm_virtual_machine.main[1].tags)
}

output "vm_ids" {
  value = [for vm in azurerm_virtual_machine.main : vm.id]
}