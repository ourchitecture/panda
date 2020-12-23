# Tutorials: Terraform Azure for Node.js

It can be useful to have the cloud infrastructure unique to each application in a localized "./infrastructure" directory like this. However, a large system will usually also share cloud resources across applications. For example, in Azure, an [AppService Plan][az-app-service-plan] can host multiple applications.

Running Node.js on Azure requires a unique [AppService][az-app-service] instance. However, the Azure CLI can dynamically create this instance for us when running the command `az webapp up...`. Alternatively, terraform could create and manage the configuration of this AppService instance to ensure settings are managed explicitly through code and a DevOps lifecycle. We recommend using terraform for enterprise systems.

Because AppService Plans are shared by other tutorials, see the [Terraform Azure AppService Plan tutorial][tutorial-app-service-plan].

## What you will build

Create a new [AppService][az-app-service] in Azure using open-source [Terraform][terraform]. This will use the [Terraform Azure Provider][terraform-azurerm] for ["app_service"][terraform-app_service].

## What you will need

The following prerequisites are required in order to follow the steps in this tutorial:

- A [Microsoft Azure account][azure-account] with an existing resource group and AppService Plan along with permission to create an AppService. _\*See the tutorial to [create a new resource group][tutorial-rg] and [create a new plan][tutorial-app-service-plan]._
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

4. Change to the directory of this tutorial project by typing `cd ./src/tutorials/node/azure/infrastructure`.

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

6. So that Terraform resource state can be maintained and shared across machines (engineers and automation), copy the file ".env.example" and rename the copy as simply ".env". Review the variable values in the file. Change the values as needed. The backend resources should already exist.

7. Review the variable values used to create the AppService by opening the file "./tutorial.tfvars". Change the values as needed. The resource group name and plan name should already exist and the AppService name should be globally unique (yes, globally). If you receive an error that the application exists, but information could not be retrieved, this is usually because the application name already exists somewhere else within Azure. Simply try another name and consider making it more unique. Usually, you won't expose this unique application's Azure URL directly to customers, but will put it behind an Application Gateway, Load Balancer, Firewall, etc. To get a list of existing resource groups type `make azure-resource-groups-list`. To get a list of existing plans type `make azure-app-service-plans-list`.

8. Test the terraform setup by typing `make check`. You should see output similar to the below:

   ```shell
   make check
     Clearing existing '.terraform' directory (if exists)...
     Initializing terraform without a backend...

     Initializing provider plugins...
     - Finding hashicorp/azurerm versions matching "2.37.0"...
     - Installing hashicorp/azurerm v2.37.0...
     - Installed hashicorp/azurerm v2.37.0 (signed by HashiCorp)

     Terraform has been successfully initialized!

     You may now begin working with Terraform. Try running "terraform plan" to see any changes that are required for your infrastructure. All Terraform commands should now work.

     If you ever set or change modules or backend configuration for Terraform, rerun this command to reinitialize your working directory. If you forget, other commands will detect it and remind you to do so if necessary.
     Checking terraform formatting...
     Validating terraform...
     Success! The configuration is valid.
   ```

9. Create the AppService by typing `make install`. If you want to see what will be created prior to executing this command, type `make install TF_PLAN_ONLY=true`.

10. Verify the resource has been created by typing `make azure-webapps-list ARM_RESOURCE_GROUP="rg-our-tutorials"` and checking if the name you assigned to the variable "app_service_name" in the "tutorial.tfvars" file exists in the list.

11. To remove the new AppService, type `make uninstall`. If you want to see what will be destroyed prior to executing this command, type `make uninstall TF_PLAN_ONLY=true`.

[az-app-service]: https://azure.microsoft.com/en-us/services/app-service/
[az-app-service-plan]: https://docs.microsoft.com/en-us/azure/app-service/overview-hosting-plans
[tutorial-rg]: ../../../terraform/azure/resource-group/#readme
[tutorial-app-service-plan]: ../../../terraform/azure/app-service-plan/#readme
[terraform-azurerm]: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs
[terraform-app_service]: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/app_service
[git]: ../../../../../docs/git.md
[make]: ../../../../../docs/make.md
[docker]: ../../../../../docs/docker.md
[terraform]: https://www.terraform.io/intro/index.html
[azure-account]: https://azure.microsoft.com/en-us/free/
