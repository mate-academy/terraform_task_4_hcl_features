output "VM-Name" {
  value = [for vm in azurerm_virtual_machine.main : upper(vm.name)]
}
output "vm_tags_joined" {
  value = join(", ", values(azurerm_virtual_machine.main[0].tags))
}
output "IDs_VM" {
  value = [for vm in azurerm_virtual_machine.main : vm.id]
}
