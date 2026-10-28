output "converts_vm_name_to_uppercase" {
  value = [for vm in azurerm_virtual_machine.task4 : upper(vm.name)]
}

output "joins_multiple_tag_values_into_a_single_string" {
  value = join(", ", distinct([for vm in azurerm_virtual_machine.task4 : vm.tags.environment]))
}

output "get_the_IDs_of_all_vms" {
  value = [for vm in azurerm_virtual_machine.task4 : vm.id]
}