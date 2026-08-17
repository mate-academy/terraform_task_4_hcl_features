output "vm_names_uppercase" {
  value = [for vm in azurerm_linux_virtual_machine.main : upper(vm.name)]
}

output "tags_joined" {
  value = join(", ", values(var.tags))
}

output "vm_ids" {
  value = [for vm in azurerm_linux_virtual_machine.main : vm.id]
}