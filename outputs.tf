output "virtual_machine_name_uppercase" {
  value = upper(azurerm_virtual_machine.main[0].name)
}

output "tag_values_joined" {
  value = join(", ", values(azurerm_virtual_machine.main[0].tags))
}

output "virtual_machine_ids" {
  value = [for vm in azurerm_virtual_machine.main : vm.id]
}