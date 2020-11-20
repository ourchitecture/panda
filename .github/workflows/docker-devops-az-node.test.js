const yaml = require('yaml');
const fs = require('fs');
const path = require('path');
const util = require('util');
const readFile = (filePath) => util.promisify(fs.readFile)(filePath, 'utf8');

async function readWorkflow() {
  const filePath = path.join(__dirname, 'docker-devops-az-node.yml');
  const contents = await readFile(filePath);
  const workflow = yaml.parse(contents);

  expect(workflow).toBeTruthy();

  console.log('workflow', JSON.stringify(workflow, null, 2));

  return workflow;
}

test('workflow', async () => {
  const workflow = await readWorkflow();

  expect(workflow).toEqual({
    name: 'Docker Azure Node Developer',
    on: 'push',
    jobs: {
      push_to_registry: {
        name: 'Push Docker image to GitHub Packages',
        env: {
          PROJECT_PATH: './src/docker/devops/az-node',
        },
        'runs-on': 'ubuntu-latest',
        steps: [
          {
            name: 'Check out the repo',
            uses: 'actions/checkout@v2',
          },
          {
            name: 'Push to GitHub Packages',
            uses: 'docker/build-push-action@v1',
            with: {
              username: '${{ secrets.CR_USERNAME }}',
              password: '${{ secrets.CR_PAT }}',
              registry: 'docker.pkg.github.com',
              repository: 'ourchitecture/patterns-and-tutorials/devops-az-node',
              tags: 'latest',
              path: '${{env.PROJECT_PATH}}',
              dockerfile: '${{env.PROJECT_PATH}}/Dockerfile',
            },
          },
        ],
      },
    },
  });
});
