output "vm_ids" {
  value = [for vm in azurerm_virtual_machine.main : vm.id]
}

output "joined_tags" {
  value = join(", ", [for key, value in var.tags : "${key}=${value}"])
}

output "vm_name_uppercase" {
  value = [for vm in azurerm_virtual_machine.main : upper(vm.name)]
}
