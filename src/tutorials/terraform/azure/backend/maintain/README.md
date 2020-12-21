# Tutorials: Maintain the Azure Terraform Backend

## What you will build

Import and update an [Azure terraform backend][az-tf-backend] with an existing resource group and an existing new storage account.

## What you will need

The following prerequisites are required in order to follow the steps in this tutorial:

- A [Microsoft Azure account][azure-account] with [existing Terraform backend resources][tutorials-backend-create].
- [git][git]
- [make][make]
- [docker][docker]

## Build and run

In this section, you will clone the tutorial and execute it:

1. Open a terminal window.

2. If you don't already have one, make a local directory to hold the code and change to that directory by typing `mkdir ./tutorials && cd ./tutorials`.

3. Clone the tutorial into the directory you created by typing:

   ```shell
     git clone https://github.com/ourchitecture/panda --depth=1
   ```

4. Change to the directory of this tutorial project by typing `cd ./src/tutorials/terraform/azure/backend/maintain`.

5. Type `make prerequisites` and read the output to verify you have the right tools. Output should look similar to:

   ```shell
   make prerequisites
       GNU Make 4 or later is required. You have:
       ------------------------------------------
       GNU Make 4.2.1
       Built for x86_64-pc-linux-gnu
       Copyright (C) 1988-2016 Free Software Foundation, Inc.
       License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
       This is free software: you are free to change and redistribute it.
       There is NO WARRANTY, to the extent permitted by law.

       Git 2.20 or later is required. You have:
       ----------------------------------------
       git version 2.25.1

       Docker 19.03.0 or later is required. You have:
       ----------------------------------------------
       Docker version 19.03.13, build 4484c46d9d
   ```

6. Test the terraform setup by typing `make check`. You should see output similar to the below.

   ```shell
   make check
      Clearing existing '.terraform' directory (if exists)...
      Initializing terraform without a backend...

      Initializing provider plugins...
      - Finding hashicorp/azurerm versions matching "2.37.0"...
      - Finding latest version of hashicorp/random...
      - Installing hashicorp/azurerm v2.37.0...
      - Installed hashicorp/azurerm v2.37.0 (signed by HashiCorp)
      - Installing hashicorp/random v3.0.0...
      - Installed hashicorp/random v3.0.0 (signed by HashiCorp)

      The following providers do not have any version constraints in configuration,
      so the latest version was installed.

      To prevent automatic upgrades to new major versions that may contain breaking
      changes, we recommend adding version constraints in a required_providers block
      in your configuration, with the constraint strings suggested below.

      * hashicorp/random: version = "~> 3.0.0"

      Terraform has been successfully initialized!

      You may now begin working with Terraform. Try running "terraform plan" to see
      any changes that are required for your infrastructure. All Terraform commands
      should now work.

      If you ever set or change modules or backend configuration for Terraform,
      rerun this command to reinitialize your working directory. If you forget, other
      commands will detect it and remind you to do so if necessary.
      Checking terraform formatting...
      Validating terraform...
      Success! The configuration is valid.
   ```

7. Review the name prefix and other variables in the file "./tutorial.tfvars". Change the values as needed. The resource group name and storage account should already exist. To get a list of existing resource groups type `make azure-resource-groups-list`. Check for existing storage accounts by typing `make azure-storage-accounts-list ARM_RESOURCE_GROUP="our-tutorials-rg"`, where "our-tutorials-rg" is the name of the resource group.

8. In order to maintain the Terraform backend resources in Azure, we first need to import the existing Azure resource group, storage account, and storage container into a remote ".tfstate" file that can be shared across machines (engineers and automation). Copy the file ".env.example" and rename the copy as simply ".env". Review the variable values in the file. Change the values as needed. The backend resources should already exist.

9. Import the existing backend resources into managed state by typing `make import ENV_FILE=.env`.

10. Now, the backend resources can also be maintained by Terraform (`terraform inception`? 🤣). Update the backend with any changes made to the terraform code by executing `make install ENV_FILE=.env`.

11. Verify the resources are configured properly by reviewing the output or using either the `az` CLI or Azure web portal.

12. Review the file "./.github/workflows/tutorials-terraform-azure-backend-maintain.yml" for a DevOps automation example of how to automate the maintenance of your Terraform backend by using a service principle login.

[az-tf-backend]: https://www.terraform.io/docs/backends/types/azurerm.html
[az-storage-acocunt]: https://docs.microsoft.com/en-us/azure/storage/common/storage-account-overview
[azure-account]: https://azure.microsoft.com/en-us/free/
[tutorials-backend-create]: ../create/#readme
[git]: ../../../../../../docs/git.md
[make]: ../../../../../../docs/make.md
[docker]: ../../../../../../docs/docker.md
[tutorials-backend-devops]: ../../../../../../.github/workflows/tutorials-terraform-azure-backend-maintain.yml
