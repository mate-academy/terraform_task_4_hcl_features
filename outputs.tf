output "vm_name_upper" {
  description = "converts the virtual machine name to uppercase"
  value       = [for vm in azurerm_virtual_machine.main : upper(vm.name)]
}

output "tags_joined" {
  description = "joins the tags into a single string"
  value       = [for vm in azurerm_virtual_machine.main : join(", ", values(vm.tags))]
}
output "vm_ids" {
  description = "The IDs of the virtual machines."
  value       = [for vm in azurerm_virtual_machine.main : vm.id]
}