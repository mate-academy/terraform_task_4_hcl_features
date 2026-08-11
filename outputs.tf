output "vm_name_upper" {
  value = [for vm in azurerm_virtual_machine.main : upper(vm.name)]
}

output "tags_joined" {
  value = [for vm in azurerm_virtual_machine.main : join("-", [
    vm.tags["environment"],
    vm.tags["project"]
  ])]
}

output "vm_ids" {
  value = [for vm in azurerm_virtual_machine.main : vm.id]
}