# Glossary

Plain-English definitions of the terms used throughout this course, in alphabetical order.

### absolute path
A file location written from the root, always starting with `/` (e.g. `/home/alice/notes.txt`).
Compare **relative path**.

### apt
The package manager on Debian/Ubuntu systems, used to install, update, and remove software.

### bash
The "Bourne Again SHell" — the default **shell** on most Linux systems; it reads and runs the
commands you type.

### boot
The process of starting up the computer and loading the operating system.

### cron
A scheduler that runs commands automatically at set times or intervals. Edited with `crontab -e`.

### daemon
A background program (often a **service**) that runs without direct user interaction, e.g. the SSH
server `sshd`.

### distribution (distro)
A complete operating system built around the Linux **kernel**, bundling a package manager and
default software (e.g. Ubuntu, Fedora, Debian).

### DNS
Domain Name System — translates human-readable names (`example.com`) into IP addresses.

### environment variable
A named value available to programs in your session, e.g. `PATH` (where the shell looks for
commands) or `HOME`.

### firewall
Software that allows or blocks network traffic based on rules. Ubuntu's friendly front end is
**UFW**.

### FHS (Filesystem Hierarchy Standard)
The convention that defines what each top-level directory (`/etc`, `/var`, `/home`, …) is for.

### GID / UID
Group ID / User ID — the numeric identifiers Linux uses internally for groups and users. Root's UID
is `0`.

### group
A collection of users used to assign shared permissions (e.g. the `sudo` group grants admin rights).

### home directory
Your personal directory for files and settings, usually `/home/<username>`, abbreviated `~`.

### kernel
The core of the operating system that manages hardware, memory, processes, and devices. "Linux"
technically refers to just the kernel.

### mount
To attach a filesystem (a disk, partition, USB drive, or network share) to a directory so its
contents become accessible.

### Netplan
Ubuntu's YAML-based tool for configuring network interfaces, stored in `/etc/netplan/`.

### package
A bundled piece of software plus its metadata, installed via a **package manager**.

### package manager
A tool that installs, upgrades, and removes packages and their dependencies (`apt`, `dnf`, `pacman`,
`zypper`).

### permissions
The read (`r`), write (`w`), and execute (`x`) rights granted to a file's owner, group, and others.

### pipe
The `|` operator, which sends the output of one command as the input to another.

### PID
Process ID — a unique number identifying a running process.

### process
A running instance of a program.

### prompt
The text the shell shows when it is ready for input (often ending in `$` for a user or `#` for root).

### redirection
Sending a command's input or output to/from a file using `>`, `>>`, or `<`.

### relative path
A file location written relative to your current directory (e.g. `notes.txt` or `../config`).
Compare **absolute path**.

### repository (repo)
A server-hosted collection of packages that a package manager downloads from.

### root
The all-powerful administrator account (UID `0`). Also the name of the top of the filesystem, `/`.

### root directory
The very top of the filesystem tree, written `/`. Not to be confused with `/root`, the root user's
home directory.

### service
A background program managed by the init system (**systemd**), such as a web server or SSH.

### shell
A program that interprets and runs the commands you type (e.g. **bash**, **zsh**).

### SSH (Secure Shell)
An encrypted protocol for logging into and running commands on a remote machine.

### SSH key pair
A **public** key (shared, placed on servers) and a **private** key (kept secret) used for
passwordless, secure authentication.

### sudo
"Superuser do" — run a single command with administrator privileges using your own password.

### swap
Disk space used as overflow when physical RAM is full.

### swappiness
A kernel setting (0–100) controlling how aggressively the system moves memory to **swap**.

### systemd
The init system and service manager on modern Linux; controlled with `systemctl` and `journalctl`.

### terminal
The window/application that hosts a **shell** session.

### UFW (Uncomplicated Firewall)
Ubuntu's simplified command-line front end for managing the firewall.

### working directory
The directory your shell is currently "in"; shown by `pwd`.
