# Tutorials: Terraform Azure Storage Account

## What you will build

Create a new [storage account][az-storage-account] in Azure using open-source [Terraform][terraform]. This will use the [Terraform Azure Provider][terraform-azurerm] for ["storage_account"][terraform-storage_account].

## What you will need

The following prerequisites are required in order to follow the steps in this tutorial:

- A [Microsoft Azure account][azure-account] an existing [resource group][tutorials-resource-group] with permission to create a Storage Account
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

4. Change to the directory of this tutorial project by typing `cd ./src/tutorials/terraform/azure/storage-account`.

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

6. Test the terraform setup by typing `make check`. You should see output similar to the below:

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

7. Review the name prefix and other variables in the file "./tutorial.tfvars". Change the values as needed. The resource group name should already exist. To get a list of existing resource groups type `make list-resource-groups`.

8. Create the storage account by typing `make install`. If you want to see what will be created prior to executing this command, type `make install TF_PLAN_ONLY=true`.

9. Verify the resource has been created by typing `make list-storage-accounts resource-group="our-tutorials-rg"` where "our-tutorials-rg" is the name of the resource group and checking if the new storage account exists in the list.

10. To remove the new storage account, type `make uninstall`. If you want to see what will be destroyed prior to executing this command, type `make uninstall TF_PLAN_ONLY=true`.

[az-storage-acocunt]: https://docs.microsoft.com/en-us/azure/storage/common/storage-account-overviewmanage-resource-groups-portal#what-is-a-resource-group
[terraform]: https://www.terraform.io/intro/index.html
[azure-account]: https://azure.microsoft.com/en-us/free/
[azure-geo]: https://azure.microsoft.com/en-us/global-infrastructure/geographies/
[git]: ../../../../tools/git/#readme
[make]: ../../../../tools/make/#readme
[docker]: ../../../../tools/docker/#readme
[terraform-azurerm]: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs
[terraform-storage_account]: https://www.terraform.io/docs/providers/azurerm/r/storage_account.html
[tutorials-resource-group]: ../resource-group/#readme
[tf-workflow]: https://www.terraform.io/guides/core-workflow.html
