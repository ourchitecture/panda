const commitlintConfig = require('./commitlint.config.js');

test('commitlint configuration', async () => {
  expect(commitlintConfig.extends).toContain('@commitlint/config-conventional');
});
