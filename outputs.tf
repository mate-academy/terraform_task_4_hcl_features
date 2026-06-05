output "virtual_machine_names_uppercase" {
  value = [for vm in azurerm_virtual_machine.main : upper(vm.name)]
}

output "joined_vm_tag_values" {
  value = join(", ", [for key in ["environment", "owner", "project"] : local.vm_tags[key]])
}

output "virtual_machine_ids" {
  value = [for vm in azurerm_virtual_machine.main : vm.id]
}
