output "vm_names_uppercase" {
  value = [for vm in azurerm_virtual_machine.main : upper(vm.name)]
}

output "joined_tags" {
  value = join(", ", ["environment", "instance"])
}

output "vm_ids" {
  value = [for vm in azurerm_virtual_machine.main : vm.id]
}

output "nic_ids" {
  value = values(azurerm_network_interface.main)[*].id
}
