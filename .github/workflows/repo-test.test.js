const yaml = require('yaml');
const fs = require('fs');
const path = require('path');
const util = require('util');
const readFile = (filePath) => util.promisify(fs.readFile)(filePath, 'utf8');

async function readWorkflow() {
  const filePath = path.join(__dirname, 'repo-test.yml');
  const contents = await readFile(filePath);
  const workflow = yaml.parse(contents);

  expect(workflow).toBeTruthy();

  // console.log('workflow', JSON.stringify(workflow, null, 2));

  return workflow;
}

test('workflow', async () => {
  const workflow = await readWorkflow();

  expect(workflow).toEqual({
    name: 'Repo tests',
    on: 'push',
    jobs: {
      build: {
        env: { CI: true },
        'runs-on': 'ubuntu-latest',
        steps: [
          { name: 'Checkout', uses: 'actions/checkout@v2' },
          { name: 'Build', run: 'make init test' },
        ],
      },
    },
  });
});
