output "vm-upper-name" {
  value = upper(azurerm_virtual_machine.main[0].name)
}
output "vm-tags" {
  value = join(",", values(azurerm_virtual_machine.main[0].tags))
}
output "vm-ids" {
  value = [for vm in azurerm_virtual_machine.main : vm.id]
}