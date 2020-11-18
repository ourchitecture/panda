const yaml = require('yaml');
const fs = require('fs');
const path = require('path');
const util = require('util');
const readFile = (filePath) => util.promisify(fs.readFile)(filePath, 'utf8');

async function readSettings() {
  const filePath = path.join(__dirname, 'settings.yml');
  const contents = await readFile(filePath);
  const settings = yaml.parse(contents);

  expect(settings).toBeTruthy();

  // console.log('settings', JSON.stringify(settings, null, 2));

  return settings;
}

test('github settings: repository', async () => {
  const settings = await readSettings();

  expect(settings.repository).toBeTruthy();

  expect(settings.repository.name).toBe('patterns-and-tutorials');

  expect(settings.repository.description).toBe(
    'Simple, end-to-end examples that can scale.'
  );

  expect(settings.repository.homepage).toBe(
    'https://github.com/ourchitecture/patterns-and-tutorials'
  );

  expect(settings.repository.topics).toBe('patterns, tutorials');

  expect(settings.repository.private).toBe(false);
  expect(settings.repository.has_issues).toBe(true);
  expect(settings.repository.has_projects).toBe(false);
  expect(settings.repository.has_wiki).toBe(false);
  expect(settings.repository.has_downloads).toBe(false);
  expect(settings.repository.default_branch).toBe('main');
  expect(settings.repository.allow_squash_merge).toBe(true);
  expect(settings.repository.allow_merge_commit).toBe(false);
  expect(settings.repository.allow_rebase_merge).toBe(false);
  expect(settings.repository.delete_branch_on_merge).toBe(true);
});

test('github settings: labels', async () => {
  const settings = await readSettings();

  expect(settings.labels).toBeTruthy();

  expect(settings.labels).toContainEqual({
    name: 'bug',
    color: '#d73a4a',
    description: '🐛 something is not working properly',
  });

  expect(settings.labels).toContainEqual({
    name: 'documentation',
    color: '#0075ca',
    description: '📄 helpful information',
  });

  expect(settings.labels).toContainEqual({
    name: 'enhancement',
    color: '#a2eeef',
    description: '✨ a new feature or request',
  });
});

test('github settings: milestones', async () => {
  const settings = await readSettings();

  expect(settings.milestones).toBeTruthy();

  expect(settings.milestones).toContainEqual({
    title: 'Establish project',
    description: 'Tasks to establish the project',
    state: 'open',
  });
});

test('github settings: branches', async () => {
  const settings = await readSettings();

  expect(settings.branches).toBeTruthy();

  expect(settings.branches).toContainEqual({
    name: 'main',
    protection: {
      enforce_admins: false,
      required_pull_request_reviews: {
        dismiss_stale_reviews: true,
        dismissal_restrictions: { teams: [], users: [] },
        require_code_owner_reviews: true,
        required_approving_review_count: 1,
      },
      required_signatures: true,
      required_status_checks: { contexts: [], strict: true },
      restrictions: { apps: [], teams: [], users: [] },
    },
  });
});
