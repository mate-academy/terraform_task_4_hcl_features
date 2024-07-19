output "vm_name_to_uppercase" {
  value = [for vm in azurerm_virtual_machine.vm : upper(vm.name)]
}

output "tags_string" {
  value = join(", ", [for k, v in azurerm_virtual_machine.vm[0].tags : "${k}=${v}"])
}

output "vm_ids" {
  value = [for vm in azurerm_virtual_machine.vm : vm.id]
}