output "vm_names_uppercase" {
  value = [for vm in azurerm_virtual_machine.main : upper(vm.name)]
}

output "joined_tag_values" {
  value = join(", ", values(local.common_tags))
}

output "virtual_machine_ids" {
  value = [for vm in azurerm_virtual_machine.main : vm.id]
}