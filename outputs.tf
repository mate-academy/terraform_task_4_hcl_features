output "vm_names_uppercase" {
  description = "VM names converted to uppercase"
  value       = [for vm in azurerm_virtual_machine.main : upper(vm.name)]
}

output "joined_tag_values" {
  description = "Joined tag values into a single string"
  value       = join(", ", values(azurerm_virtual_machine.main[0].tags))
}

output "all_vm_ids" {
  description = "IDs of all virtual machines using a for loop"
  value       = [for vm in azurerm_virtual_machine.main : vm.id]
}