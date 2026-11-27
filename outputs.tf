output "vm_name_uppercase" {
  value = [
    for vm in azurerm_virtual_machine.main : upper(vm.name)
  ]
}

output "tags_string" {
  value = join(", ", values(var.tags))
}

output "vm_ids" {
  value = [
    for vm in azurerm_virtual_machine.main : vm.id
  ]
}