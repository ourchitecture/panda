# Patterns and Tutorials

[![Onboarding][badge-onboarding]][devops-onboarding] [![Repo tests][badge-repo]][devops-repo] [![commitlint][badge-commitlint]][devops-commitlint]

👋 Hello and welcome to a collaborative architecture workspace on patterns and tutorials.

This ["monorepo"][monorepo] repository hopes to serve as a central reference for simple, end-to-end examples that you can scale from rapid prototyping out to resilient, multi-cloud, multi-region, autoscaling deployments. This is a big goal. As a result, examples will be kept as simple as possible, like "hello world"; although, we realize simplicity can be subjective.

## Tutorials

- [![Terraform Azure Resource Group][badge-tutorials-terraform-azure-rg]][tutorials-terraform-azure-rg]
- [![Terraform Azure AppService Plan][badge-tutorials-terraform-azure-app-service-plan]][tutorials-terraform-azure-app-service-plan]
- [![Terraform Azure Storage Account][badge-tutorials-terraform-azure-storage-account]][tutorials-terraform-azure-storage-account]
- [![Node.js on Azure][badge-tutorials-node-azure]][tutorials-node-azure]

## Projects

- [![oclif CLI][oclif-cli-workflow-badge]][oclif-cli]

## Contributing

Read more about [how to contribute][contributing]. Also, see our [code of conduct][code-of-conduct].

[contributing]: ./docs/CONTRIBUTING.md
[code-of-conduct]: ./docs/CODE_OF_CONDUCT.md
[monorepo]: https://en.wikipedia.org/wiki/Monorepo
[badge-onboarding]: https://github.com/ourchitecture/patterns-and-tutorials/workflows/Onboarding/badge.svg
[devops-onboarding]: https://github.com/ourchitecture/patterns-and-tutorials/actions?query=workflow%3AOnboarding
[badge-repo]: https://github.com/ourchitecture/patterns-and-tutorials/workflows/Repo%20tests/badge.svg
[devops-repo]: https://github.com/ourchitecture/patterns-and-tutorials/actions?query=workflow%3A%22Repo+tests%22
[badge-commitlint]: https://github.com/ourchitecture/patterns-and-tutorials/workflows/commitlint/badge.svg
[devops-commitlint]: https://github.com/ourchitecture/patterns-and-tutorials/actions?query=workflow%3Acommitlint
[tutorials-terraform-azure-rg]: ./src/tutorials/terraform/azure/resource-group/#readme
[badge-tutorials-terraform-azure-rg]: https://github.com/ourchitecture/patterns-and-tutorials/workflows/Tutorial:%20Terraform%20Azure%20Resource%20Group/badge.svg
[tutorials-terraform-azure-app-service-plan]: ./src/tutorials/terraform/azure/app-service-plan/#readme
[badge-tutorials-terraform-azure-app-service-plan]: https://github.com/ourchitecture/patterns-and-tutorials/workflows/Tutorial:%20Terraform%20Azure%20AppService%20Plan/badge.svg
[tutorials-terraform-azure-storage-account]: ./src/tutorials/terraform/azure/storage-account/#readme
[badge-tutorials-terraform-azure-storage-account]: https://github.com/ourchitecture/patterns-and-tutorials/workflows/Tutorial:%20Terraform%20Azure%20Storage%20Account/badge.svg
[tutorials-node-azure]: ./src/tutorials/node/azure/app/#readme
[badge-tutorials-node-azure]: https://github.com/ourchitecture/patterns-and-tutorials/workflows/Tutorial:%20Node.js%20on%20Azure/badge.svg
[oclif-cli-workflow-badge]: https://github.com/ourchitecture/patterns-and-tutorials/workflows/CLI/badge.svg
[oclif-cli]: ./src/cli/node/oclif/#readme
