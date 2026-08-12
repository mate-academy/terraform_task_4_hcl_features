output "vm_names_uppercase" {
  description = "Virtual machine names in uppercase"

  value = [for vm in azurerm_virtual_machine.main : upper(vm.name)]
}

output "vm_tags_joined" {
  description = "Joined values of VM tags"

  value = join(", ", [for vm in azurerm_virtual_machine.main : vm.tags["environment"]])
}

output "virtual_machine_ids" {
  description = "IDs of all virtual machines"

  value = [for vm in azurerm_virtual_machine.main : vm.id]
}