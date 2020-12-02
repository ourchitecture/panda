# @ourchitecture/oclif-cli

Ourchitecture CLI

[![oclif](https://img.shields.io/badge/cli-oclif-brightgreen.svg)](https://oclif.io)
[![Version](https://img.shields.io/npm/v/@ourchitecture/oclif-cli.svg)](https://npmjs.org/package/@ourchitecture/oclif-cli)
[![Downloads/week](https://img.shields.io/npm/dw/@ourchitecture/oclif-cli.svg)](https://npmjs.org/package/@ourchitecture/oclif-cli)
[![License](https://img.shields.io/npm/l/@ourchitecture/oclif-cli.svg)](https://github.com/ourchitecture/patterns-and-tutorials/blob/master/package.json)

<!-- toc -->

- [Usage](#usage)
- [Commands](#commands)
<!-- tocstop -->

# Usage

<!-- usage -->

```sh-session
$ npm install -g @ourchitecture/oclif-cli
$ our COMMAND
running command...
$ our (-v|--version|version)
@ourchitecture/oclif-cli/0.0.1 linux-x64 node-v14.4.0
$ our --help [COMMAND]
USAGE
  $ our COMMAND
...
```

<!-- usagestop -->

# Commands

<!-- commands -->

- [`our hello [FILE]`](#our-hello-file)
- [`our help [COMMAND]`](#our-help-command)

## `our hello [FILE]`

describe the command here

```
USAGE
  $ our hello [FILE]

OPTIONS
  -f, --force
  -h, --help       show CLI help
  -n, --name=name  name to print

EXAMPLE
  $ our hello
  hello world from ./src/hello.ts!
```

_See code: [src/commands/hello.ts](https://github.com/ourchitecture/patterns-and-tutorials/blob/v0.0.1/src/commands/hello.ts)_

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

_See code: [@oclif/plugin-help](https://github.com/oclif/plugin-help/blob/v3.2.0/src/commands/help.ts)_

<!-- commandsstop -->
