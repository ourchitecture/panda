# Tutorials: Create the Azure Terraform Backend

## What you will build

Create an [Azure terraform backend][az-tf-backend] with a new resource group and a new storage account.

## What you will need

The following prerequisites are required in order to follow the steps in this tutorial:

- A [Microsoft Azure account][azure-account] with permission to [create a new resource group][tutorials-rg] and an [Azure Storage Account][az-storage-acocunt].
- [git][git]
- [make][make]
- [docker][docker]

## Build and run

In this section, you will clone the tutorial and execute it:

1. Open a terminal window.

2. If you don't already have one, make a local directory to hold the code and change to that directory by typing `mkdir ./tutorials && cd ./tutorials`.

3. Clone the tutorial into the directory you created by typing:

   ```shell
     git clone https://github.com/ourchitecture/patterns-and-tutorials --depth=1
   ```

4. Change to the directory of this tutorial project by typing `cd ./src/tutorials/terraform/azure/backend/create`.

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

7. The [terraform workflow][tf-workflow] encourages us to plan our changes and then to apply them. Consider the name and location for your new Resource Group. Then, create a plan by typing `make plan resource-group=our-tutorials-rg location="East US"`, where "our-tutorials-rg" can be any name for your Resource Group and "East US" can be any valid [Azure geography][azure-geo].

8. Create the resource group by typing `make create`. If you want to see what will be created prior to executing this command, type `make plan-create`. If you receive output containing the error "AuthorizationFailed", please contact your Azure administrator to check the permissions for your account.

9. Review the target name and location that will be used to create the resource group by opening the file "./tutorial.tfvars". Change the values as needed. The resource group name should not already be used in your Azure account. To get a list of existing resource groups type `make list-resource-groups`. Refer to the [Azure geographies][azure-geo] or type `make list-locations` for a list of possible locations.

[az-tf-backend]: https://www.terraform.io/docs/backends/types/azurerm.html
[az-storage-acocunt]: https://docs.microsoft.com/en-us/azure/storage/common/storage-account-overview
[azure-account]: https://azure.microsoft.com/en-us/free/
[tutorials-rg]: ../../resource-group/#readme
[git]: ../../../../../tools/git/#readme
[make]: ../../../../../tools/make/#readme
[docker]: ../../../../../tools/docker/#readme
[tf-workflow]: https://www.terraform.io/guides/core-workflow.html
[azure-geo]: https://azure.microsoft.com/en-us/global-infrastructure/geographies/
