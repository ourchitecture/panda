const packageConfig = require('./package.json');

test('package.json scripts', async () => {
  expect(packageConfig.scripts).toBeUndefined();
});

test('package.json husky', async () => {
  expect(packageConfig.husky).toBeTruthy();

  expect(packageConfig.husky.hooks).toBeTruthy();

  expect(packageConfig.husky.hooks['pre-commit']).toBeTruthy();
  expect(packageConfig.husky.hooks['pre-commit']).toBe('lint-staged');

  expect(packageConfig.husky.hooks['commit-msg']).toBeTruthy();
  expect(packageConfig.husky.hooks['commit-msg']).toBe(
    'commitlint -E HUSKY_GIT_PARAMS'
  );
});

test('package.json devDepencencies', async () => {
  expect(packageConfig.devDependencies).toEqual({
    '@commitlint/cli': '^11.0.0',
    '@commitlint/config-conventional': '^11.0.0',
    '@commitlint/prompt-cli': '^11.0.0',
    '@types/jest': '^26.0.15',
    editorconfig: '^0.15.3',
    husky: '^4.3.0',
    jest: '^26.6.3',
    'lint-staged': '^10.5.1',
    'markdown-it': '^12.0.2',
    mrm: '^2.5.12',
    'parse-gitignore': '^1.0.1',
    prettier: '^2.2.1',
    typescript: '^4.1.3',
    yaml: '^1.10.0',
  });
});
