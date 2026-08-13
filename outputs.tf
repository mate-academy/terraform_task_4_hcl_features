output "vm_name_upper" {
  description = "Virtual machine name converted to uppercase"
  value       = upper(azurerm_virtual_machine.main[0].name)
}

output "tags" {
  description = "Joined tag values from the first virtual machine"
  value       = join(",", values(azurerm_virtual_machine.main[0].tags))
}

output "vm_ids" {
  description = "IDs of all virtual machines"
  value       = [for vm in azurerm_virtual_machine.main : vm.id]
}
