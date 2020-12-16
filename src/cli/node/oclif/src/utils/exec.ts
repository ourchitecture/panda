import * as childProcess from 'child_process';

export const execAndRead = (
  command: string,
  commandArguments: string[],
  logCommand = true,
  throwErrorOnNonZeroExitCode = true
) => {
  const commandAndArguments =
    command +
    (commandArguments.length === 0 ? '' : ` ${commandArguments.join(' ')}`);

  if (logCommand) {
    console.log(commandAndArguments);
  }

  const cmd = childProcess.spawnSync(command, commandArguments, {
    cwd: process.cwd(),
    encoding: 'utf-8',
    env: process.env,
    stdio: 'pipe',
  });

  if (cmd.error) {
    // console.debug(`${command} Error. Process returned with ${cmd.status}`, cmd.output);
    throw cmd.error;
  }

  if (cmd.status !== 0 && throwErrorOnNonZeroExitCode) {
    // console.debug(`${command} did not exit successfully with ${cmd.status}`, cmd.output);
    throw new Error(cmd.output.join('\n'));
  }

  // console.debug(commandAndArguments, cmd.output);

  return {
    exitCode: cmd.status,
    output: cmd.output,
  };
};
