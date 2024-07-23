output "vm_names_uppercase" {
  value = upper(join(", ", [for vm in azurerm_virtual_machine.example : vm.name]))
}

output "tag_values_joined" {
  value = join(", ", [for vm in azurerm_virtual_machine.example : vm.tags.environment])
}

output "vm_ids" {
  value = [for vm in azurerm_virtual_machine.example : vm.id]
}
