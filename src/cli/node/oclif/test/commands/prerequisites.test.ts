import { expect, test } from '@oclif/test';

describe('prerequisites', () => {
  test
    .stdout()
    .command(['help', 'prerequisites'])
    .it('runs prerequisites', (ctx) => {
      expect(ctx.stdout)
        .to.contain('USAGE')
        .and.to.contain('OPTIONS')
        .and.to.contain('ALIASES')
        .and.to.contain('EXAMPLE');
    });
});
