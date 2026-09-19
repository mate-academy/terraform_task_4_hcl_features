output "vm_name_uppercase" {
  description = "Virtual machine name converted to uppercase"
  value       = upper(azurerm_virtual_machine.main[0].name)
}

output "joined_tag_values" {
  description = "Tag values joined into a single string"
  value       = join(",", values(local.common_tags))
}

output "all_vm_ids" {
  description = "IDs of all virtual machines created with count"
  value       = [for vm in azurerm_virtual_machine.main : vm.id]
}
