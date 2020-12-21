# Node.js runtime

[Node.js][nodejs] is used to execute Javascript in a variety of ways including simple scripting, command-line utilities, web servers for services and websites, CRON jobs, etc. Node.js comes with the `node` CLI, `npm` for package management, and `npx` for easily executing utility programs written for Node.js.

[Node Version Manager (`nvm`)][nvm-cli] enables you to quickly switch between versions of Node.js.

[Yarn][yarn] improves the Node.js experience as "a package manager that doubles down as project manager".

This repository broadly uses Node.js and Yarn for linting and testing the project. See the tasks executed in the root "./makefile" for examples.

Learn more about:

- [`node`][node-cli]
- [`npm`][npm-cli]
- [`npx`][npx-cli]
- [`nvm`][nvm-cli]
- [`yarn`][yarn-cli]

[nodejs]: https://nodejs.org/en/
[yarn]: https://classic.yarnpkg.com/en/docs/install/
[yarn-cli]: https://classic.yarnpkg.com/en/docs/cli/
[node-cli]: https://nodejs.org/api/cli.html
[npm-cli]: https://docs.npmjs.com/cli/
[npx-cli]: https://www.npmjs.com/package/npx
[nvm-cli]: https://github.com/nvm-sh/nvm#readme
