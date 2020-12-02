# Tutorials: Terraform Backend for Azure

Managing a resources's lifecycle with terraform requires remembering state every time the tool is executed and the resource is created, modified, or destroyed. This state is maintained by terraform in a ".tfstate" file. There must be a method for sharing this state information when terraform is executed in an automated way, like in a DevOps CI/CD pipeline across temporary runner machines, and/or across multiple engineer machines.

A [terraform "backend"][tf-backend] enables state to be shared across machines. Once created, many projects on many machines may use the same backend to store and share their state in uniquely named state files. A single backend is only created once. However, it may be useful to manage the resources for the terraform backend as terraform resources too, which requires a state file. The act of managing the state of the terraform backend in a terraform backend is a bit recursive. While a backend is only created once, future changes to the backend resources may be required. It is possible to use terraform to ["import"][tf-import] the original backend resources into a state file, to store that state in the existing terraform backend, and then make managed changes to the resources using terraform.

To learn how this works, see the tutorials below:

1. [Create the backend][tutorials-create]
2. [Import and maintain the backend][tutorials-maintain] (e.g. for necessary changes)

[tf-backend]: https://www.terraform.io/docs/backends/index.html
[tf-import]: https://www.terraform.io/docs/import/index.html
[tutorials-create]: ./create/#readme
[tutorials-maintain]: ./maintain/#readme
