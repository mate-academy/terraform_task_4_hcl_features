# Uppercase VM name
output "vm_name_uppercase" {
  value = local.upper_vm_name
}

# Join tag values
output "joined_tags" {
  value = join(", ", values(azurerm_linux_virtual_machine.main[0].tags))
}

# Get all VM IDs
output "vm_ids" {
  value = [for vm in azurerm_linux_virtual_machine.main : vm.id]
}