# Усі імена ВМ великими літерами
output "vm_names_upper" {
  value       = [for v in azurerm_linux_virtual_machine.vm : upper(v.name)]
  description = "All VM names in uppercase"
}
