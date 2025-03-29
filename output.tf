output "virtual_machine_names" {
  value     = upper(azurerm_virtual_machine.main[0].name)
  sensitive = true
}
output "virtual_machine_tags" {
  value     = split(",", azurerm_virtual_machine.main[0].tags.environment)
  sensitive = true
}
output "virtual_machine_id" {
  value     = [for vm in azurerm_virtual_machine.main : vm.id]
  sensitive = true
}
