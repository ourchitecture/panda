const editorconfig = require('editorconfig');
const path = require('path');

async function readConfigForFile(relativeFilePath) {
  const filePath = path.join(__dirname, relativeFilePath);

  const fileStyles = await editorconfig.parse(filePath);

  expect(fileStyles).toBeTruthy();

  // console.log('styles', fileStyles);

  return fileStyles;
}

test('.editorconfig exists and can be applied to a file', async () => {
  const fileStyles = await readConfigForFile('yarn.lock');

  expect(fileStyles.charset).toBe('utf-8');
  expect(fileStyles.trim_trailing_whitespace).toBe(true);
  expect(fileStyles.insert_final_newline).toBe(true);
  expect(fileStyles.quote_type).toBe('double');
  expect(fileStyles.indent_style).toBe('space');
  expect(fileStyles.indent_size).toBe(2);
  expect(fileStyles.tab_width).toBe(2);
  expect(fileStyles.max_line_length).toBe(80);
});

test('.editorconfig *.md settings', async () => {
  const fileStyles = await readConfigForFile('LICENSE.md');

  expect(fileStyles.charset).toBe('utf-8');
  expect(fileStyles.trim_trailing_whitespace).toBe(false);
  expect(fileStyles.insert_final_newline).toBe(true);
  expect(fileStyles.quote_type).toBe('double');
  expect(fileStyles.indent_style).toBe('space');
  expect(fileStyles.indent_size).toBe(2);
  expect(fileStyles.tab_width).toBe(2);
  expect(fileStyles.max_line_length).toBe(80);
});

test('.editorconfig makefile settings', async () => {
  const fileStyles = await readConfigForFile('makefile');

  expect(fileStyles.charset).toBe('utf-8');
  expect(fileStyles.trim_trailing_whitespace).toBe(true);
  expect(fileStyles.insert_final_newline).toBe(true);
  expect(fileStyles.quote_type).toBe('double');
  expect(fileStyles.indent_style).toBe('tab');
  expect(fileStyles.indent_size).toBe(4);
  expect(fileStyles.tab_width).toBe(4);
  expect(fileStyles.max_line_length).toBe(80);
});

test('.editorconfig .js settings', async () => {
  const fileStyles = await readConfigForFile('.editorconfig.test.js');

  expect(fileStyles.charset).toBe('utf-8');
  expect(fileStyles.trim_trailing_whitespace).toBe(true);
  expect(fileStyles.insert_final_newline).toBe(true);
  expect(fileStyles.quote_type).toBe('single');
  expect(fileStyles.indent_style).toBe('space');
  expect(fileStyles.indent_size).toBe(2);
  expect(fileStyles.tab_width).toBe(2);
  expect(fileStyles.max_line_length).toBe(80);
});
