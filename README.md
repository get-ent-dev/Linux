<div align="center">
  <img src="https://github.com/user-attachments/assets/35210bee-7e01-44bc-bf31-0daa60c8b04b" alt="Linux Logo" width="150" />

  # Linux for Beginners

  ![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)
  ![Ubuntu](https://img.shields.io/badge/Ubuntu-E95420?style=for-the-badge&logo=ubuntu&logoColor=white)
  ![Bash](https://img.shields.io/badge/Bash-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white)
</div>

A **complete learning module** for absolute beginners: syllabus, lessons, labs, quizzes, and cheatsheets for Ubuntu-focused Linux skills — from first shell to a small hardened lab server.

---

## Start here

1. Read **[Getting Started](docs/00-getting-started.md)** (environment choice + progress checklist)
2. Follow modules **01 → 12** in order
3. Complete labs and quizzes as you go
4. Finish the **[Capstone](docs/modules/12-capstone.md)** and run `scripts/verify-lab.sh`

Content audit (what was broken and how it was fixed): **[docs/AUDIT.md](docs/AUDIT.md)**

---

## Course map

| # | Module | Lab / Quiz |
| ---: | --- | --- |
| 0 | [Getting Started](docs/00-getting-started.md) | — |
| 1 | [Linux Fundamentals](docs/modules/01-linux-fundamentals.md) | [Quiz 01](docs/quizzes/quiz-01-fundamentals.md) |
| 2 | [Install Environments (WSL / VirtualBox)](docs/modules/02-install-environments.md) | [Lab 01](docs/labs/lab-01-first-shell.md) |
| 3 | [Ubuntu Server Setup](docs/modules/03-ubuntu-server-setup.md) | — |
| 4 | [Users & Permissions](docs/modules/04-users-and-permissions.md) | [Lab 02](docs/labs/lab-02-users-and-sudo.md) |
| 5 | [SSH & Remote Access](docs/modules/05-ssh-and-remote-access.md) | — |
| 6 | [Command Line Basics](docs/modules/06-command-line-basics.md) | — |
| 7 | [Files & Directories](docs/modules/07-files-and-directories.md) | [Lab 03](docs/labs/lab-03-filesystem-tour.md) · [Quiz 02](docs/quizzes/quiz-02-cli-and-files.md) |
| 8 | [Swap & Performance](docs/modules/08-swap-and-performance.md) | — |
| 9 | [xRDP Remote Desktop](docs/modules/09-xrdp-remote-desktop.md) *(optional)* | — |
| 10 | [Networking & Firewall (UFW)](docs/modules/10-networking-and-firewall.md) | [Lab 04](docs/labs/lab-04-firewall-and-ssh.md) |
| 11 | [Apps & Monitoring](docs/modules/11-apps-and-monitoring.md) | [Quiz 03](docs/quizzes/quiz-03-server-ops.md) |
| 12 | [Capstone](docs/modules/12-capstone.md) | [Lab 05](docs/labs/lab-05-capstone.md) |

**Cheatsheets:** [Commands](docs/cheatsheets/commands.md) · [UFW](docs/cheatsheets/ufw.md)

---

## What you will learn

- What Linux and distributions are, and how the filesystem is organized
- How to practice safely with **WSL** or **VirtualBox**
- How to install and maintain **Ubuntu Server**
- Users, `sudo`, passwords, and SSH remote login
- Everyday Bash: navigation, files, permissions, pipes, `apt`
- Server essentials: swap, UFW firewall, `htop` monitoring
- Optional GUI remote access with **xRDP**
- A capstone lab that ties the skills together

Estimated guided time: **10–14 hours**.

---

## Repository layout

```text
README.md                 ← you are here (course hub)
docs/
  00-getting-started.md
  AUDIT.md
  modules/                ← lessons 01–12
  labs/                   ← hands-on practice
  quizzes/                ← assessments + answer keys
  cheatsheets/            ← quick reference
scripts/
  verify-lab.sh           ← optional capstone checks
```

---

## Capstone verification

On your lab machine (after cloning or copying the script):

```bash
bash scripts/verify-lab.sh
```

Checks for OS identity, SSH service, swap, UFW, `htop`, and `~/SERVER_NOTES.md`.

---

## References

- [DigitalOcean Community Tutorials](https://www.digitalocean.com/community/tutorials)
- [Server World](https://www.server-world.info/)
- [Ubuntu Server documentation](https://ubuntu.com/server/docs)
- [UFW community help](https://help.ubuntu.com/community/UFW)
- Intro videos linked from [Module 01](docs/modules/01-linux-fundamentals.md)

---

## About this rebuild

The previous single `README.md` was truncated mid-lesson and several syllabus sections were empty placeholders. This revision turns the material into a navigable learning module with corrected commands, filled lessons, labs, quizzes, and a capstone. See [docs/AUDIT.md](docs/AUDIT.md) for the full findings.

---

Copyright © 2024–2026 Gadgelectronit of Malaysia ENT. All Rights Reserved.
