const jestConfig = require('./jest.config.js');

test('jest configuration', async () => {
  expect(jestConfig.clearMocks).toBe(true);
  expect(jestConfig.coverageDirectory).toBe('coverage');
  expect(jestConfig.coverageProvider).toBe('v8');
  expect(jestConfig.testEnvironment).toBe('node');
});
