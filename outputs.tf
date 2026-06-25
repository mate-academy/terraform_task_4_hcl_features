output "vm_name_uppercase" {
  description = "First virtual machine name converted to uppercase."
  value       = upper(azurerm_virtual_machine.main[0].name)
}

output "joined_tags" {
  description = "All tag values of the first virtual machine joined into a single string."
  value       = join(", ", values(azurerm_virtual_machine.main[0].tags))
}

output "vm_ids" {
  description = "IDs of all virtual machines created with count."
  value       = [for vm in azurerm_virtual_machine.main : vm.id]
}
