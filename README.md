# HCL Language Features with Terraform

This task involves utilizing various HCL language features such as count, for_each, Terraform lifecycle, dynamic blocks, and built-in functions.

## Prerequisites

- Basic understanding of Terraform and Azure.
- Terraform installed on your machine.
- Azure CLI installed and configured.

## Hands-on Task

1. Fork this repository.
2. Create multiple instances of a resource using the `count` meta-argument.
3. Create multiple network interfaces using the `for_each` meta-argument.
    * Add a resource block that creates multiple network interfaces using `for_each`.
    * Use a local value to define a list of network interface names.
    * Iterate over the list using `for_each` to create the resources.
4. Add a lifecycle block to prevent accidental virtual machine resource deletion.
5. Add dynamic blocks for network security rules.
    * Define a list of network security rules in a local value.
    * Use a dynamic block to iterate over the list and create the security rules.
6. Use built-in functions to manipulate strings and other data.
    * Create an output block that converts the virtual machine name to uppercase.
    * Create an output block that joins multiple tag values into a single string.
    * Create an output block that uses a for loop to get the IDs of all virtual machines.
7. Organize the Terraform code into multiple files for better readability and maintenance.

