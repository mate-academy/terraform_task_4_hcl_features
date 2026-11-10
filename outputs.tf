output "vm_names_uppercase" {
  description = "Virtual machine names converted to uppercase."
  value       = [for vm in azurerm_linux_virtual_machine.main : upper(vm.name)]
}

output "tag_values" {
  description = "Virtual machine tag values joined into a single string."
  value       = join(", ", values(local.vm_tags))
}

output "vm_ids" {
  description = "Azure resource IDs of all virtual machines."
  value       = [for vm in azurerm_linux_virtual_machine.main : vm.id]
}
