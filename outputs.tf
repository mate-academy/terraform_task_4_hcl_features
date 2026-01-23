output "vm_names_upper" {
  value = [for vm in azurerm_linux_virtual_machine.vm : upper(vm.name)]
}

output "tag_values_joined" {
  value = join(",", values(var.tags))
}

output "vm_ids" {
  value = [for vm in azurerm_linux_virtual_machine.vm : vm.id]
}

output "nic_names" {
  value = local.nic_names
}
