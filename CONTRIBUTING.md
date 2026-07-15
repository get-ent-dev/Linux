# Contributing to Linux for Beginners

Thank you for your interest in improving this learning module!

---

## How to Contribute

### Reporting Errors

If you find an inaccurate command, broken link, or outdated information:

1. Open an [Issue](../../issues) on GitHub
2. Include:
   - The file name and line number
   - What the error is
   - What the correct information should be

### Suggesting Improvements

For content additions or structural improvements:

1. Open an Issue describing the change
2. Label it `enhancement`
3. Describe what you want to add and why it helps learners

### Submitting Changes

1. Fork the repository
2. Create a branch: `git checkout -b fix/your-description`
3. Make your changes
4. Test any commands you add on a real Ubuntu Server 22.04 system
5. Submit a Pull Request with a clear description

---

## Content Standards

When writing or editing content, please follow these standards:

### Commands
- Always test commands before adding them
- Use the `sudo` prefix where required
- Prefer the modern form: `ip addr show` over `ifconfig`, `ss` over `netstat`
- Use correct package names: `sudo apt install htop` not `sudo install htop`

### Accuracy
- All commands must be verified on Ubuntu Server 22.04 LTS
- Correct any placeholder usernames (do not use fictional names — use `<username>`)
- Include expected output where it helps learners verify success

### Style
- Use second person ("you will learn") not first person
- Use active voice
- Keep sentences concise
- Use tables for comparisons and reference data
- Use code fences (` ```bash `) for all commands and terminal output

### Module Structure
Each module should include:
- Learning objectives at the top
- Estimated time
- Prerequisite note
- Numbered, clearly stated steps
- A knowledge check section at the bottom
- Navigation links (previous module / home / next module)

---

## Questions

Open an Issue with the `question` label.

---

Thank you for helping make this a better resource for Linux beginners!
