output "vm_name_uppercase" {
  value = [for vm in azurerm_virtual_machine.main : upper(vm.name)]
}

output "joined_tags" {
  value = [for vm in azurerm_virtual_machine.main : join("-", [
    vm.tags["environment"],
    vm.tags["project"]
  ])]
}

output "loop_all_vm" {
  value = [for vm in azurerm_virtual_machine.main : vm.id]
}