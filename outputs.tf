output "vm_name_uppercase" {
  description = "Upper Case for VM"
  value       = upper(azurerm_virtual_machine.main[0].name)
}

output "tags_joined" {
  description = "joins multiple tag values into a single string"
  value       = join(", ", values(azurerm_virtual_machine.main[0].tags))
}

output "vm_ids" {
  description = "IDs of all virtual machines"
  value       = [for vm in azurerm_virtual_machine.main : vm.id]
}