<div align="center">
  <img src="https://github.com/user-attachments/assets/35210bee-7e01-44bc-bf31-0daa60c8b04b" alt="Linux Logo" width="150" />

  # Linux for Beginners

  ![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)
  ![Ubuntu](https://img.shields.io/badge/Ubuntu-E95420?style=for-the-badge&logo=ubuntu&logoColor=white)
  ![Bash](https://img.shields.io/badge/Bash-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white)
  ![License](https://img.shields.io/badge/License-MIT-blue?style=for-the-badge)

  *A structured, hands-on course guide by [Gadgelectronit Enterprise](https://github.com/get-ent-dev)*
</div>

---

## Welcome

Welcome to the **Linux for Beginners** learning module. This course takes you from zero knowledge of Linux to confidently administering an Ubuntu server — including installation, user management, SSH access, networking, remote desktop, and performance tuning.

By the end of this course you will be able to:

- Explain what Linux is and choose the right distribution for your needs
- Install Ubuntu Server in a virtual machine or on bare metal
- Navigate the Linux filesystem and understand the directory structure
- Create and manage users and groups
- Connect to a server securely over SSH
- Run essential command-line operations and manage packages
- Create and manage files and directories
- Configure the UFW firewall and basic networking
- Set up a swap file to extend server memory
- Enable a graphical Remote Desktop (xRDP) session
- Monitor system performance with `htop`

---

## Prerequisites

| Requirement | Detail |
| :--- | :--- |
| Operating System | Windows 10/11, macOS, or an existing Linux system |
| RAM | 8 GB recommended (4 GB minimum for VM labs) |
| Disk Space | 40 GB free for virtual machine storage |
| Software | [VirtualBox](https://www.virtualbox.org/) or [VMware Player](https://www.vmware.com/products/workstation-player.html) |
| Experience | No prior Linux experience required |

---

## Course Map

```
Linux for Beginners
│
├── Module 1 – Background & Introduction
│   └── docs/01-introduction.md
│
├── Module 2 – Environment Setup
│   └── docs/02-environment-setup.md
│
├── Module 3 – Ubuntu Server Installation
│   └── docs/03-ubuntu-server-setup.md
│
├── Module 4 – Linux Directory Structure
│   └── docs/04-linux-directory-structure.md
│
├── Module 5 – User Management
│   └── docs/05-user-management.md
│
├── Module 6 – Secure Shell (SSH)
│   └── docs/06-ssh.md
│
├── Module 7 – Basic Command Line
│   └── docs/07-basic-cli.md
│
├── Module 8 – File & Directory Operations
│   └── docs/08-file-operations.md
│
├── Module 9 – Networking & Firewall
│   └── docs/09-networking-firewall.md
│
├── Module 10 – Swap & Server Performance
│   └── docs/10-swap-performance.md
│
├── Module 11 – Remote Desktop (xRDP)
│   └── docs/11-remote-desktop.md
│
└── Module 12 – Applications & Monitoring
    └── docs/12-applications-monitoring.md
```

---

## Lessons

| # | Module | Topics | Estimated Time |
| :--- | :--- | :--- | :--- |
| 1 | [Background & Introduction](docs/01-introduction.md) | What is Linux, history, distros, why Linux | 30 min |
| 2 | [Environment Setup](docs/02-environment-setup.md) | WSL on Windows, VirtualBox, AlmaLinux install | 60 min |
| 3 | [Ubuntu Server Setup](docs/03-ubuntu-server-setup.md) | Step-by-step Ubuntu Server 22.04 installation | 45 min |
| 4 | [Linux Directory Structure](docs/04-linux-directory-structure.md) | FHS, key directories, navigation basics | 30 min |
| 5 | [User Management](docs/05-user-management.md) | adduser, groups, sudo, passwords | 30 min |
| 6 | [Secure Shell (SSH)](docs/06-ssh.md) | SSH protocol, connecting, SSH keys, sudo | 45 min |
| 7 | [Basic Command Line](docs/07-basic-cli.md) | apt, update/upgrade, reboot, essential commands | 45 min |
| 8 | [File & Directory Operations](docs/08-file-operations.md) | nano, touch, mkdir, rm, cp, mv, permissions | 45 min |
| 9 | [Networking & Firewall](docs/09-networking-firewall.md) | UFW, ping, IP addressing, port management | 45 min |
| 10 | [Swap & Server Performance](docs/10-swap-performance.md) | Swap file setup, swappiness, vfs_cache_pressure | 30 min |
| 11 | [Remote Desktop (xRDP)](docs/11-remote-desktop.md) | Xfce, xrdp install, RDP client setup | 45 min |
| 12 | [Applications & Monitoring](docs/12-applications-monitoring.md) | htop, virt-manager, package management | 30 min |

---

## Labs & Quizzes

Hands-on labs reinforce each module. Complete them on your own Ubuntu Server VM.

| Resource | Description |
| :--- | :--- |
| [Lab 1 – Ubuntu Install](labs/lab-01-ubuntu-install.md) | Install Ubuntu Server 22.04 from scratch |
| [Lab 2 – User Management](labs/lab-02-user-management.md) | Create users, assign groups, test sudo |
| [Lab 3 – SSH & Key Auth](labs/lab-03-ssh.md) | SSH in, generate a key pair, disable password auth |
| [Lab 4 – CLI Essentials](labs/lab-04-basic-cli.md) | Update packages, inspect disk, explore the filesystem |
| [Lab 5 – File Operations](labs/lab-05-file-operations.md) | Create, edit, copy, move, and delete files |
| [Lab 6 – Firewall Rules](labs/lab-06-networking.md) | Enable UFW, allow/deny ports, test connectivity |
| [Lab 7 – Swap File](labs/lab-07-swap.md) | Create and permanently mount a 2 GB swap file |
| [Lab 8 – Remote Desktop](labs/lab-08-xrdp.md) | Install Xfce + xrdp, connect from Windows/macOS |
| [Quiz 1 – Intro & Distros](quizzes/quiz-01-intro.md) | 10 questions covering Modules 1–2 |
| [Quiz 2 – CLI & Files](quizzes/quiz-02-cli-files.md) | 10 questions covering Modules 7–8 |

---

## Quick Reference

- [Command Cheat Sheet](CHEATSHEET.md) — one-page printable command reference
- [Glossary](GLOSSARY.md) — definitions of key Linux terms
- [DigitalOcean Tutorials](https://www.digitalocean.com/community/tutorials) — extended reading
- [Server World](https://www.server-world.info/) — server configuration recipes

---

## How to Use This Repository

1. **Read each module** in the `docs/` folder in order.
2. **Follow along** on your own Ubuntu Server VM as you read.
3. **Complete the lab** at the end of each module to cement the skill.
4. **Test yourself** with the quizzes after every two to three modules.
5. **Refer back** to the cheat sheet and glossary at any time.

---

## Environment Used in This Course

| Item | Version |
| :--- | :--- |
| Ubuntu Server | 22.04 LTS (Jammy Jellyfish) |
| VirtualBox | 7.x |
| SSH Client | OpenSSH / PuTTY |
| xRDP | 0.9.x |

---

## Contributing

Found an error or want to improve a lesson? See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

---

## License

Copyright © 2024 Gadgelectronit Enterprise of Malaysia. All Rights Reserved.  
This learning material is licensed under the [MIT License](LICENSE).
