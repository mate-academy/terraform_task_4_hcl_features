output "vm_name_upper" {
  value = upper(azurerm_virtual_machine.main[0].name)
}

output "vm_tags_joined" {
  value = join(", ", values(azurerm_virtual_machine.main[0].tags))
}

output "all_vm_ids" {
  value = [for vm in azurerm_virtual_machine.main : vm.id]
}
