output "vm_names_uppercase" {
  value = [for vm in azurerm_virtual_machine.vm : upper(vm.name)]
}

output "joined_tags" {
  value = join(", ", [for vm in azurerm_virtual_machine.vm : join(", ", [for key, value in vm.tags : "${key}=${value}"])])
}

output "vm_ids" {
  value = [for vm in azurerm_virtual_machine.vm : vm.id]
}