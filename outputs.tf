output "upper_virtual_machine_name" {
  value = upper(azurerm_virtual_machine.main[0].name)
}

output "joined_vm_tags" {
  value = join(",", values(azurerm_virtual_machine.main[0].tags))
}

output "instance_ip_address" {
  value = [for vm in azurerm_virtual_machine.main : vm.id]
}