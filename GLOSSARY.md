# Glossary – Linux for Beginners

Key terms and definitions used throughout this course.

---

## A

**absolute path**  
A file path that starts from the root directory `/` and fully specifies the location of a file regardless of the current working directory. Example: `/etc/ssh/sshd_config`.

**apt** (Advanced Package Tool)  
Ubuntu's command-line package manager. Used to install, update, and remove software.

**AlmaLinux**  
A free, open-source, enterprise-grade Linux distribution that is binary-compatible with Red Hat Enterprise Linux (RHEL).

**authentication**  
The process of verifying the identity of a user or system. On Linux, common methods include passwords and SSH keys.

---

## B

**bash** (Bourne Again SHell)  
The default command-line shell on Ubuntu and most Linux distributions. Interprets commands typed at the terminal.

**binary**  
An executable file. In Linux, binary files are stored in `/bin`, `/sbin`, `/usr/bin`, and `/usr/sbin`.

**boot**  
The process of starting up a computer and loading the operating system.

**bootloader**  
Software (typically GRUB on Linux) that loads the operating system kernel into memory at startup.

---

## C

**chmod**  
Command to change file or directory permissions. Accepts either symbolic (`chmod +x`) or numeric (`chmod 755`) notation.

**chown**  
Command to change the owner and/or group of a file or directory.

**cron**  
A daemon that runs scheduled tasks (cron jobs) at specified times. Cron jobs are defined in a crontab file.

**curl**  
A command-line tool for transferring data using URLs, commonly used to test HTTP connections and APIs.

---

## D

**daemon**  
A background process that runs continuously to provide a service. Examples: `sshd` (SSH), `nginx` (web server), `cron`.

**Debian**  
A major Linux distribution known for its stability. Ubuntu is derived from Debian.

**DHCP** (Dynamic Host Configuration Protocol)  
A network protocol that automatically assigns IP addresses to devices on a network.

**distro** (distribution)  
A complete operating system based on the Linux kernel, packaged with tools, a package manager, and optionally a desktop environment.

---

## E

**Ed25519**  
A modern, secure elliptic-curve algorithm used for SSH key generation. Preferred over older RSA keys.

**environment variable**  
A named value stored in the shell environment. Examples: `PATH`, `HOME`, `USER`.

---

## F

**FHS** (Filesystem Hierarchy Standard)  
A standard that defines the directory structure and directory contents on Linux systems.

**firewall**  
Software or hardware that controls network traffic by allowing or denying connections based on rules.

**fstab** (`/etc/fstab`)  
A configuration file that defines filesystems and their mount points. The system reads it at boot to mount filesystems automatically.

---

## G

**GID** (Group ID)  
A unique number that identifies a group on the system.

**GRUB** (GRand Unified Bootloader)  
The most common bootloader on Linux systems. Allows selecting an OS or kernel at startup.

**group**  
A collection of users. File permissions can be set for a group, allowing shared access to resources.

**GUI** (Graphical User Interface)  
A visual interface that uses windows, icons, and menus. Ubuntu Desktop and Xfce are examples.

---

## H

**htop**  
An interactive terminal application that displays real-time system resource usage (CPU, memory, processes).

**hostname**  
The name assigned to a computer on a network. Displayed in the shell prompt and stored in `/etc/hostname`.

**hypervisor**  
Software that creates and manages virtual machines. VirtualBox and VMware are examples.

---

## I

**inode**  
A data structure that stores metadata about a file (permissions, owner, timestamps) but not the file name or content.

**IP address**  
A numerical label assigned to each device on a network. IPv4 addresses are in the form `192.168.1.105`.

---

## K

**kernel**  
The core of the operating system. Manages hardware resources (CPU, RAM, disk) and provides services to programs. The Linux kernel was created by Linus Torvalds.

**KVM** (Kernel-based Virtual Machine)  
A virtualisation technology built into the Linux kernel that allows Linux to act as a hypervisor.

---

## L

**Linux**  
An open-source operating system kernel first released in 1991 by Linus Torvalds. Used as the base of many distributions.

**LVM** (Logical Volume Manager)  
A flexible disk partitioning system that allows resizing partitions without rebooting.

