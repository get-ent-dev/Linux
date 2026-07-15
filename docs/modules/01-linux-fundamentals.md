# Module 01 — Linux Fundamentals

**Time:** 45–60 minutes  
**Prerequisites:** None  
**Assessment:** [Quiz 01](../quizzes/quiz-01-fundamentals.md)

## Learning objectives

By the end of this module you will be able to:

- Explain what Linux is and why it is widely used
- Describe what a Linux distribution (distro) is
- Name common enterprise and desktop distros and when to choose them
- Recognize the high-level Linux directory layout

## 1. What is Linux?

Linux is an open-source **operating system kernel** created by Linus Torvalds in 1991. Together with GNU tools and other software, it forms complete operating systems used on servers, desktops, phones (Android), cloud VMs, and embedded devices.

**Why people use Linux**

- Stable and long-running (ideal for servers)
- Strong security model and permissions
- Free / open-source options with no license fees for many distros
- Huge package ecosystems and automation tooling
- Runs almost everywhere: laptop, cloud, container, Raspberry Pi

### Watch (optional)

- [What Linux is](https://www.youtube.com/watch?v=zA3vmx0GaO8)
- [Brief history of Linux](https://www.youtube.com/watch?v=rrB13utjYV4)
- [What a Linux distro is](https://www.youtube.com/watch?v=VKNMI6cYOFk)
- [Reasons Linux is used](https://www.youtube.com/watch?v=mAFMJ1LnQu8)

## 2. What is a Linux distribution?

A **distribution** (distro) packages:

- The Linux kernel
- System libraries and tools (often GNU)
- A package manager (`apt`, `dnf`, `pacman`, …)
- Installer, defaults, and often a desktop or server profile

Think of “Linux” as the engine and the distro as the complete car built around it.

## 3. Common distributions

| Distro | Family | Typical use |
| --- | --- | --- |
| **Ubuntu** | Debian | Servers, desktops, cloud images; beginner-friendly |
| **Debian** | Debian | Stable servers; upstream of Ubuntu |
| **Linux Mint / Pop!_OS** | Debian/Ubuntu | Desktop-focused |
| **RHEL** | RHEL | Enterprise paid support |
| **AlmaLinux / Rocky Linux** | RHEL-compatible | Free RHEL-compatible servers |
| **Fedora** | RHEL upstream | Newer packages; desktop & lab |
| **CentOS Stream** | RHEL | Rolling preview of RHEL |
| **openSUSE / SLES** | SUSE | Enterprise and YaST-focused workflows |
| **Arch Linux** | Independent | Rolling release; advanced users |

> This course uses **Ubuntu** (Server or WSL) so commands stay consistent (`apt`, `ufw`, `systemctl`).

### How to choose

- **Learning / cloud / home lab:** Ubuntu LTS
- **Enterprise RHEL ecosystem:** RHEL, AlmaLinux, or Rocky Linux
- **Desktop polish on Ubuntu base:** Mint or Pop!_OS
- **Bleeding edge / build-it-yourself:** Fedora or Arch

## 4. Kernel vs shell vs terminal

| Term | Meaning |
| --- | --- |
| **Kernel** | Core that talks to hardware |
| **Shell** | Program that reads your commands (often Bash) |
| **Terminal** | Window/app where you type into the shell |
| **CLI** | Command-line interface (text) |
| **GUI** | Graphical interface (windows, mouse) |

You will spend most of this course in a **terminal** talking to **Bash**.

## 5. The Linux directory structure (overview)

Linux uses a single rooted tree starting at `/`.

| Path | Purpose |
| --- | --- |
| `/` | Root of the filesystem |
| `/home` | User home directories (`/home/alex`) |
| `/etc` | System configuration |
| `/var` | Variable data (logs, caches, mail) |
| `/tmp` | Temporary files (cleared on reboot on many systems) |
| `/usr` | User-space programs and libraries |
| `/bin`, `/sbin` | Essential binaries (often merged into `/usr`) |
| `/opt` | Optional third-party software |
| `/root` | Home directory of the root user |
| `/proc`, `/sys` | Virtual files exposing kernel/process info |
| `/dev` | Device files |
| `/mnt`, `/media` | Mount points for extra disks / USB |

You will practice navigating this tree in [Module 07](07-files-and-directories.md) and [Lab 03](../labs/lab-03-filesystem-tour.md).

## 6. Users, root, and sudo (preview)

- **root** — the superuser; unrestricted
- **Regular user** — limited to their own files by default
- **sudo** — lets an allowed user run a command *as root* without full-time root login

Best practice: log in as a normal user and use `sudo` only when needed.

## Try it

Answer in your notes (no computer required yet):

1. Name three reasons organizations run Linux servers.
2. Is Ubuntu a kernel or a distribution?
3. Which directory would hold `/home/sam/Documents`’s parent user folder?
4. Which family does AlmaLinux belong to?

## Checkpoint

Before moving on, you should be able to explain distro vs kernel and list at least five top-level directories.

## Next

- Take [Quiz 01 — Fundamentals](../quizzes/quiz-01-fundamentals.md)
- Then continue to [Module 02 — Install Environments](02-install-environments.md)
