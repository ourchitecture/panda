const packageConfig = require('./package.json');

test('package.json config', async () => {
  expect(packageConfig.scripts).toBeTruthy();
  expect(packageConfig.scripts.test).toBe('jest');

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
