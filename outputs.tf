output "vm_upper_name" {
  value = [
    for vm in azurerm_linux_virtual_machine.main :
    upper(vm.name)
  ]
}

output "join_tags" {
  value = [
    for vm in azurerm_linux_virtual_machine.main :
    join("-", [
      azurerm_network_security_group.main.tags.output,
      vm.tags.output
    ])
  ]
}

output "vm-ids" {
  value = [
    for vm in azurerm_linux_virtual_machine.main :
    vm.id
  ]
}
