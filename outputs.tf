
output "vm_names_upper" {
  value = [for vm in azurerm_virtual_machine.main : upper(vm.name)]
}

output "vm_tags_joined" {
  value = join(", ", [
    for vm in azurerm_virtual_machine.main :
    join(":", values(vm.tags))
  ])
}

output "vm_ids" {
  value = [for vm in azurerm_virtual_machine.main : vm.id]
}

output "named_nic_ids" {
  value = { for k, nic in azurerm_network_interface.named : k => nic.id }
}