output "vm-names-uppercase" {
  value = [for vm in azurerm_virtual_machine.main : upper(vm.name)]
}
output "vm-tags" {
  value = [for vm in azurerm_virtual_machine.main : join(",", values(vm.tags))]
}
output "vm-ids" {
  value = [for vm in azurerm_virtual_machine.main : vm.id]
}