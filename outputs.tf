output "virtual_machine_names_uppercase" {
  description = "Uppercase versions of all VM names."
  value       = [for vm in azurerm_virtual_machine.main : upper(vm.name)]
}

output "joined_tag_values" {
  description = "All common tag values joined into a single string."
  value       = join(", ", values(local.common_tags))
}

output "virtual_machine_ids" {
  description = "IDs of all created virtual machines."
  value       = [for vm in azurerm_virtual_machine.main : vm.id]
}
