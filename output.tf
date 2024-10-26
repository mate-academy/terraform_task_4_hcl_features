output "vm_names" {
  value = [for vm in azurerm_virtual_machine.main : upper(vm.name)]
}

output "joined_tags" {
  value = join(", ", [
    for vm in azurerm_virtual_machine.main : "${vm.tags["name"]}-${vm.tags["environment"]}-${vm.tags["creation_date"]}"
  ])
}

output "vm_ids" {
  value = [for vm in azurerm_virtual_machine.main : vm.id]
}
