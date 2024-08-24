# outputs.tf
output "vm_name_uppercase" {
  value = upper(azurerm_virtual_machine.main[0].name)
}

output "joined_tags" {
  value = join(", ", [azurerm_virtual_machine.main[0].tags["environment"], "additional_tag"])
}

output "vm_ids" {
  value = [for vm in azurerm_virtual_machine.main : vm.id]
}
