output "vm_name_uppercase" {
  value = upper(azurerm_virtual_machine.main[0].name)
}

output "vm_tags_to_connect" {
  value = join(", ", flatten([for tag, value in azurerm_virtual_machine.main[0].tags : "${tag}=${value}"]))
}


output "id_vm" {
  value = [for vm in azurerm_virtual_machine.main : vm.id]
}
