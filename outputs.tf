output "vm_names_upper" {
  description = "VM names in upper"
  value       = [for vm in azurerm_virtual_machine.main : upper(vm.name)]
}

output "all_env_tags" {
  description = "All environment-теги connected with a comma"
  value       = join(", ", [for vm in azurerm_virtual_machine.main : vm.tags["environment"]])
}

output "vm_ids" {
  description = "List of all VMs IDs"
  value       = [for vm in azurerm_virtual_machine.main : vm.id]
}
