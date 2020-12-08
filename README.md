# Patterns and applications

![tutorials-banner](./media/tutorial-banner.png)

[![Onboarding][badge-onboarding]][devops-onboarding] [![Repo tests][badge-repo]][devops-repo] [![commitlint][badge-commitlint]][devops-commitlint]

👋 Hello and welcome to a collaborative and applied workspace on patterns.

This ["monorepo"][monorepo] hopes to serve as a central reference for simple, end-to-end examples that you can scale from rapid prototyping out to resilient, multi-cloud, multi-region, autoscaling deployments. This is a big goal. As a result, examples will be kept as simple as possible, like "hello world"; although, we realize simplicity can be subjective.

## Patterns

Many great patterns emerge from implementations and applied experience. In fact, great implementations can be a realization of patterns, like Cloud Platforms, Kubernetes, the Open Container Initiative, HTML, etc. Sometimes, documenting and studying a pattern independently from an implementation can provide an essential summary and an opportunity for innovation free of implementation bias. Patterns can also define an implementation-agnostic solution.

Read more [about patterns][patterns].

## Tutorials

### Cloud Applications

**[Node.js on Azure][tutorials-node-azure]**: [![Terraform Azure Node.js][badge-tutorials-node-azure-infrastructure]][tutorials-node-azure] [![Node.js on Azure][badge-tutorials-node-azure-app]][tutorials-node-azure]

### Cloud Infrastructure

- **[Create a Terraform Azure Backend][tutorials-terraform-azure-backend]**: [![badge][badge-tutorials-terraform-azure-backend-create]][tutorials-terraform-azure-backend]
- **[Maintain a Terraform Azure Backend][tutorials-terraform-azure-backend]**: [![badge][badge-tutorials-terraform-azure-backend-maintain]][tutorials-terraform-azure-backend]

- **[Terraform Azure Resource Group][tutorials-terraform-azure-rg]**: [![badge][badge-tutorials-terraform-azure-rg]][tutorials-terraform-azure-rg]
- **[Terraform Azure AppService Plan][tutorials-terraform-azure-app-service-plan]:** [![badge][badge-tutorials-terraform-azure-app-service-plan]][tutorials-terraform-azure-app-service-plan]
- **[Terraform Azure Storage Account][tutorials-terraform-azure-storage-account]:** [![badge][badge-tutorials-terraform-azure-storage-account]][tutorials-terraform-azure-storage-account]

## Projects

- [oclif CLI][oclif-cli]: [![oclif CLI][oclif-cli-workflow-badge]][oclif-cli]

## Contributing

Read more about [how to contribute][contributing]. Also, see our [code of conduct][code-of-conduct].

[contributing]: ./docs/CONTRIBUTING.md
[code-of-conduct]: ./docs/CODE_OF_CONDUCT.md
[patterns]: ./docs/patterns/#readme
[monorepo]: https://en.wikipedia.org/wiki/Monorepo
[badge-onboarding]: https://github.com/ourchitecture/panda/workflows/Onboarding/badge.svg
[devops-onboarding]: https://github.com/ourchitecture/panda/actions?query=workflow%3AOnboarding
[badge-repo]: https://github.com/ourchitecture/panda/workflows/Repo%20tests/badge.svg
[devops-repo]: https://github.com/ourchitecture/panda/actions?query=workflow%3A%22Repo+tests%22
[badge-commitlint]: https://github.com/ourchitecture/panda/workflows/commitlint/badge.svg
[devops-commitlint]: https://github.com/ourchitecture/panda/actions?query=workflow%3Acommitlint
[tutorials-terraform-azure-backend]: ./src/tutorials/terraform/azure/backend/#readme
[badge-tutorials-terraform-azure-backend-create]: https://github.com/ourchitecture/panda/workflows/Tutorial:%20Create%20Terraform%20Azure%20Backend/badge.svg
[badge-tutorials-terraform-azure-backend-maintain]: https://github.com/ourchitecture/panda/workflows/Tutorial:%20Maintain%20Terraform%20Azure%20Backend/badge.svg
[tutorials-terraform-azure-rg]: ./src/tutorials/terraform/azure/resource-group/#readme
[badge-tutorials-terraform-azure-rg]: https://github.com/ourchitecture/panda/workflows/Tutorial:%20Terraform%20Azure%20Resource%20Group/badge.svg
[tutorials-terraform-azure-app-service-plan]: ./src/tutorials/terraform/azure/app-service-plan/#readme
[badge-tutorials-terraform-azure-app-service-plan]: https://github.com/ourchitecture/panda/workflows/Tutorial:%20Terraform%20Azure%20AppService%20Plan/badge.svg
[tutorials-terraform-azure-storage-account]: ./src/tutorials/terraform/azure/storage-account/#readme
[badge-tutorials-terraform-azure-storage-account]: https://github.com/ourchitecture/panda/workflows/Tutorial:%20Terraform%20Azure%20Storage%20Account/badge.svg
[tutorials-node-azure]: ./src/tutorials/node/azure/#readme
[badge-tutorials-node-azure-app]: https://github.com/ourchitecture/panda/workflows/Tutorial:%20Node.js%20on%20Azure/badge.svg
[badge-tutorials-node-azure-infrastructure]: https://github.com/ourchitecture/panda/workflows/Tutorial:%20Terraform%20Azure%20Node.js/badge.svg
[oclif-cli-workflow-badge]: https://github.com/ourchitecture/panda/workflows/CLI/badge.svg
[oclif-cli]: ./src/cli/node/oclif/#readme
