# Getting Started

Welcome to **Linux for Beginners**. This guide tells you how to take the course and what you need before Module 01.

## Who this course is for

- Absolute beginners who have never used a Linux terminal
- Windows users who want a safe practice environment (WSL or VirtualBox)
- Anyone setting up a first Ubuntu Server for labs, home use, or learning sysadmin basics

## Prerequisites

- A computer with **Windows 10/11**, **macOS**, or an existing Linux host
- Ability to download ~2–4 GB (ISO / WSL distro)
- Admin rights on your machine to install VirtualBox or enable WSL
- Curiosity and willingness to type commands (you will break things; that is normal)

No prior Linux experience is required.

## Choose your lab environment

Pick **one** path. You can add others later.

| Path | Best for | Difficulty | Guide |
| --- | --- | --- | --- |
| **WSL on Windows** | Fast daily practice, no VM overhead | Easy | [Module 02](modules/02-install-environments.md#option-a-wsl-on-windows) |
| **VirtualBox VM** | Closest to a real server / desktop install | Medium | [Module 02](modules/02-install-environments.md#option-b-virtualbox) |
| **Ubuntu Server (VM or bare metal)** | Server admin track (SSH, UFW, swap, xRDP) | Medium | [Module 03](modules/03-ubuntu-server-setup.md) |

**Recommendation for this course:** start with **Ubuntu Server in VirtualBox** if you want the full server modules, or **WSL (Ubuntu)** if you only need the command line modules first.

## How the course is organized

```text
docs/modules/     Teach concepts + commands
docs/labs/        Hands-on practice
docs/quizzes/     Check understanding
docs/cheatsheets/ Quick lookup while practicing
```

Each module follows the same pattern:

1. **Objectives** — what you will be able to do
2. **Lesson** — explanations and examples
3. **Try it** — short inline practice
4. **Next** — link to the matching lab or the next module

## Suggested learning path

| Order | Module | Est. time | Lab / Quiz |
| ---: | --- | ---: | --- |
| 1 | [01 — Linux fundamentals](modules/01-linux-fundamentals.md) | 45–60 min | [Quiz 01](quizzes/quiz-01-fundamentals.md) |
| 2 | [02 — Install environments](modules/02-install-environments.md) | 60–90 min | [Lab 01](labs/lab-01-first-shell.md) |
| 3 | [03 — Ubuntu Server setup](modules/03-ubuntu-server-setup.md) | 60–90 min | — |
| 4 | [04 — Users & permissions](modules/04-users-and-permissions.md) | 45 min | [Lab 02](labs/lab-02-users-and-sudo.md) |
| 5 | [05 — SSH & remote access](modules/05-ssh-and-remote-access.md) | 45 min | — |
| 6 | [06 — Command line basics](modules/06-command-line-basics.md) | 60 min | [Quiz 02](quizzes/quiz-02-cli-and-files.md) |
| 7 | [07 — Files & directories](modules/07-files-and-directories.md) | 60 min | [Lab 03](labs/lab-03-filesystem-tour.md) |
| 8 | [08 — Swap & performance](modules/08-swap-and-performance.md) | 45 min | — |
| 9 | [09 — xRDP remote desktop](modules/09-xrdp-remote-desktop.md) | 45–60 min | — |
| 10 | [10 — Networking & firewall](modules/10-networking-and-firewall.md) | 60 min | [Lab 04](labs/lab-04-firewall-and-ssh.md) |
| 11 | [11 — Apps & monitoring](modules/11-apps-and-monitoring.md) | 30 min | [Quiz 03](quizzes/quiz-03-server-ops.md) |
| 12 | [12 — Capstone](modules/12-capstone.md) | 90–120 min | [Lab 05 Capstone](labs/lab-05-capstone.md) |

Total guided study: roughly **10–14 hours**, depending on install path and how deep you go.

## Progress checklist

Copy this into your notes and check items off:

```text
[ ] Environment ready (WSL or VM or Ubuntu Server)
[ ] Can explain what Linux / a distro is
[ ] Can log in and update packages
[ ] Can create a user and grant sudo
[ ] Can connect with SSH
[ ] Comfortable with ls, cd, pwd, cp, mv, rm, mkdir, nano
[ ] Understand /home, /etc, /var, /tmp, permissions basics
[ ] Swap configured (server track)
[ ] UFW allows SSH and blocks unwanted traffic
[ ] htop installed; can read load / memory
[ ] Capstone completed
[ ] Quizzes 01–03 passed (≥70%)
```

## Conventions used in this course

```bash
# Commands you type look like this
sudo apt update
```

- Replace placeholders like `<username>` or `<ip_address>` with your values.
- Lines starting with `#` are comments — do not type them unless noted.
- `sudo` means “run this with administrator privileges.” You will be prompted for **your** password.
- Prefer a non-root daily user with sudo over logging in as `root`.

## Safety tips

- Practice in a **VM or WSL** before touching a production machine.
- Never run `rm -rf /` or wipe disks you care about.
- When editing config files, keep a backup: `sudo cp file file.bak`
- Open the firewall for SSH **before** enabling UFW on a remote server, or you can lock yourself out.

## Next step

Start here → [Module 01: Linux Fundamentals](modules/01-linux-fundamentals.md)
