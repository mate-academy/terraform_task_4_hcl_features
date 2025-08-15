#Create an output block that converts the virtual machine name to uppercase.
output "vm_names_upper" {
  value = [for vm in azurerm_virtual_machine.main : upper(vm.name)]
}

#Create an output block that joins multiple tag values into a single string.
output "joined_tags" {
  value = join("-", flatten([
    for vm in azurerm_virtual_machine.main : values(vm.tags)
  ]))
}
#Create an output block that uses a for loop to get the IDs of all virtual machines.
output "vm_ids" {
  value = [for vm in azurerm_virtual_machine.main : vm.id]
}
