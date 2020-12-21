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

**[Node.js on Azure][tutorials-node-azure]**: [![CI Terraform Azure Node.js][badge-tutorials-node-azure-infrastructure-ci]][tutorials-node-azure] [![CD Terraform Azure Node.js][badge-tutorials-node-azure-infrastructure-cd]][tutorials-node-azure] [![Node.js on Azure][badge-tutorials-node-azure-app]][tutorials-node-azure]

### Cloud Infrastructure

- **[Create a Terraform Azure Backend][tutorials-terraform-azure-backend]**: [![badge][badge-tutorials-terraform-azure-backend-create]][tutorials-terraform-azure-backend]
- **[Maintain a Terraform Azure Backend][tutorials-terraform-azure-backend]**: [![ci badge][badge-tutorials-terraform-azure-backend-maintain-ci]][tutorials-terraform-azure-backend] [![cd badge][badge-tutorials-terraform-azure-backend-maintain-cd]][tutorials-terraform-azure-backend]

- **[Terraform Azure Resource Group][tutorials-terraform-azure-rg]**: [![badge][badge-tutorials-terraform-azure-rg]][tutorials-terraform-azure-rg]
- **[Terraform Azure AppService Plan][tutorials-terraform-azure-app-service-plan]:** [![ci badge][badge-tutorials-terraform-azure-app-service-plan-ci]][tutorials-terraform-azure-app-service-plan] [![cd badge][badge-tutorials-terraform-azure-app-service-plan-cd]][tutorials-terraform-azure-app-service-plan]
- **[Terraform Azure Storage Account][tutorials-terraform-azure-storage-account]:** [![badge][badge-tutorials-terraform-azure-storage-account]][tutorials-terraform-azure-storage-account]

## Projects

- [oclif CLI][oclif-cli]: [![oclif CLI CI][oclif-cli-ci-workflow-badge]][oclif-cli] [![oclif CLI CD][oclif-cli-cd-workflow-badge]][oclif-cli]

## Docker Images

- [Docker Ubuntu Developer][docker-ubuntu]: [![Docker Ubuntu Developer CI Badge][docker-ubuntu-ci-workflow-badge]][docker-ubuntu] [![Docker Ubuntu Developer CD Badge][docker-ubuntu-cd-workflow-badge]][docker-ubuntu]
- [Docker Node Developer][docker-node]: [![Docker Node Developer CI Badge][docker-node-ci-workflow-badge]][docker-node] [![Docker Node Developer CD Badge][docker-node-cd-workflow-badge]][docker-node]
- [Docker Azure Node Developer][docker-az-node]: [![Docker Azure Node Developer CI Badge][docker-az-node-ci-workflow-badge]][docker-az-node] [![Docker Azure Node Developer CD Badge][docker-az-node-cd-workflow-badge]][docker-az-node]
- [Docker Azure Terraform Developer][docker-az-terraform]: [![Docker Azure Terraform Developer CI Badge][docker-az-terraform-ci-workflow-badge]][docker-az-terraform] [![Docker Azure Terraform Developer CD Badge][docker-az-terraform-cd-workflow-badge]][docker-az-terraform]
- [Docker Commitlint][docker-commitlint]: [![Docker Commitlint CI Badge][docker-commitlint-ci-workflow-badge]][docker-commitlint] [![Docker Commitlint CD Badge][docker-commitlint-cd-workflow-badge]][docker-commitlint]

## Contributing

Read more about [how to contribute][contributing]. Also, see our [code of conduct][code-of-conduct].

