# Contributing

Thanks for helping improve **Linux for Beginners**! This is a learning module, so contributions that
make the material clearer, more accurate, or more hands-on are especially welcome.

## Ways to Contribute

- **Fix errors** — typos, broken links, out-of-date commands, or incorrect explanations.
- **Improve clarity** — reword confusing sections; beginners are the audience.
- **Add exercises** — new labs in [`exercises/`](exercises/) following the existing format
  (Objectives → Tasks → Verify Your Work → collapsible Solution).
- **Expand references** — high-quality, free learning resources.

## How to Submit a Change

1. Fork the repository and create a branch: `git checkout -b fix/short-description`.
2. Make your change.
3. Check it (see below).
4. Commit with a clear message and open a Pull Request describing **what** changed and **why**.

## Style Guidelines

- **Audience:** absolute beginners. Prefer plain language and explain jargon on first use (or link
  to the [Glossary](resources/glossary.md)).
- **Commands:** must be correct and safe. Add a warning (`> ⚠️`) before any destructive command.
- **Formatting:**
  - Use fenced code blocks with a language tag (` ```bash `).
  - Keep lines reasonably short (~100 characters) so files are readable in diffs.
  - Put a blank line before and after headings, lists, and code blocks.
  - Use `<username>`, `<ip_address>`, etc. as placeholders.
- **Links:** use relative links between files in this repo so they work on any fork.

## Checking Your Work

Before opening a PR:

- Verify every command you add actually runs on a fresh Ubuntu system (VM or WSL).
- Confirm internal links resolve and Table-of-Contents anchors still match their headings.
- Optional: run a Markdown linter such as
  [`markdownlint`](https://github.com/DavidAnson/markdownlint-cli):
  ```bash
  npx markdownlint-cli "**/*.md"
  ```

By contributing, you agree that your contributions are licensed under the project's
[MIT License](LICENSE).
