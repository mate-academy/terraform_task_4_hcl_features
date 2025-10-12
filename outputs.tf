# Output with upper() function - VM name to uppercase
output "vm_names_upper" {
  description = "VM names in uppercase"
  value       = [for vm in azurerm_virtual_machine.main : upper(vm.name)]
}

# Output with join() function - join tag values
output "tags_joined" {
  description = "All tag values joined into a single string"
  value = join(", ", [
    for vm in azurerm_virtual_machine.main :
    join(":", [for k, v in vm.tags : "${k}=${v}"])
  ])
}

# Output with for loop - get IDs of all VMs
output "all_vm_ids" {
  description = "List of all VM IDs"
  value       = [for vm in azurerm_virtual_machine.main : vm.id]
}

# Additional outputs
output "network_interface_ids_foreach" {
  description = "Network interface IDs created with for_each"
  value       = { for k, v in azurerm_network_interface.foreach_nics : k => v.id }
}

output "network_interface_ids_count" {
  description = "Network interface IDs created with count"
  value       = [for nic in azurerm_network_interface.count_nics : nic.id]
}

output "security_rules" {
  description = "Security rules created dynamically"
  value = [
    for rule in azurerm_network_security_group.main.security_rule :
    "${rule.name}: ${rule.protocol}/${rule.destination_port_range}"
  ]
}
