# @ourchitecture/panda-cli

Ourchitecture Panda CLI

[![oclif](https://img.shields.io/badge/cli-oclif-brightgreen.svg)](https://oclif.io)
[![Version](https://img.shields.io/npm/v/@ourchitecture/oclif-cli.svg)](https://npmjs.org/package/@ourchitecture/oclif-cli)
[![Downloads/week](https://img.shields.io/npm/dw/@ourchitecture/oclif-cli.svg)](https://npmjs.org/package/@ourchitecture/oclif-cli)
[![License](https://img.shields.io/npm/l/@ourchitecture/oclif-cli.svg)](https://github.com/ourchitecture/panda/blob/master/package.json)

<!-- toc -->
* [@ourchitecture/panda-cli](#ourchitecturepanda-cli)
* [Usage](#usage)
* [Commands](#commands)
<!-- tocstop -->

# Usage

<!-- usage -->
```sh-session
$ npm install -g @ourchitecture/our-cli
$ our COMMAND
running command...
$ our (-v|--version|version)
@ourchitecture/our-cli/0.0.1 linux-x64 node-v14.15.1
$ our --help [COMMAND]
USAGE
  $ our COMMAND
...
```
<!-- usagestop -->

# Commands

<!-- commands -->
* [`our autocomplete [SHELL]`](#our-autocomplete-shell)
* [`our commands`](#our-commands)
* [`our help [COMMAND]`](#our-help-command)
* [`our prerequisites`](#our-prerequisites)

## `our autocomplete [SHELL]`

display autocomplete installation instructions

```
USAGE
  $ our autocomplete [SHELL]

ARGUMENTS
  SHELL  shell type

OPTIONS
  -r, --refresh-cache  Refresh cache (ignores displaying instructions)

EXAMPLES
  $ our autocomplete
  $ our autocomplete bash
  $ our autocomplete zsh
  $ our autocomplete --refresh-cache
```

_See code: [@oclif/plugin-autocomplete](https://github.com/oclif/plugin-autocomplete/blob/v0.2.1/src/commands/autocomplete/index.ts)_

## `our commands`

list all the commands

```
USAGE
  $ our commands

OPTIONS
  -h, --help              show CLI help
  -j, --json              display unfiltered api data in json format
  -x, --extended          show extra columns
  --columns=columns       only show provided columns (comma-separated)
  --csv                   output is csv format [alias: --output=csv]
  --filter=filter         filter property by partial string matching, ex: name=foo
  --hidden                show hidden commands
  --no-header             hide table header from output
  --no-truncate           do not truncate output to fit screen
  --output=csv|json|yaml  output in a more machine friendly format
  --sort=sort             property to sort by (prepend '-' for descending)
```

_See code: [@oclif/plugin-commands](https://github.com/oclif/plugin-commands/blob/v1.3.0/src/commands/commands.ts)_

## `our help [COMMAND]`

display help for our

```
USAGE
  $ our help [COMMAND]

ARGUMENTS
  COMMAND  command to show help for

OPTIONS
  --all  see all commands in CLI
```

_See code: [@oclif/plugin-help](https://github.com/oclif/plugin-help/blob/v3.2.1/src/commands/help.ts)_

## `our prerequisites`

checks the project's prerequisite requirements for your local machine

```
USAGE
  $ our prerequisites

OPTIONS
  -h, --help  show CLI help

ALIASES
  $ our needs

EXAMPLE
  $ our prerequisites
```

_See code: [src/commands/prerequisites.ts](https://github.com/ourchitecture/panda/blob/v0.0.1/src/commands/prerequisites.ts)_
<!-- commandsstop -->
