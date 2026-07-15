# Module 4 – The Linux Directory Structure

[← Module 3: Ubuntu Server Setup](03-ubuntu-server-setup.md) | [Back to Course Home](../README.md) | [Next Module: User Management →](05-user-management.md)

---

## Learning Objectives

By the end of this module you will be able to:

- Explain the Filesystem Hierarchy Standard (FHS)
- Navigate the Linux directory tree using `cd`, `ls`, and `pwd`
- Identify the purpose of key directories (`/etc`, `/var`, `/home`, `/usr`, `/tmp`)
- Describe absolute vs relative paths

**Estimated time:** 30 minutes

---

## 4.1 Everything is a File

Linux follows the Unix philosophy: **everything is a file**. Directories, hardware devices, network sockets, and processes are all represented as files in the filesystem. This single tree structure makes the system consistent and scriptable.

Unlike Windows (which has multiple drive letters like `C:\`, `D:\`), Linux has **one root** — the `/` directory — and everything branches from it.

---

## 4.2 The Filesystem Hierarchy Standard (FHS)

The **Filesystem Hierarchy Standard (FHS)** defines the directory structure used by Linux distributions. Most major distributions follow it closely.

```
/
├── bin/       Essential user commands
├── boot/      Bootloader and kernel files
├── dev/       Device files (hardware)
├── etc/       System-wide configuration files
├── home/      User home directories
├── lib/       Shared libraries for /bin and /sbin
├── media/     Mount points for removable media
├── mnt/       Temporary mount points
├── opt/       Optional add-on software
├── proc/      Virtual filesystem for kernel/process info
├── root/      Home directory of the root user
├── run/       Runtime data (PIDs, sockets)
├── sbin/      System administration commands
├── srv/       Data for services (web, FTP, etc.)
├── sys/       Virtual filesystem for kernel devices
├── tmp/       Temporary files (cleared on reboot)
├── usr/       User programs and data
│   ├── bin/   Most user commands
│   ├── lib/   Libraries for /usr/bin
│   ├── local/ Locally installed software
│   └── share/ Architecture-independent data
└── var/       Variable data (logs, databases, mail)
    ├── log/   Log files
    ├── www/   Web server files (common convention)
    └── mail/  Mail spool
```

---

## 4.3 Key Directories Explained

### `/` — Root

The top of the entire filesystem. Every other path starts here.

```bash
ls /
```

### `/etc` — Configuration Files

System-wide configuration files. Changing files here affects all users.

| File / Directory | Purpose |
| :--- | :--- |
| `/etc/hostname` | The server's hostname |
| `/etc/hosts` | Local hostname resolution |
| `/etc/fstab` | Filesystem mount table |
| `/etc/passwd` | User account information |
| `/etc/shadow` | Encrypted user passwords |
| `/etc/ssh/sshd_config` | SSH server configuration |
| `/etc/apt/sources.list` | APT package repository list |
| `/etc/crontab` | System-wide scheduled tasks |

```bash
cat /etc/hostname
```

### `/home` — User Home Directories

Each regular user gets a directory here named after their username.

```bash
ls /home
# linuxuser
```

Your home directory is also represented by the tilde (`~`):

```bash
cd ~
pwd
# /home/linuxuser
```

### `/root` — Root User's Home

The root (superuser) account does not use `/home`. Its home is `/root`.

### `/var` — Variable Data

Contains data that changes frequently:

| Subdirectory | Contents |
| :--- | :--- |
| `/var/log/` | Log files (syslog, auth.log, etc.) |
| `/var/cache/apt/` | Downloaded package files |
| `/var/www/html/` | Default web root for Apache/Nginx |
| `/var/mail/` | User mailboxes |

```bash
ls /var/log
sudo tail -20 /var/log/syslog
```

### `/tmp` — Temporary Files

Programs store temporary files here. Contents are automatically cleared on reboot.

> Never store important data in `/tmp`.

### `/usr` — User Programs

Contains the majority of user-facing programs and libraries:

- `/usr/bin/` — standard user commands (`ls`, `grep`, `nano`, etc.)
- `/usr/lib/` — shared libraries
- `/usr/share/` — documentation, man pages, icons

### `/bin` and `/sbin`

On modern Ubuntu systems, `/bin` and `/sbin` are symbolic links pointing to `/usr/bin` and `/usr/sbin` respectively.

- `/bin` — essential commands needed before `/usr` is mounted (`bash`, `cp`, `ls`)
- `/sbin` — system administration commands (`fdisk`, `reboot`, `ip`)

### `/dev` — Device Files

Hardware devices appear as files:

| File | Device |
| :--- | :--- |
| `/dev/sda` | First SATA/SCSI disk |
| `/dev/nvme0n1` | First NVMe disk |
| `/dev/tty1` | First virtual terminal |
| `/dev/null` | Discards all input |
| `/dev/random` | Random number generator |

### `/proc` — Process Information

A virtual filesystem providing a real-time view of kernel and process data:

```bash
cat /proc/cpuinfo      # CPU details
cat /proc/meminfo      # Memory details
cat /proc/version      # Kernel version
```

### `/boot` — Boot Files

Contains the kernel image and bootloader configuration:

- `vmlinuz-*` — the compressed Linux kernel
- `initrd.img-*` — initial RAM disk image
- `grub/` — GRUB bootloader configuration

---

## 4.4 Navigating the Filesystem

### Essential Navigation Commands

| Command | Action | Example |
| :--- | :--- | :--- |
| `pwd` | Print working directory | `pwd` → `/home/linuxuser` |
| `ls` | List directory contents | `ls /etc` |
| `ls -la` | List all files with details | `ls -la ~` |
| `cd <path>` | Change directory | `cd /var/log` |
| `cd ..` | Go up one level | `cd ..` |
| `cd ~` | Go to home directory | `cd ~` |
| `cd -` | Go to previous directory | `cd -` |

### Absolute vs Relative Paths

| Type | Starts With | Example |
| :--- | :--- | :--- |
| **Absolute** | `/` | `/etc/hostname` |
| **Relative** | Directory name or `.`/`..` | `../etc/hostname` |

An **absolute path** always starts from the root `/` and works from anywhere.  
A **relative path** is resolved from your current working directory.

```bash
# Absolute path — works from anywhere
cat /etc/hostname

# Relative path — only works if you are in /
cat etc/hostname
```

### Useful `ls` Options

```bash
ls -l        # Long listing (permissions, owner, size, date)
ls -a        # Show hidden files (starting with .)
ls -la       # Long listing including hidden files
ls -lh       # Human-readable file sizes (KB, MB, GB)
ls -lt       # Sort by modification time, newest first
ls -R        # Recursive listing
```

---

## 4.5 Hidden Files and Directories

Files and directories whose names begin with a dot (`.`) are hidden by default:

```bash
ls ~
# (visible files only)

ls -la ~
# .bash_history  .bashrc  .profile  .ssh/  ...
```

| Hidden File | Purpose |
| :--- | :--- |
| `~/.bashrc` | Bash configuration for interactive shells |
| `~/.bash_history` | History of commands you have run |
| `~/.profile` | Login shell environment settings |
| `~/.ssh/` | SSH keys and configuration |

---

## 4.6 Finding Things

```bash
which bash          # Location of a command's binary
whereis nano        # Location of binary, man page, and source
find / -name sshd_config 2>/dev/null   # Find a file by name
```

---

## 4.7 Module Summary

- Linux uses a single-root hierarchy starting at `/`
- The FHS defines where different types of files live
- `/etc` holds configuration, `/var` holds variable data, `/home` holds user files
- `pwd`, `ls`, and `cd` are the core navigation commands
- Absolute paths start with `/`; relative paths start from your current directory
- Files starting with `.` are hidden; use `ls -a` to see them

---

## Knowledge Check

1. What does FHS stand for?
2. Which directory contains system-wide configuration files?
3. What command shows your current directory?
4. Where is the root user's home directory?
5. What does `ls -la` do that `ls` alone does not?

*(Answers: 1. Filesystem Hierarchy Standard | 2. `/etc` | 3. `pwd` | 4. `/root` | 5. Shows hidden files and displays detailed information like permissions, owner, size, and date)*

---

[← Module 3: Ubuntu Server Setup](03-ubuntu-server-setup.md) | [Back to Course Home](../README.md) | [Next Module: User Management →](05-user-management.md)