---

## M

**man page**  
Built-in documentation for a command. Access with `man <command>`. Press `q` to quit.

**mount**  
Attaching a filesystem (disk, partition, or network share) to a directory in the Linux directory tree.

---

## N

**nano**  
A simple, beginner-friendly terminal text editor. Included by default on Ubuntu.

**nginx**  
A high-performance web server and reverse proxy. Popular for serving web applications.

---

## O

**open source**  
Software with publicly available source code that anyone can inspect, modify, and distribute.

---

## P

**package**  
A bundled collection of files that make up a software application or library. On Ubuntu, packages are `.deb` files.

**package manager**  
A tool that automates installing, updating, and removing software packages. Ubuntu uses `apt`.

**PATH**  
An environment variable that lists directories the shell searches when you type a command name.

**PID** (Process ID)  
A unique number assigned to each running process by the kernel.

**pipe** (`|`)  
A shell operator that sends the output of one command as input to another. Example: `ps aux | grep nginx`.

**port**  
A number (0–65535) that identifies a specific service on a host. SSH uses port 22; HTTP uses port 80.

**process**  
An instance of a running program. Each process has a unique PID.

**proxy**  
An intermediary server between a client and a destination. Often used in corporate networks to control internet access.

---

## R

**RBAC** (Role-Based Access Control)  
An access control model where permissions are assigned to roles, and users are assigned to roles.

**RDP** (Remote Desktop Protocol)  
A Microsoft protocol that provides graphical remote desktop access. xRDP is an open-source Linux implementation.

**RHEL** (Red Hat Enterprise Linux)  
A commercial Linux distribution from Red Hat, widely used in enterprise environments.

**root**  
The superuser account with full system access. UID 0. Also refers to the top-level directory `/`.

**relative path**  
A file path that is resolved relative to the current working directory. Example: `../etc/hostname`.

**repository** (repo)  
A server that hosts software packages. `apt` downloads packages from configured repositories.

---

## S

**scp** (Secure Copy)  
A command for securely copying files over SSH. Uses the same encryption as SSH.

**shell**  
A program that interprets user commands and interacts with the operating system. bash is the most common Linux shell.

**SSH** (Secure Shell)  
A cryptographic protocol for secure remote terminal access. Replaces Telnet and rsh.

**sudo**  
A command that allows a permitted user to run commands with root privileges. Stands for "substitute user do".

**swap**  
Disk space used as overflow memory when RAM is full. Can be a partition or a file.

**symlink** (symbolic link)  
A file that points to another file or directory. Created with `ln -s`.

**systemctl**  
The command-line tool for managing systemd services.

**systemd**  
The init system and service manager used by Ubuntu and most modern Linux distributions.

---

## T

**terminal**  
A text-based interface for interacting with the shell.

**TTY**  
A physical or virtual terminal. Linux systems usually have 6 virtual TTYs accessible with <kbd>Ctrl</kbd>+<kbd>Alt</kbd>+<kbd>F1</kbd> through <kbd>F6</kbd>.

---

## U

**Ubuntu**  
A popular Linux distribution based on Debian, developed by Canonical. Available in Desktop and Server editions.

**UFW** (Uncomplicated Firewall)  
Ubuntu's user-friendly interface for managing the `iptables` firewall.

**UID** (User ID)  
A unique number assigned to each user. Root has UID 0; regular users start at UID 1000.

---

## V

**VirtualBox**  
A free, open-source hypervisor from Oracle. Used to run virtual machines on Windows, macOS, or Linux.

**VM** (Virtual Machine)  
An isolated, software-based computer that runs inside a physical computer using a hypervisor.

---

## W

**WSL** (Windows Subsystem for Linux)  
A Microsoft feature that runs a Linux environment inside Windows without a virtual machine.

---

## X

**Xfce**  
A lightweight desktop environment for Linux. Used in this course as the graphical interface for xRDP.

**xRDP**  
An open-source implementation of the RDP protocol for Linux, enabling graphical remote desktop access.

---

[Back to Course Home](README.md) | [Command Cheat Sheet →](CHEATSHEET.md)
