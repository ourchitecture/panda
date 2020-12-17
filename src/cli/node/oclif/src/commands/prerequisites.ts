import { Command, flags } from '@oclif/command';

import * as path from 'path';
import * as which from 'which';

import { findFirstFileUp } from '../utils/fs';
import { execAndRead } from '../utils/exec';
import { parseConfig } from '../utils/config';

export default class Prerequisites extends Command {
  static description =
    "checks the project's prerequisite requirements for your local machine";

  static examples = [`$ our prerequisites`];

  static flags = {
    help: flags.help({ char: 'h' }),
  };

  static aliases = ['needs'];

  async run() {
    const configFileNames = ['our.yaml', 'our.json', 'our.toml'];

    const configFileSearchResult = await findFirstFileUp(configFileNames);

    if (!configFileSearchResult.exists) {
      this.log(
        `Missing a required "our" configuration file of type:`,
        configFileNames
      );
      return;
    }

    const configFilePath = path.resolve(configFileSearchResult.path as string);

    // this.log('config path', configFilePath);

    const config = await parseConfig(configFilePath);

    // const configValidation = await validateConfiguration(config);

    // if (!configValidation.isValid) {
    //   throw new Error(
    //     'Invalid configuration: ' +
    //       JSON.stringify({
    //         path: configFilePath,
    //         errors: configValidation.errors,
    //       })
    //   );
    // }

    config.prerequisites.forEach((prerequisite: any) => {
      // this.log('pre', prerequisite);

      const commandResolution = which.sync(prerequisite.command, {
        nothrow: true,
      });

      if (!commandResolution) {
        throw new Error(
          `Unmet prerequisite: command not found "${prerequisite.command}"`
        );
      }

      const commandResult = execAndRead(
        prerequisite.command,
        prerequisite.argv,
        false,
        false
      );

      const fullCommand = [prerequisite.command, ...prerequisite.argv].join(
        ' '
      );

      if (commandResult.exitCode !== 0) {
        throw new Error(`Unmet prerequisite: command failed "${fullCommand}"`);
      }

      const commandOutput = commandResult.output
        .map((line) => (line ? line.trim() : ''))
        .join('');

      const versionRegExp = /\d+[.]\d+/g;
      const versionMatches = versionRegExp.exec(commandOutput);

      if (!versionMatches) {
        throw new Error(
          `Unmet prerequisite: version not found "${fullCommand}" when searching for the pattern "${versionRegExp}" in the output`
        );
      }

      const version = Number.parseFloat(versionMatches[0]);
      const min = Number.parseFloat(prerequisite.min);

      if (version < min) {
        throw new Error(
          `Unmet prerequisite: old version "${fullCommand}" should be at least ${prerequisite.min}, but was ${commandOutput}`
        );
      }
    });

    this.log('Success!');
  }
}