[contributing]: ./docs/CONTRIBUTING.md
[code-of-conduct]: ./docs/CODE_OF_CONDUCT.md
[patterns]: ./docs/patterns/#readme
[monorepo]: https://en.wikipedia.org/wiki/Monorepo
[badge-onboarding]: https://github.com/ourchitecture/panda/workflows/onboarding/badge.svg
[devops-onboarding]: https://github.com/ourchitecture/panda/actions?query=workflow%3AOnboarding
[badge-repo]: https://github.com/ourchitecture/panda/workflows/repo-test/badge.svg
[devops-repo]: https://github.com/ourchitecture/panda/actions?query=workflow%3A%22Repo+tests%22
[badge-commitlint]: https://github.com/ourchitecture/panda/workflows/commitlint/badge.svg
[devops-commitlint]: https://github.com/ourchitecture/panda/actions?query=workflow%3Acommitlint
[tutorials-terraform-azure-backend]: ./src/tutorials/terraform/azure/backend/#readme
[badge-tutorials-terraform-azure-backend-create]: https://github.com/ourchitecture/panda/workflows/tutorials-terraform-azure-backend-create/badge.svg
[badge-tutorials-terraform-azure-backend-maintain-ci]: https://github.com/ourchitecture/panda/workflows/tutorials-terraform-azure-backend-maintain_ci/badge.svg
[badge-tutorials-terraform-azure-backend-maintain-cd]: https://github.com/ourchitecture/panda/workflows/tutorials-terraform-azure-backend-maintain_cd/badge.svg
[tutorials-terraform-azure-rg]: ./src/tutorials/terraform/azure/resource-group/#readme
[badge-tutorials-terraform-azure-rg]: https://github.com/ourchitecture/panda/workflows/tutorials-terraform-azure-resource_group/badge.svg
[tutorials-terraform-azure-app-service-plan]: ./src/tutorials/terraform/azure/app-service-plan/#readme
[badge-tutorials-terraform-azure-app-service-plan-ci]: https://github.com/ourchitecture/panda/workflows/tutorials-terraform-azure-app_service_plan_ci/badge.svg
[badge-tutorials-terraform-azure-app-service-plan-cd]: https://github.com/ourchitecture/panda/workflows/tutorials-terraform-azure-app_service_plan_cd/badge.svg
[tutorials-terraform-azure-storage-account]: ./src/tutorials/terraform/azure/storage-account/#readme
[badge-tutorials-terraform-azure-storage-account]: https://github.com/ourchitecture/panda/workflows/tutorials-terraform-azure-storage_account/badge.svg
[tutorials-node-azure]: ./src/tutorials/node/azure/#readme
[badge-tutorials-node-azure-app]: https://github.com/ourchitecture/panda/workflows/tutorials_node-azure_app/badge.svg
[badge-tutorials-node-azure-infrastructure-ci]: https://github.com/ourchitecture/panda/workflows/tutorials_node-azure_infra_ci/badge.svg
[badge-tutorials-node-azure-infrastructure-cd]: https://github.com/ourchitecture/panda/workflows/tutorials_node-azure_infra_cd/badge.svg
[oclif-cli-ci-workflow-badge]: https://github.com/ourchitecture/panda/workflows/cli-node-oclif_ci/badge.svg
[oclif-cli-cd-workflow-badge]: https://github.com/ourchitecture/panda/workflows/cli-node-oclif_cd/badge.svg
[oclif-cli]: ./src/cli/node/oclif/#readme
[docker-ubuntu-ci-workflow-badge]: https://github.com/ourchitecture/panda/workflows/docker-devops-ubuntu_ci/badge.svg
[docker-ubuntu-cd-workflow-badge]: https://github.com/ourchitecture/panda/workflows/docker-devops-ubuntu_cd/badge.svg
[docker-ubuntu]: ./src/docker/devops/ubuntu/#readme
[docker-node-ci-workflow-badge]: https://github.com/ourchitecture/panda/workflows/docker-devops-node_ci/badge.svg
[docker-node-cd-workflow-badge]: https://github.com/ourchitecture/panda/workflows/docker-devops-node_cd/badge.svg
[docker-node]: ./src/docker/devops/node/#readme
[docker-az-node-ci-workflow-badge]: https://github.com/ourchitecture/panda/workflows/docker-devops-az-node_ci/badge.svg
[docker-az-node-cd-workflow-badge]: https://github.com/ourchitecture/panda/workflows/docker-devops-az-node_cd/badge.svg
[docker-az-node]: ./src/docker/devops/az-node/#readme
[docker-az-terraform-ci-workflow-badge]: https://github.com/ourchitecture/panda/workflows/docker-devops-az-terraform_ci/badge.svg
[docker-az-terraform-cd-workflow-badge]: https://github.com/ourchitecture/panda/workflows/docker-devops-az-terraform_cd/badge.svg
[docker-az-terraform]: ./src/docker/devops/az-terraform/#readme
[docker-commitlint-ci-workflow-badge]: https://github.com/ourchitecture/panda/workflows/docker-devops-commitlint_ci/badge.svg
[docker-commitlint-cd-workflow-badge]: https://github.com/ourchitecture/panda/workflows/docker-devops-commitlint_cd/badge.svg
[docker-commitlint]: ./src/docker/devops/commitlint/#readme
