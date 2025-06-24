output "name_machine" {
  value = [for vm in azurerm_virtual_machine.main : upper(vm.name)]
}

output "tag_machine" {
  value = join(", ", [for tag in azurerm_virtual_machine.main : join(", ", [for k, v in tag.tags : "${k}=${v}"])])
}

output "id_machine" {
  value = [for vm in azurerm_virtual_machine.main : vm.id]
}