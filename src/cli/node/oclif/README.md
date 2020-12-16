# @ourchitecture/panda-cli

Ourchitecture Panda CLI

[![oclif](https://img.shields.io/badge/cli-oclif-brightgreen.svg)](https://oclif.io)
[![Version](https://img.shields.io/npm/v/@ourchitecture/oclif-cli.svg)](https://npmjs.org/package/@ourchitecture/oclif-cli)
[![Downloads/week](https://img.shields.io/npm/dw/@ourchitecture/oclif-cli.svg)](https://npmjs.org/package/@ourchitecture/oclif-cli)
[![License](https://img.shields.io/npm/l/@ourchitecture/oclif-cli.svg)](https://github.com/ourchitecture/panda/blob/master/package.json)

<!-- toc -->

- [@ourchitecture/panda-cli](#ourchitecturepanda-cli)
- [Usage](#usage)
- [Commands](#commands)
<!-- tocstop -->

# Usage

<!-- usage -->

```sh-session
$ npm install -g @ourchitecture/panda-cli
$ panda COMMAND
running command...
$ panda (-v|--version|version)
@ourchitecture/panda-cli/0.0.1 linux-x64 node-v14.15.1
$ panda --help [COMMAND]
USAGE
  $ panda COMMAND
...
```

<!-- usagestop -->

# Commands

<!-- commands -->

- [`panda hello [FILE]`](#panda-hello-file)
- [`panda help [COMMAND]`](#panda-help-command)

## `panda hello [FILE]`

describe the command here

```
USAGE
  $ panda hello [FILE]

OPTIONS
  -f, --force
  -h, --help       show CLI help
  -n, --name=name  name to print

EXAMPLE
  $ panda hello
  hello world from ./src/hello.ts!
```

_See code: [src/commands/hello.ts](https://github.com/ourchitecture/panda/blob/v0.0.1/src/commands/hello.ts)_

## `panda help [COMMAND]`

display help for panda

```
USAGE
  $ panda help [COMMAND]

ARGUMENTS
  COMMAND  command to show help for

OPTIONS
  --all  see all commands in CLI
```

_See code: [@oclif/plugin-help](https://github.com/oclif/plugin-help/blob/v3.2.0/src/commands/help.ts)_

<!-- commandsstop -->
