# Contributing

👋 We are excited that you are considering contributing to the patterns and tutorials project. Please see our [code of conduct](./CODE_OF_CONDUCT.md)

## Ways to contribute

- Submit a question, idea, bug or other issue to the [GitHub Issues][project-issues] list.
- Suggest changes to documentation
- Make a code contribution

## Documentation Contributions

Project documentation is treated as code, but that shouldn't stop you. Review existing ["documentation" issues][project-issues-docs] or submit your own. The community can help you make a change.

## Code Contributions

Review any [open issues][project-issues] or submit your own.

- Maintainers are the primary project contributors that support and guide the projects
- External contributors is any person interested in improving the projects

In addition to the Slack channel, Wiki, and GitHub Issues mentioned above, you may find the following links useful:

- "./makefile" describes tasks to build and test this project consistently on any machine
- "./.github/CODEOWNERS" identifies maintainers for areas within this project
- "./.github/workflows/" contains files for automating DevOps workflows
- "./package.json" contains root project and developer dependencies

### Prerequisites

- [git tools][git] (`git`, `gh`, `git-town`)
- [Node.js and Yarn][nodejs] (`node`, `npm`, `yarn`)
- [GNU `make`][make]
- [Visual Studio `code`][vscode]

#### Coding Standards

- Keep pull requests small (i.e. a few hundred lines for a small feature or a small, functional part of a larger feature)
- Pull requests are configured to _automatically delete head branches after merging_. Once a PR is finalized for merge, the default process is to merge and delete the feature branch. This might be a new way of working for you. If a PR was merged and a change is necessary (e.g. bug, documentation issue, etc.), simply create a new feature branch (e.g. `[user-name]/fix-[feature]`), make your changes and submit a new PR with the change.
- Commit messages must follow the open standard for ["conventional commits"][conventional-commits]. These are enforced with [`commitlint`][commitlint] during local developer commits with [githooks][git-hooks] and [`husky`][husky] as well as in GitHub Actions workflows for branches and pull requests.
- File formatting styles across projects are enforced with [`prettier`][prettier] using VS Code extensions, [githooks][git-hooks] and [`husky`][husky] as well as in GitHub Actions workflows for branches and pull requests. There are also githooks that attempt to auto-format staged files on your behalf during a commit to avoid failing builds.
- General project testing is executed with [Jest][jest]. However, individual tutorials may use alternatives (e.g. `JUnit` for Java, `unittest` for Python, `XUnit` or `NUnit` for .NET, etc.).

#### Setup

##### Maintainers

1. Clone this repo: `git clone https://github.com/ourchitecture/patterns-and-tutorials/`
2. Run `make` to install dependencies and test the project
3. Create a new feature branch (e.g. using "git town" with `git town hack [user-name]/[feature-name]`), where `[user-name]` is your username and `[feature-name]` is the feature
4. Make your edits and commit your changes locally
5. Use `git town sync` to push your changes to your personal feature branch
6. Submit a new pull request (PR) from your personal feature branch back to the main branch as early as your first change (e.g. `gh pr create -f -w` or `git town new-pull-request`)
7. Continuous integration (CI) will validate your changes (see "./.github/workflows/\*.yml")
8. Work with the other project maintainer(s) on any required edits
9. Once your changes pass CI and your PR is approved, it will be merged
10. Once a PR is merged, Continuous Deployment and Release will publish your changes to Azure

##### External Contributors

1. [_Fork_ this repo][project-fork] to your personal space
2. Clone your personal fork of repo: e.g. `git clone https://github.com/[user-name]/patterns-and-tutorials/`, where `[user-name]` is your username
3. Run `make` to install dependencies and test the project
4. Create a new feature branch in your personal fork (e.g. using "git town" with `git town hack [feature-name]`), where `[feature-name]` is the feature
5. Make your edits and commit your changes locally
6. Push your changes to your personal feature branch in your personal repo
7. Submit a new pull request (PR) from your personal feature branch back to the main repo branch as early as your first change (e.g. `gh pr create -f -w` or `git town new-pull-request`)
8. Continuous integration (CI) will validate your changes (see "./.github/workflows/\*.yml")
9. Work with the other project maintainer(s) on any required edits
10. Once your changes pass CI and your PR is approved, it will be merged
11. Once a PR is merged, Continuous Deployment and Release will publish your changes to Azure

## DevOps Tasks

Checkout all of the coding project tasks in "./package.json" as well as the DevOps automation tasks in "./makefile". DevOps workflows uses GitHub Actions "./.github/workflows/\*.yml" to execute these same tasks.

### makefile

- `make init`: initializes the project
- `make commit`: will provide an interactive prompt for typing commit messages that conform to [conventional commit format][conventional-commits]
- `make commitlint-check`: validates commit messages conform to [conventional commit format][conventional-commits]
- `make check`: validates file formatting conforms to [prettier configuration][prettier], [terraform standards][terraform-format] and executes project tests with [jest][jest]
- `make format`: automatically formats files that conforms to [prettier configuration][prettier] and [terraform standards][terraform-format]

[project-issues]: https://github.com/ourchitecture/patterns-and-tutorials/issues
[project-issues-docs]: https://github.com/ourchitecture/patterns-and-tutorials/labels/documentation
[project-fork]: https://github.com/ourchitecture/patterns-and-tutorials/fork
[git]: ../src/tools/git/#readme
[nodejs]: ../src/runtimes/node/#readme
[make]: ../src/tools/make/#readme
[vscode]: ../src/editors/vscode/#readme
[conventional-commits]: https://www.conventionalcommits.org/en/v1.0.0/
[commitlint]: https://commitlint.js.org/
[husky]: https://github.com/typicode/husky#husky
[git-hooks]: https://git-scm.com/docs/githooks
[jest]: https://jestjs.io/
[prettier]: https://prettier.io/
[terraform-format]: https://www.terraform.io/docs/commands/fmt.html
