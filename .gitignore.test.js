const parseGitIgnore = require('parse-gitignore');
const fs = require('fs');
const path = require('path');
const util = require('util');
const readFile = (filePath) => util.promisify(fs.readFile)(filePath, 'utf8');

async function readSettings() {
  const filePath = path.join(__dirname, '.gitignore');
  const contents = await readFile(filePath);
  const gitignore = parseGitIgnore(contents);

  expect(gitignore).toBeTruthy();

  return gitignore;
}

test('.gitignore Linux settings', async () => {
  const gitignore = await readSettings();

  expect(gitignore).toContain('*~');
  expect(gitignore).toContain('.fuse_hidden*');
  expect(gitignore).toContain('.directory');
  expect(gitignore).toContain('.Trash-*');
  expect(gitignore).toContain('.nfs*');
});

test('.gitignore macOS settings', async () => {
  const gitignore = await readSettings();

  expect(gitignore).toContain('.DS_Store');
  expect(gitignore).toContain('.AppleDouble');
  expect(gitignore).toContain('.LSOverride');
  expect(gitignore).toContain('._*');
  expect(gitignore).toContain('.DocumentRevisions-V100');
  expect(gitignore).toContain('.fseventsd');
  expect(gitignore).toContain('.Spotlight-V100');
  expect(gitignore).toContain('.TemporaryItems');
  expect(gitignore).toContain('.Trashes');
  expect(gitignore).toContain('.VolumeIcon.icns');
  expect(gitignore).toContain('.com.apple.timemachine.donotpresent');
  expect(gitignore).toContain('.AppleDB');
  expect(gitignore).toContain('.AppleDesktop');
  expect(gitignore).toContain('Network Trash Folder');
  expect(gitignore).toContain('Temporary Items');
  expect(gitignore).toContain('.apdisk');
});

test('.gitignore Windows settings', async () => {
  const gitignore = await readSettings();

  expect(gitignore).toContain('Thumbs.db');
  expect(gitignore).toContain('Thumbs.db:encryptable');
  expect(gitignore).toContain('ehthumbs.db');
  expect(gitignore).toContain('ehthumbs_vista.db');
  expect(gitignore).toContain('*.stackdump');
  expect(gitignore).toContain('[Dd]esktop.ini');
  expect(gitignore).toContain('$RECYCLE.BIN/');
  expect(gitignore).toContain('*.cab');
  expect(gitignore).toContain('*.msi');
  expect(gitignore).toContain('*.msix');
  expect(gitignore).toContain('*.msm');
  expect(gitignore).toContain('*.msp');
  expect(gitignore).toContain('*.lnk');
});

test('.gitignore VisualStudioCode settings', async () => {
  const gitignore = await readSettings();

  expect(gitignore).toContain('.vscode/*');
  expect(gitignore).toContain('!.vscode/settings.json');
  expect(gitignore).toContain('!.vscode/tasks.json');
  expect(gitignore).toContain('!.vscode/launch.json');
  expect(gitignore).toContain('!.vscode/extensions.json');
  expect(gitignore).toContain('*.code-workspace');
  expect(gitignore).toContain('.history/');
});

test('.gitignore Node settings', async () => {
  const gitignore = await readSettings();

  expect(gitignore).toContain('logs');
  expect(gitignore).toContain('*.log');
  expect(gitignore).toContain('npm-debug.log*');
  expect(gitignore).toContain('yarn-debug.log*');
  expect(gitignore).toContain('yarn-error.log*');
  expect(gitignore).toContain('lerna-debug.log*');
  expect(gitignore).toContain('report.[0-9]*.[0-9]*.[0-9]*.[0-9]*.json');
  expect(gitignore).toContain('pids');
  expect(gitignore).toContain('*.pid');
  expect(gitignore).toContain('*.seed');
  expect(gitignore).toContain('*.pid.lock');
  expect(gitignore).toContain('lib-cov');
  expect(gitignore).toContain('coverage');
  expect(gitignore).toContain('*.lcov');
  expect(gitignore).toContain('.nyc_output');
  expect(gitignore).toContain('.grunt');
  expect(gitignore).toContain('bower_components');
  expect(gitignore).toContain('.lock-wscript');
  expect(gitignore).toContain('build/Release');
  expect(gitignore).toContain('node_modules/');
  expect(gitignore).toContain('jspm_packages/');
  expect(gitignore).toContain('web_modules/');
  expect(gitignore).toContain('*.tsbuildinfo');
  expect(gitignore).toContain('.npm');
  expect(gitignore).toContain('.eslintcache');
  expect(gitignore).toContain('.rpt2_cache/');
  expect(gitignore).toContain('.rts2_cache_cjs/');
  expect(gitignore).toContain('.rts2_cache_es/');
  expect(gitignore).toContain('.rts2_cache_umd/');
  expect(gitignore).toContain('.node_repl_history');
  expect(gitignore).toContain('*.tgz');
  expect(gitignore).toContain('.yarn-integrity');
  expect(gitignore).toContain('.env');
  expect(gitignore).toContain('.env.test');
  expect(gitignore).toContain('.cache');
  expect(gitignore).toContain('.parcel-cache');
  expect(gitignore).toContain('.next');
  expect(gitignore).toContain('out');
  expect(gitignore).toContain('.nuxt');
  expect(gitignore).toContain('dist');
  expect(gitignore).toContain('.cache/');
  expect(gitignore).toContain('.vuepress/dist');
  expect(gitignore).toContain('.serverless/');
  expect(gitignore).toContain('.fusebox/');
  expect(gitignore).toContain('.dynamodb/');
  expect(gitignore).toContain('.tern-port');
  expect(gitignore).toContain('.vscode-test');
  expect(gitignore).toContain('.yarn/cache');
  expect(gitignore).toContain('.yarn/unplugged');
  expect(gitignore).toContain('.yarn/build-state.yml');
  expect(gitignore).toContain('.yarn/install-state.gz');
  expect(gitignore).toContain('.pnp.*');
});
