output "vm_names_upper" {
  description = "VM names converted to uppercase"
  value       = [for vm in azurerm_virtual_machine.main : upper(vm.name)]
}

output "joined_tag_values_all_vms" {
  description = "All tag values across VMs joined into single string (comma separated)"
  value = join(", ",
    distinct(
      flatten([
        for vm in azurerm_virtual_machine.main : values(vm.tags)
      ])
    )
  )
}

output "vm_ids" {
  description = "List of VM IDs"
  value       = [for vm in azurerm_virtual_machine.main : vm.id]
}
