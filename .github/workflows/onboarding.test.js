const yaml = require('yaml');
const fs = require('fs');
const path = require('path');
const util = require('util');
const readFile = (filePath) => util.promisify(fs.readFile)(filePath, 'utf8');

async function readWorkflow() {
  const filePath = path.join(__dirname, 'onboarding.yml');
  const contents = await readFile(filePath);
  const workflow = yaml.parse(contents);

  expect(workflow).toBeTruthy();

  // console.log('workflow', JSON.stringify(workflow, null, 2));

  return workflow;
}

test('workflow', async () => {
  const workflow = await readWorkflow();

  expect(workflow).toEqual({
    name: 'Onboarding',
    on: {
      push: {
        branches: ['main'],
      },
    },
    jobs: {
      'nix-build': {
        env: {
          CI: true,
        },
        strategy: {
          matrix: {
            os: ['ubuntu-latest', 'macos-latest'],
          },
        },
        'runs-on': '${{ matrix.os }}',
        steps: [
          {
            name: 'Checkout',
            uses: 'actions/checkout@v2',
          },
          {
            name: 'Build',
            run: 'make init lint test',
          },
        ],
      },
    },
  });
});
