<div align="center">
  <img src="https://github.com/user-attachments/assets/35210bee-7e01-44bc-bf31-0daa60c8b04b" alt="Linux Logo" width="150" />

  # Linux for Beginners

  A complete, hands-on learning module for people who are brand new to Linux.

  ![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)
  ![Ubuntu](https://img.shields.io/badge/Ubuntu-E95420?style=for-the-badge&logo=ubuntu&logoColor=white)
  ![Bash](https://img.shields.io/badge/Bash-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white)
  ![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)
</div>

Welcome to the **Linux for Beginners** course. This repository is a self-contained learning
module: it contains the syllabus, concept explanations, command references, step-by-step server
configuration guides, hands-on labs, knowledge checks, a glossary, and a printable cheat sheet.
Everything you need to go from "I have never touched a terminal" to "I can install, secure, and
operate a Linux server" lives here.

---

## How to Use This Module

This course is designed to be worked through **in order**. Each module builds on the previous one.

1. **Read** the concept explanation in the relevant section below.
2. **Type** the commands yourself — do not copy/paste. Muscle memory matters.
3. **Do the lab** for that module in [`exercises/`](exercises/). Labs are where the learning sticks.
4. **Check yourself** with the [knowledge checks](#knowledge-checks) at the end.
5. Keep the [Command Cheat Sheet](resources/cheat-sheet.md) and [Glossary](resources/glossary.md)
   open in another tab.

> **You need a Linux environment to practice.** If you do not have one yet, jump to
> [Setting Up a Practice Environment](#setting-up-a-practice-environment) first. The safest,
> fastest option for Windows users is **WSL**; for everyone else a **VirtualBox** VM works great.

### Learning Path

```text
Module 0  Concepts & Distributions        ── what Linux is, and how to get it
Module 1  Setting Up a Practice Env       ── WSL / VirtualBox / bare metal
Module 2  Ubuntu Server Setup             ── install the OS step by step
Module 3  User Management                 ── users, groups, sudo, passwords
Module 4  Secure Shell (SSH)              ── connect to a server remotely & safely
Module 5  The Command Line                ── navigation, files, pipes, permissions
Module 6  File & Directory Operations     ── create, move, copy, find, archive
Module 7  Swap File & Server Performance  ── memory, swap, monitoring load
Module 8  Remote Desktop (xRDP)           ── a graphical desktop over the network
Module 9  Networking & Firewall           ── IP config, ports, UFW
Module 10 Applications & Monitoring        ── installing software & watching the system
```

---

<details>
<summary><b>📖 Table of Contents</b> (Click to expand)</summary>

1. [Course Overview & Syllabus](#course-overview--syllabus)
2. [Core Concepts](#core-concepts)
3. [Linux Distributions](#linux-distributions)
4. [Setting Up a Practice Environment](#setting-up-a-practice-environment)
5. [The Linux Directory Structure](#the-linux-directory-structure)
6. [Ubuntu Server Setup](#ubuntu-server-setup)
7. [User Management](#user-management)
8. [Secure Shell (SSH)](#secure-shell-ssh)
9. [Basic & Advanced Command Line](#basic--advanced-command-line)
    - [Basic Server Commands](#basic-server-commands)
    - [Understanding Permissions](#understanding-permissions)
    - [Pipes, Redirection & Text Tools](#pipes-redirection--text-tools)
10. [File & Directory Operations](#file--directory-operations)
11. [Swap File & Server Performance](#swap-file--server-performance)
12. [Remote Desktop (xRDP)](#remote-desktop-xrdp)
13. [Ubuntu Server Networking & Firewall](#ubuntu-server-networking--firewall)
14. [Applications & Monitoring](#applications--monitoring)
15. [Knowledge Checks](#knowledge-checks)
16. [Hands-On Labs](#hands-on-labs)
17. [References & Further Reading](#references--further-reading)

</details>

---

## Course Overview & Syllabus

### Background, Introduction, and Preparation

**1. Course Overview**
This course teaches the practical skills needed to install, configure, secure, and operate a Linux
server, using **Ubuntu Server** as the primary teaching platform. No prior Linux experience is
assumed.

**2. Background and Introduction**
In this lesson you will learn:

* [What Linux is](https://www.youtube.com/watch?v=zA3vmx0GaO8)
* [A brief history of Linux](https://www.youtube.com/watch?v=rrB13utjYV4)
* [What a Linux Distribution (distro) is](https://www.youtube.com/watch?v=VKNMI6cYOFk)
* [Reasons Linux is used](https://www.youtube.com/watch?v=mAFMJ1LnQu8)

> *Briefly introduces:* RHEL (Red Hat Enterprise Linux), Fedora, CentOS, AlmaLinux, Rocky Linux,
> Ubuntu, Debian, openSUSE, and SLES (SUSE Linux Enterprise Server).

**3. Linux Distributions**
Learn what a Linux distro is, the most common distros, and how to choose the right one (RHEL,
AlmaLinux, Rocky Linux, CentOS, Ubuntu, Mint, Debian, Pop!\_OS, Arch Linux, etc.).

**4. Installing Linux using WSL on Windows**
Learn how to install, use, and remove a Linux distro using Windows Subsystem for Linux (WSL) and
access Linux files via Windows File Explorer.

**5. Installing VirtualBox**
Learn how to install VirtualBox for running virtual machines on Windows, macOS, or Linux.

**6. When to Install Linux from Scratch**
Understand why and when a manual installation from scratch is necessary.

**7. Installing AlmaLinux / Rocky Linux / RHEL**
Manual install concepts for enterprise (RHEL-family) distributions.

**8. Logging In Directly to a Linux System**
Connecting to Linux via physical hardware or virtual machines (graphical and text-based logins).

**9 & 10. The Linux Directory Structure**
Learn where OS components are located and how applications follow conventions for directory
structures.

### What You Will Be Able to Do

By the end of this module you will be able to:

- [x] Explain what Linux is and pick an appropriate distribution.
- [x] Stand up a practice environment with WSL or VirtualBox.
- [x] Install Ubuntu Server from scratch.
- [x] Manage users, groups, and privileges.
- [x] Connect to a server securely with SSH keys.
- [x] Navigate the filesystem and manipulate files from the command line.
- [x] Configure swap and read basic performance metrics.
- [x] Set up a remote graphical desktop.
- [x] Configure networking and a firewall.
- [x] Install applications and monitor a running system.

---

## Core Concepts

Before touching a terminal, it helps to understand the pieces you are working with.

| Term | What it means |
| :--- | :--- |
| **Kernel** | The core of the OS. It talks to hardware and manages memory, processes, and devices. "Linux" technically refers to *just* the kernel. |
| **Distribution (distro)** | The kernel + a package manager + default software + tooling, bundled into a usable operating system (e.g. Ubuntu, Fedora). |
| **Shell** | A program that reads the commands you type and runs them. `bash` and `zsh` are common shells. |
| **Terminal** | The window/program that hosts a shell session. |
| **Package Manager** | Installs, updates, and removes software (`apt` on Ubuntu/Debian, `dnf` on RHEL-family). |
| **Root** | The all-powerful administrator account (user ID `0`). |
| **`sudo`** | "Superuser do" — run a single command with administrator privileges. |
| **Open Source** | Source code is publicly available and can be studied, modified, and shared. |

**Why Linux?** It is free and open source, extremely stable, secure, scriptable, and it powers the
vast majority of servers, cloud infrastructure, containers, supercomputers, and Android devices.
Learning it is a core skill for developers, sysadmins, and DevOps/SRE engineers.

---

## Linux Distributions

A **distribution** packages the Linux kernel with everything needed for a working OS. The two big
"families" you will encounter most often:

| Family | Examples | Package Manager | Package Format | Typical Use |
| :--- | :--- | :--- | :--- | :--- |
| **Debian** | Debian, **Ubuntu**, Linux Mint, Pop!\_OS | `apt` | `.deb` | Desktops, cloud servers, beginners |
| **Red Hat** | RHEL, Fedora, CentOS Stream, **AlmaLinux**, Rocky Linux | `dnf`/`yum` | `.rpm` | Enterprise servers |
| **Arch** | Arch Linux, Manjaro | `pacman` | `.pkg.tar.zst` | Advanced/rolling release |
| **SUSE** | openSUSE, SLES | `zypper` | `.rpm` | Enterprise (Europe) |

**How to choose:**

- **Brand new / want the easiest path:** Ubuntu (this course uses Ubuntu Server).
- **Need a free enterprise clone of RHEL:** AlmaLinux or Rocky Linux.
- **Want a polished desktop:** Ubuntu, Linux Mint, or Pop!\_OS.
- **Want to learn the internals the hard way:** Arch Linux.

This course standardizes on **Ubuntu Server** because it is beginner-friendly, widely deployed, and
free — but the concepts transfer to every distro. Where commands differ, the RHEL-family equivalent
is noted.

---

## Setting Up a Practice Environment

You cannot learn Linux by only reading. Pick one of the options below and get a working system.

### Option A — WSL (Windows Subsystem for Linux) — *recommended for Windows*

WSL runs a real Linux distro inside Windows with no virtual machine to manage.

```powershell
# Run in an Administrator PowerShell / Windows Terminal
wsl --install                 # installs WSL + Ubuntu by default
wsl --list --online           # see other distros you can install
wsl --install -d Ubuntu-22.04 # install a specific distro
```

After it finishes, reboot if prompted, launch **Ubuntu** from the Start Menu, and create your Linux
username and password when asked.

```powershell
wsl --list --verbose   # list installed distros and their state
wsl --shutdown         # stop all running distros
wsl --unregister Ubuntu  # completely remove a distro (deletes its files!)
```

Access your Linux files from Windows File Explorer at `\\wsl$\Ubuntu\home\<username>`, and access
your Windows drives from Linux at `/mnt/c/`.

### Option B — VirtualBox — *works on Windows, macOS, and Linux*

A full virtual machine, great for practicing a real server install (including the installer screens
in the next section).

1. Download and install [VirtualBox](https://www.virtualbox.org/).
2. Download the [Ubuntu Server ISO](https://ubuntu.com/download/server).
3. In VirtualBox: **New** → name the VM, choose **Linux / Ubuntu (64-bit)**, give it **2+ GB RAM**
   and **25+ GB disk**.
4. Under **Settings → Storage**, attach the ISO to the virtual optical drive.
5. **Start** the VM and follow the [Ubuntu Server Setup](#ubuntu-server-setup) steps below.

### Option C — Bare Metal / When to Install From Scratch

Install directly onto physical hardware when you need full performance, direct hardware access, or a
dedicated server. This overwrites the disk, so only do it on a machine you can wipe. The installer
steps are the same as the [Ubuntu Server Setup](#ubuntu-server-setup) section.

---

## The Linux Directory Structure

Linux uses a single, unified tree that starts at the root, `/`. There are no drive letters. Key
directories defined by the Filesystem Hierarchy Standard (FHS):

| Path | Purpose |
| :--- | :--- |
| `/` | The root of everything. |
| `/home` | Personal directories for regular users (e.g. `/home/alice`). |
| `/root` | The root user's home directory. |
| `/etc` | System-wide configuration files. |
| `/var` | Variable data: logs (`/var/log`), mail, spools, caches. |
| `/usr` | User-land programs and libraries (most installed software). |
| `/bin`, `/sbin` | Essential system binaries (commands). |
| `/tmp` | Temporary files (cleared on reboot). |
| `/opt` | Optional / third-party software. |
| `/dev` | Device files (disks, terminals, etc.). |
| `/proc`, `/sys` | Virtual filesystems exposing kernel and process info. |
| `/mnt`, `/media` | Mount points for external/temporary filesystems. |

> **Tip:** `~` is shorthand for *your* home directory. Typing `cd` with no argument returns you home.

---

## Ubuntu Server Setup

![How-to-Install-Ubuntu-Server](https://github.com/user-attachments/assets/ad870ee3-e4ae-46fd-9d9d-63b55c377b47)

### Step-by-Step Installation

1. **Select Language**: Insert the installation media and restart. Select your preferred language (e.g., English).
   <br><img src="https://github.com/user-attachments/assets/e92e03ae-4470-4940-af40-91c5188a188a" width="600"/>
2. **Keyboard Layout**: Use <kbd>Tab</kbd> to switch items, <kbd>Enter</kbd> to open lists, and arrow keys to select.
   <br><img src="https://github.com/user-attachments/assets/1783f44a-838f-451d-9694-fa66ecffb88d" width="600"/>
3. **Server Configuration**: Select the general server configuration (top) or the minimal set (bottom).
   <br><img src="https://github.com/user-attachments/assets/452fd03e-766b-4df5-808a-1476721c3698" width="600"/>
4. **Network Connections**: Obtain automatically via DHCP or set manually.
   <br><img src="https://github.com/user-attachments/assets/c5916a6d-7be2-4f24-901d-9cf9f42bda54" width="600"/>
5. **Proxy Server**: Enter if necessary; otherwise, leave blank.
   <br><img src="https://github.com/user-attachments/assets/f8534141-772f-4a41-b234-eedfd99de0dd" width="600"/>
6. **Mirror Server**: Used for package updates. Usually auto-selects the best nearby mirror.
   <br><img src="https://github.com/user-attachments/assets/142f42d1-9459-4b42-ae8b-af65cea0aba1" width="600"/>
7. **Storage Settings**: Set disk partition layouts. Defaults are usually fine for beginners.
   <br><img src="https://github.com/user-attachments/assets/e4c9d898-802a-4765-a9f4-7f1708c68fd9" width="600"/>
8. **Confirm Storage**: Choose **Done** to confirm partitions.
   <br><img src="https://github.com/user-attachments/assets/e2e5ff49-ca54-46f1-838e-8ea036d0351c" width="600"/>
9. **Install Confirmation**: Click **Continue**. *Warning: Existing data will be overwritten.*
   <br><img src="https://github.com/user-attachments/assets/48cb7523-403c-43d1-9455-93c0726b9b4e" width="600"/>
10. **Administrator Account**: Enter a name, username, and password.
    <br><img src="https://github.com/user-attachments/assets/04cf4cae-1038-41c1-ac6e-dde3605ea5ac" width="600"/>
11. **SSH Setup**: Choose to install an SSH server if you plan to access the server remotely.
    <br><img src="https://github.com/user-attachments/assets/a5fe542d-0ae4-416a-a608-54a536451511" width="600"/>
12. **Server Snaps**: Select any extra software you need. Leave blank for a clean install.
    <br><img src="https://github.com/user-attachments/assets/0b5a3676-70f9-4db8-adc3-52a6ac533587" width="600"/>
13. **Complete**: When done, select **Reboot Now**.
    <br><img src="https://github.com/user-attachments/assets/38305255-2399-4c2a-a4fc-1fbada7059c0" width="600"/>
14. **Login**: After rebooting, authenticate with your new credentials.
    <br><img src="https://github.com/user-attachments/assets/3a8759e0-c7d8-4752-a905-a1113cc3c059" width="600"/>

> **First thing after any fresh install** — update the system:
> ```bash
> sudo apt update && sudo apt upgrade -y
> ```

---

## User Management

Linux is multi-user. Every person and service gets an account, and privileges are controlled by
groups and `sudo`.

| Task | Command |
| :--- | :--- |
| **Add a new user** | `sudo adduser <username>` |
| **Delete a user** | `sudo deluser <username>` |
| **Delete a user and their home** | `sudo deluser --remove-home <username>` |
| **Check a user's groups** | `groups <username>` |
| **Show current user** | `whoami` |
| **Show user/group IDs** | `id <username>` |
| **Grant sudo privileges** | `sudo usermod -aG sudo <username>` |
| **Remove from a group** | `sudo deluser <username> <group>` |
| **Log in as a normal user (remote)** | `ssh <username>@<ip_address>` |
| **Switch to another user** | `su - <username>` |
| **Switch to the root user** | `sudo su -` |
| **List all users** | `cut -d: -f1 /etc/passwd` |

### Changing Passwords

If you are logged in as the **root** user, change any user's password with:

```bash
passwd <username>
```

As a normal user, change **your own** password (you will be asked for the current one first):

```bash
passwd
```

Force a user to set a new password at their next login:

```bash
sudo passwd --expire <username>
```

### Groups & Sudo (How Privileges Work)

- Users belong to one **primary group** and any number of **secondary groups**.
- Membership in the `sudo` group (Ubuntu/Debian) or `wheel` group (RHEL-family) is what lets an
  account run administrative commands with `sudo`.
- After adding a user to a group, they must **log out and back in** for it to take effect.

```bash
sudo groupadd developers        # create a group
sudo usermod -aG developers bob # add bob to it (keep his other groups!)
groups bob                      # verify
```

> ⚠️ The `-a` (append) flag in `usermod -aG` is critical. Without it you *replace* all of the
> user's secondary groups instead of adding one.

---

## Secure Shell (SSH)

SSH gives you an encrypted terminal session on a remote machine. It is the standard way to
administer Linux servers.

### Connecting

```bash
ssh <username>@<ip_address>          # default port 22
ssh <username>@<ip_address> -p 2222  # a custom port
```

The first time you connect you will be asked to trust the server's fingerprint — type `yes`.

### Key-Based Authentication (Do This Instead of Passwords)

SSH keys are far more secure than passwords and let you log in without typing one every time.

```bash
# 1. On your LOCAL machine, generate a key pair (press Enter for defaults):
ssh-keygen -t ed25519 -C "you@example.com"

# 2. Copy the PUBLIC key to the server:
ssh-copy-id <username>@<ip_address>

# 3. Log in — no password needed:
ssh <username>@<ip_address>
```

- The **private** key (`~/.ssh/id_ed25519`) stays on your machine and is **never** shared.
- The **public** key (`~/.ssh/id_ed25519.pub`) is placed on servers in `~/.ssh/authorized_keys`.

### Hardening the SSH Server

Edit the server's SSH configuration at `/etc/ssh/sshd_config`:

```bash
sudo nano /etc/ssh/sshd_config
```

Recommended settings once key auth works:

```text
PermitRootLogin no
PasswordAuthentication no
```

Apply the changes by restarting the service:

```bash
sudo systemctl restart ssh
```

> ⚠️ Keep your current SSH session open and test a new connection in a second terminal **before**
> closing it — that way you can't lock yourself out.

### Copying Files Over SSH

```bash
scp local-file.txt <user>@<ip>:/remote/path/     # upload a file
scp <user>@<ip>:/remote/file.txt ./              # download a file
scp -r ./mydir <user>@<ip>:/remote/path/         # copy a whole directory
rsync -avz ./mydir <user>@<ip>:/remote/path/     # efficient sync (resumable)
```

---

## Basic & Advanced Command Line

The command line is where Linux gives you its full power. Everything below runs in a shell (bash).

### Basic Server Commands

| Task | Command |
| :--- | :--- |
| **Where am I?** (print working directory) | `pwd` |
| **List files** | `ls` |
| **List with details / hidden files** | `ls -lah` |
| **Change directory** | `cd /path/to/dir` |
| **Go up one level** | `cd ..` |
| **Go home** | `cd` or `cd ~` |
| **Go to previous directory** | `cd -` |
| **Show a file's contents** | `cat file.txt` |
| **View a long file page by page** | `less file.txt` |
| **First / last lines of a file** | `head file.txt` / `tail file.txt` |
| **Follow a growing log file** | `tail -f /var/log/syslog` |
| **Clear the screen** | `clear` (or <kbd>Ctrl</kbd>+<kbd>L</kbd>) |
| **Who is logged in** | `who` |
| **System uptime & load** | `uptime` |
| **Command history** | `history` |
| **Read the manual for a command** | `man <command>` |
| **Quick help** | `<command> --help` |

**Getting help & finding commands:**

```bash
man ls          # full manual page (press q to quit)
ls --help       # concise usage summary
type cd         # what kind of command is this?
which python3   # full path to an executable
apropos network # search manual pages by keyword
```

### Understanding Permissions

Every file and directory has an **owner**, a **group**, and a set of read/write/execute permissions
for *owner*, *group*, and *others*.

```text
-rwxr-xr--  1 alice devs  4096 Jul 15 10:00 script.sh
│└┬┘└┬┘└┬┘
│ │  │  └── others: r--  (read)
│ │  └───── group:  r-x  (read, execute)
│ └──────── owner:  rwx  (read, write, execute)
└────────── type:   -    (- = file, d = directory, l = link)
```

Permission values (used with `chmod`):

| Symbol | Meaning | Number |
| :--- | :--- | :--- |
| `r` | read | 4 |
| `w` | write | 2 |
| `x` | execute | 1 |

Add the numbers per group: `rwx` = 7, `rw-` = 6, `r-x` = 5, `r--` = 4.

```bash
chmod 755 script.sh        # rwx for owner, r-x for group & others
chmod +x script.sh         # make executable (symbolic form)
chmod u+w,o-r file.txt     # add write for owner, remove read for others
chown alice file.txt       # change owner
chown alice:devs file.txt  # change owner and group
chown -R alice:devs mydir  # recursively (whole directory tree)
```

### Pipes, Redirection & Text Tools

Combine small commands into powerful pipelines. This is the heart of the "Unix philosophy."

```bash
command > file      # send output to a file (overwrite)
command >> file     # append output to a file
command 2> err.log  # redirect errors (stderr)
command < file      # read input from a file
cmd1 | cmd2         # pipe: send cmd1's output into cmd2
```

Common text-processing tools:

```bash
grep "error" /var/log/syslog     # find lines containing "error"
grep -ri "todo" .                # recursive, case-insensitive search
wc -l file.txt                   # count lines
sort names.txt | uniq            # sort then remove duplicates
cut -d: -f1 /etc/passwd          # extract the first colon-separated field
awk '{print $1}' access.log      # print the first column of each line
sed 's/foo/bar/g' file.txt       # substitute foo with bar
ps aux | grep nginx              # find running nginx processes
```

Example pipeline — the 5 largest files in the current directory:

```bash
du -ah . | sort -rh | head -n 5
```

---

## File & Directory Operations

| Task | Command |
| :--- | :--- |
| **Create an empty file** | `touch file.txt` |
| **Create a directory** | `mkdir mydir` |
| **Create nested directories** | `mkdir -p a/b/c` |
| **Copy a file** | `cp source.txt dest.txt` |
| **Copy a directory (recursive)** | `cp -r src/ dest/` |
| **Move or rename** | `mv old.txt new.txt` |
| **Delete a file** | `rm file.txt` |
| **Delete an empty directory** | `rmdir mydir` |
| **Delete a directory and contents** | `rm -r mydir` |
| **Create a symbolic link** | `ln -s /target link-name` |
| **Show file type** | `file mystery` |
| **Disk usage of a directory** | `du -sh mydir` |
| **Free disk space** | `df -h` |

> ⚠️ **`rm -rf` is permanent.** There is no Recycle Bin on the command line. Double-check the path
> before you run it, and never run `rm -rf /` or `rm -rf *` carelessly.

### Editing Files

Two beginner-friendly editors ship with most systems:

```bash
nano file.txt   # simple; shortcuts shown at the bottom (^ = Ctrl). Save: Ctrl+O, Exit: Ctrl+X
vim file.txt    # powerful & modal. i = insert mode, Esc then :wq = save & quit
```

### Finding Files

```bash
find /home -name "*.log"           # by name pattern
find . -type d -name "config"      # only directories named config
find / -size +100M 2>/dev/null     # files larger than 100 MB
locate nginx.conf                  # fast index-based search (run sudo updatedb first)
```

### Compressing & Archiving

```bash
tar -czvf archive.tar.gz mydir/    # create a gzip-compressed archive
tar -xzvf archive.tar.gz           # extract it
zip -r archive.zip mydir/          # create a zip
unzip archive.zip                  # extract a zip
```

---

## Swap File & Server Performance

**Swap** is disk space used as "overflow" memory when RAM fills up. It prevents the system from
killing processes under memory pressure (though disk is far slower than RAM).

### Creating a Swap File

```bash
# 1. Check for existing swap
sudo swapon --show
free -h

# 2. Create a 2 GB swap file
sudo fallocate -l 2G /swapfile
sudo chmod 600 /swapfile        # only root should read/write it

# 3. Format it as swap and enable it
sudo mkswap /swapfile
sudo swapon /swapfile

# 4. Verify
free -h
```

### Make Swap Persistent (Survive Reboots)

Add it to `/etc/fstab` so it is enabled automatically at boot:

```bash
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
```

### Tuning "Swappiness"

`swappiness` (0–100) controls how eagerly the kernel uses swap. For servers, a lower value keeps
more data in RAM:

```bash
cat /proc/sys/vm/swappiness              # view current value (default often 60)
sudo sysctl vm.swappiness=10             # set temporarily
echo 'vm.swappiness=10' | sudo tee -a /etc/sysctl.conf   # make permanent
```

### Watching Performance

```bash
top          # live processes, CPU & memory (press q to quit)
htop         # friendlier top (sudo apt install htop)
free -h      # memory & swap usage
uptime       # load averages (1, 5, 15 min)
vmstat 1     # virtual memory / CPU stats every second
df -h        # disk space
du -sh *     # size of each item in the current directory
```

> **Reading load average:** the three numbers are the average number of processes waiting to run
> over the last 1, 5, and 15 minutes. As a rule of thumb, a value roughly equal to your CPU core
> count means the machine is fully but healthily loaded.

---

## Remote Desktop (xRDP)

Ubuntu Server has no graphical interface by default. **xRDP** lets you connect to a Linux desktop
using Microsoft's Remote Desktop client (RDP), which is built into Windows and available for macOS.

### Install a Desktop Environment + xRDP

```bash
sudo apt update
sudo apt install -y xfce4 xfce4-goodies   # a lightweight desktop
sudo apt install -y xrdp                   # the RDP server
sudo systemctl enable --now xrdp           # start it and enable at boot
```

### Point xRDP at the Desktop

Tell xRDP to launch XFCE for your session:

```bash
echo "xfce4-session" | tee ~/.xsession
sudo systemctl restart xrdp
```

### Allow RDP Through the Firewall

```bash
sudo ufw allow 3389/tcp
sudo ufw reload
```

### Connect

Open **Remote Desktop Connection** (Windows) or a client such as **Microsoft Remote Desktop**
(macOS), enter the server's IP address, and log in with your Linux username and password.

> **Tip:** Log out of any local console session for that user first — xRDP and the local session
> can conflict when using the same account.

---

## Ubuntu Server Networking & Firewall

### Inspecting the Network

```bash
ip addr            # show IP addresses (replaces the old ifconfig)
ip route           # show the routing table / default gateway
hostname -I        # just this machine's IP address(es)
ping -c 4 8.8.8.8  # test connectivity (4 packets)
ss -tulpn          # list listening ports and the programs using them
dig example.com    # DNS lookup (or: nslookup example.com)
```

### Configuring a Static IP (Netplan)

Ubuntu Server uses **Netplan**. Configuration lives in `/etc/netplan/*.yaml`:

```yaml
# /etc/netplan/01-netcfg.yaml  (YAML is indentation-sensitive — use spaces, not tabs)
network:
  version: 2
  ethernets:
    eth0:
      dhcp4: no
      addresses:
        - 192.168.1.50/24
      routes:
        - to: default
          via: 192.168.1.1
      nameservers:
        addresses: [8.8.8.8, 1.1.1.1]
```

Apply the configuration:

```bash
sudo netplan apply
```

### The Firewall (UFW)

**UFW** ("Uncomplicated Firewall") is Ubuntu's friendly front end for the firewall.

```bash
sudo ufw status verbose        # current rules
sudo ufw allow OpenSSH         # allow SSH (do this BEFORE enabling!)
sudo ufw allow 80/tcp          # allow HTTP
sudo ufw allow 443/tcp         # allow HTTPS
sudo ufw deny 23               # block a port
sudo ufw delete allow 80/tcp   # remove a rule
sudo ufw enable                # turn the firewall on
sudo ufw disable               # turn it off
```

> ⚠️ **Always `sudo ufw allow OpenSSH` before running `sudo ufw enable` on a remote server**, or
> you will cut off your own SSH connection.

---

## Applications & Monitoring

### Installing & Managing Software (apt)

```bash
sudo apt update                 # refresh the package index (do this first)
sudo apt upgrade                # install available updates
sudo apt install <package>      # install software
sudo apt remove <package>       # remove it (keep config files)
sudo apt purge <package>        # remove it and its config files
sudo apt autoremove             # clean up unused dependencies
apt search <keyword>            # find a package
apt show <package>              # details about a package
dpkg -l                         # list all installed packages
```

> **RHEL-family equivalent:** replace `apt` with `dnf` (e.g. `sudo dnf install <package>`).

**Snap** packages are also common on Ubuntu:

```bash
sudo snap install <package>
snap list
```

### Managing Services (systemd)

Most background programs (web servers, SSH, databases) are managed by **systemd**.

```bash
sudo systemctl start   <service>   # start now
sudo systemctl stop    <service>   # stop now
sudo systemctl restart <service>   # restart
sudo systemctl status  <service>   # is it running? recent logs
sudo systemctl enable  <service>   # start automatically at boot
sudo systemctl disable <service>   # don't start at boot
```

### Monitoring the System

```bash
top / htop            # live processes and resource usage
free -h               # memory
df -h                 # disk space
ss -tulpn             # open ports
journalctl -xe        # systemd logs (recent, with explanations)
journalctl -u ssh     # logs for a specific service
dmesg                 # kernel ring buffer (hardware/boot messages)
uptime                # how long the system has been up + load
```

### Scheduling Tasks (cron)

Automate recurring jobs with `cron`:

```bash
crontab -e     # edit YOUR user's scheduled jobs
crontab -l     # list them
```

```cron
# ┌ minute ┌ hour ┌ day-of-month ┌ month ┌ day-of-week   command
# │        │      │              │       │
  0        2      *              *       *   /home/alice/backup.sh   # daily at 2:00 AM
```

---

## Knowledge Checks

Try to answer without scrolling up. Solutions and deeper labs are in
[`exercises/`](exercises/).

**Module 3 — Users**
1. What is the difference between `su` and `sudo`?
2. Why is the `-a` flag important in `sudo usermod -aG sudo bob`?
3. Which command adds a new user *and* creates their home directory on Ubuntu?

**Module 4 — SSH**
4. Which key of an SSH key pair do you copy to the server, and which do you keep secret?
5. Why should you keep an existing SSH session open when changing `sshd_config`?

**Module 5 — Command Line**
6. What does `chmod 640 report.txt` allow, and for whom?
7. Write a pipeline that shows the 3 most common IP addresses in `access.log`.

**Module 9 — Networking**
8. Why must you allow SSH in UFW *before* enabling the firewall?
9. Which file configures a static IP on modern Ubuntu Server?

<details>
<summary><b>Show answers</b></summary>

1. `su` switches to another user (default root) and starts a shell as them; `sudo` runs a **single**
   command with elevated privileges using **your own** password.
2. `-a` **appends** the group. Without it, `-G` **replaces** all of the user's secondary groups.
3. `sudo adduser bob` (the higher-level tool; `useradd` is lower-level and needs extra flags).
4. Copy the **public** key (`.pub`) to the server; keep the **private** key secret on your machine.
5. So you can test a fresh connection and fix mistakes before getting locked out.
6. `640` = owner read/write, group read, others nothing.
7. `awk '{print $1}' access.log | sort | uniq -c | sort -rn | head -n 3`
8. Enabling UFW with a default-deny policy would immediately drop your SSH connection.
9. A YAML file under `/etc/netplan/` (applied with `sudo netplan apply`).

</details>

---

## Hands-On Labs

Guided, do-it-yourself labs live in the [`exercises/`](exercises/) directory:

| Lab | Topic |
| :--- | :--- |
| [Lab 01](exercises/lab-01-users-and-permissions.md) | Users, groups, sudo & permissions |
| [Lab 02](exercises/lab-02-ssh-keys.md) | Passwordless SSH with keys |
| [Lab 03](exercises/lab-03-files-and-text.md) | Files, pipes & text processing |
| [Lab 04](exercises/lab-04-services-and-firewall.md) | Web server, systemd & UFW |

Each lab has objectives, step-by-step tasks, and a "verify your work" checklist.

---

## References & Further Reading

**Quick references in this repo**

- 📄 [Command Cheat Sheet](resources/cheat-sheet.md) — the most-used commands on one page.
- 📚 [Glossary](resources/glossary.md) — plain-English definitions of every term.
- 🧪 [Hands-On Labs](exercises/) — practice exercises with solutions.

**Official documentation**

- [Ubuntu Server Documentation](https://ubuntu.com/server/docs)
- [The Linux Kernel Archives](https://www.kernel.org/)
- [The `man` pages online](https://man7.org/linux/man-pages/)
- [Filesystem Hierarchy Standard](https://refspecs.linuxfoundation.org/fhs.shtml)

**Free learning resources**

- [Linux Journey](https://linuxjourney.com/)
- [The Linux Command Line (free book, W. Shotts)](https://linuxcommand.org/tlcl.php)
- [OverTheWire: Bandit](https://overthewire.org/wargames/bandit/) — learn by playing.
- [explainshell.com](https://explainshell.com/) — paste any command to see what each part does.

---

<div align="center">

Found an error or want to add content? See [CONTRIBUTING.md](CONTRIBUTING.md).
This project is licensed under the [MIT License](LICENSE).

⭐ If this module helped you, consider starring the repo.

</div>
