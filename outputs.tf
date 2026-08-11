output "vm_name_uppercase" {
  value = upper(azurerm_virtual_machine.main.name)
}

output "joined_tags" {
  value = join("-", [
    azurerm_virtual_machine.main.tags["environment"],
    azurerm_virtual_machine.main.tags["project"]
  ])
}

output "loop_all_vm"{
  value = [for vm in azurerm_virtual_machine.main.id]
}