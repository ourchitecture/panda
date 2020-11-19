const packageConfig = require('./package.json');

test('package.json scripts', async () => {
  expect(packageConfig.scripts).toBeTruthy();
  expect(packageConfig.scripts.test).toBe('jest');
  expect(packageConfig.scripts.commit).toBe('commit');
});

test('package.json husky', async () => {
  expect(packageConfig.husky).toBeTruthy();

  expect(packageConfig.husky.hooks).toBeTruthy();
  expect(packageConfig.husky.hooks['commit-msg']).toBeTruthy();
  expect(packageConfig.husky.hooks['commit-msg']).toBe(
    'commitlint -E HUSKY_GIT_PARAMS'
  );
});

test('package.json devDepencencies', async () => {
  expect(packageConfig.devDependencies).toBeTruthy();

  // testing
  expect(packageConfig.devDependencies['@types/jest']).toBeTruthy();
  expect(packageConfig.devDependencies['jest']).toBeTruthy();

  // git ignore
  expect(packageConfig.devDependencies['parse-gitignore']).toBeTruthy();

  // editor configuration
  expect(packageConfig.devDependencies['editorconfig']).toBeTruthy();

  // documentation
  expect(packageConfig.devDependencies['markdown-it']).toBeTruthy();
});
