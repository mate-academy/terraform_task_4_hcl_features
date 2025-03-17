output "vm_names_uppercase" {
  description = "List of Virtual Machine names in uppercase"
  value       = [for vm in azurerm_virtual_machine.main : upper(vm.name)]
}

output "joined_tags" {
  description = "All tags joined into a single string"
  value       = join(", ", flatten([for vm in azurerm_virtual_machine.main : values(vm.tags)]))
}

output "vm_ids" {
  description = "List of all Virtual Machine IDs"
  value       = [for vm in azurerm_virtual_machine.main : vm.id]
}
