output "vm_name_uppercase" {
  value = upper(azurerm_linux_virtual_machine.vm[0].name)
}

output "vm_tags_joined" {
  value = join(", ", values(azurerm_linux_virtual_machine.vm[0].tags))
}

output "all_vm_ids" {
  value = [for vm in azurerm_linux_virtual_machine.vm : vm.id]
}
