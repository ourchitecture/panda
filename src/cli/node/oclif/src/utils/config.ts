import * as path from 'path';

import * as YAML from 'yaml';
import * as TOML from 'toml';

import * as semver from 'semver';

import Ajv, { Options as AjvOptions } from 'ajv';

import { readFile } from './fs';

type ConfigurationPrerequisite = {
  type: string;
  command: string;
  min: number;
};

type Configuration = {
  version: string;
  prerequisites: ConfigurationPrerequisite[];
};

const checkBasicConfigValidation = (configFilePath: string, config: any) => {
  if (!config.version) {
    throw new Error(
      `Configuration is missing expected "version": ${configFilePath}`
    );
  }

  const versionType = typeof config.version;

  if (versionType !== 'string' && versionType !== 'number') {
    const versionArticle =
      ['a', 'e', 'i', 'o', 'u'].indexOf(versionType[0]) >= 0 ? 'an' : 'a';
    throw new Error(
      `Configuration "version" was expected to be a string or a number, but was ${versionArticle} ${versionType}: ${configFilePath}`
    );
  }

  if (!semver.eq(config.version as string, '0.0.1')) {
    throw new Error(
      `Configuration "version" expected to be "0.0.1", but was "${config.version}": ${configFilePath}`
    );
  }
};

export const parseConfig = async (configFilePath: string) => {
  const configFileContent = await readFile(configFilePath, {
    encoding: 'utf8',
  });

  // this.log('configFileContent', configFileContent);

  const configFileExt = path.extname(configFilePath);

  let config: any = {};

  switch (configFileExt) {
    case '.json':
      config = JSON.parse(configFileContent);
      break;
    case '.yaml':
      config = YAML.parse(configFileContent);
      break;
    case '.toml':
      config = JSON.parse(JSON.stringify(TOML.parse(configFileContent)));
      break;
    default:
      throw new Error(`Unexpected configuration file type: ${configFileExt}`);
  }

  // this.log('config', config);

  checkBasicConfigValidation(configFilePath, config);

  return config;
};

export const validateConfiguration = async (config: any) => {
  const configSchemaFileName = 'config.schema.json';
  const configSchemaFilePath = path.join(
    __dirname,
    '../',
    configSchemaFileName
  );

  const configSchemaContent = await readFile(configSchemaFilePath, {
    encoding: 'utf8',
  });

  const configSchema = JSON.parse(configSchemaContent);

  const ajvOptions: AjvOptions = {
    strict: true,
    useDefaults: false,
  };

  const ajv = new Ajv(ajvOptions);

  const validate = ajv.compile<Configuration>(configSchema);
  const isValid = validate(config);

  return {
    isValid: isValid,
    errors: validate.errors,
  };
};
