output "vm_name_uppercase" {
  value = upper(azurerm_virtual_machine.main[0].name)
}

output "tags_string" {
  value = join(", ", values(var.tags))
}

output "vm_ids" {
  value = [for vm in azurerm_virtual_machine.main : vm.id]
}