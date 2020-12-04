# Tutorials: Terraform Azure for Node.js

It can be useful to have the cloud infrastructure unique to each application in a localized "./infrastructure" directory like this. However, a large system will usually also share cloud resources across applications. For example, in Azure, an [AppService Plan][az-app-service-plan] can host multiple applications.

Running Node.js on Azure requires a unique [AppService][az-appservice] instance. However, the Azure CLI can dynamically create this instance for us when running the command `az webapp up...`. Alternatively, terraform could create and manage the configuration of this AppService instance to ensure settings are managed explicitly through code and a DevOps lifecycle. We recommend using terraform for enterprise systems.

_\*Coming Soon: Terraform Azure AppService tutorial._

Because AppService Plans are shared by other tutorials, see the [Terraform Azure AppService Plan tutorial][tutorial-app-service-plan].

[az-appservice]: https://azure.microsoft.com/en-us/services/app-service/
[az-app-service-plan]: https://docs.microsoft.com/en-us/azure/app-service/overview-hosting-plans
[tutorial-app-service-plan]: ../../../terraform/azure/app-service-plan/#readme
