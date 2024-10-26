prefix = "tfvmex"

vm_count = 3

nsg_rules = [
  {
    name                   = "SSH",
    priority               = 100,
    destination_port_range = "22"
  },
  {
    name                   = "HTTP",
    priority               = 110,
    destination_port_range = "80"
  }
]

admin_username = "testadmin"
admin_password = "Password1234!"
