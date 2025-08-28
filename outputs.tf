output "vm_name" {
  value = [for vm in azurerm_linux_virtual_machine.main : upper(vm.name)]
}

output "tags" {
  value = join(",", [for vm in azurerm_linux_virtual_machine.main : "${vm.tags.environment}-${vm.tags.group}"])
}

output "vm_ids" {
  value = [for vm in azurerm_linux_virtual_machine.main : vm.id]
}