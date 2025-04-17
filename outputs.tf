output "joined_vm_tags" {
  value = join(", ", values(azurerm_virtual_machine.main.tags))
  description = "All tag values of the first virtual machine, joined into a single string"
}

output "uppercase_vm_name" {
  value = upper(azurerm_virtual_machine.main.name)
}

output "loop_vm_id" {
  value = azurerm_virtual_machine.main.id
}