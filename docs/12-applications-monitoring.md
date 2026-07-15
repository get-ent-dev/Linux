# Module 12 – Applications & System Monitoring

[← Module 11: Remote Desktop](11-remote-desktop.md) | [Back to Course Home](../README.md)

---

## Learning Objectives

By the end of this module you will be able to:

- Monitor live system resource usage with `htop`
- Use `top`, `ps`, and `kill` to manage processes
- Install and use `virt-manager` for virtual machine management
- Check disk I/O and find large files
- Schedule tasks with `cron`

**Estimated time:** 30 minutes

---

## 12.1 Monitoring with htop

`htop` is an interactive process viewer that shows CPU, memory, and swap usage in real time with a colour-coded interface.

### Install htop

```bash
sudo apt install htop -y
```

### Run htop

```bash
htop
```

![htop screenshot](https://github.com/user-attachments/assets/1a0f05d1-e195-4ce7-bdd9-4886e8671f83)

### htop Interface Overview

```
CPU[|||||||||||||||  45.2%]
Mem[||||||||||||||||  1.20G/1.96G]
Swp[               0K/4.00G]

  PID USER      PRI  NI  VIRT   RES   SHR S CPU% MEM%   TIME+  Command
 1234 linuxuser  20   0  123M   45M  15M  S  5.2  2.3  0:12.34 /usr/bin/python3
  ...
```

| Column | Meaning |
| :--- | :--- |
| `PID` | Process ID |
| `USER` | Owner of the process |
| `PRI` | Process priority |
| `VIRT` | Total virtual memory used |
| `RES` | Resident (physical) memory used |
| `CPU%` | CPU usage percentage |
| `MEM%` | Memory usage percentage |
| `Command` | Command that started the process |

### htop Keyboard Shortcuts

| Key | Action |
| :--- | :--- |
| <kbd>F1</kbd> | Help |
| <kbd>F2</kbd> | Setup / configuration |
| <kbd>F3</kbd> | Search for a process |
| <kbd>F5</kbd> | Tree view |
| <kbd>F6</kbd> | Sort by column |
| <kbd>F9</kbd> | Kill selected process |
| <kbd>F10</kbd> or <kbd>Q</kbd> | Quit |
| <kbd>U</kbd> | Filter by user |
| <kbd>M</kbd> | Sort by memory usage |
| <kbd>P</kbd> | Sort by CPU usage |

---

## 12.2 The top Command

`top` is the traditional process viewer. It is available on virtually every Unix/Linux system without installation.

```bash
top
```

Press `q` to quit.

### Useful top Keybindings

| Key | Action |
| :--- | :--- |
| `M` | Sort by memory |
| `P` | Sort by CPU |
| `k` | Kill a process (enter PID) |
| `q` | Quit |

---

## 12.3 Managing Processes

### List All Running Processes

```bash
ps aux
```

| Column | Meaning |
| :--- | :--- |
| `USER` | Owner of the process |
| `PID` | Process ID |
| `%CPU` | CPU usage |
| `%MEM` | Memory usage |
| `COMMAND` | Command that started the process |

### Find a Specific Process

```bash
ps aux | grep nginx
```

Or use `pgrep`:

```bash
pgrep nginx
```

### Kill a Process

```bash
kill <PID>              # Graceful termination (SIGTERM)
kill -9 <PID>           # Forceful termination (SIGKILL)
```

Kill all processes with a given name:

```bash
pkill nginx
```

### Process Signals

| Signal | Number | Meaning |
| :--- | :--- | :--- |
| `SIGTERM` | 15 | Politely ask the process to terminate (default) |
| `SIGKILL` | 9 | Forcefully kill (cannot be caught or ignored) |
| `SIGHUP` | 1 | Reload configuration (many daemons respond to this) |

---

## 12.4 Disk I/O Monitoring

### View Disk Usage

```bash
df -h                    # Filesystem usage
du -sh /var/log          # Size of a specific directory
du -sh /* 2>/dev/null    # Size of top-level directories
```

### Find Large Files

```bash
find / -type f -size +100M 2>/dev/null
```

This finds files larger than 100 MB. Useful for locating space consumers.

### Monitor Disk I/O in Real Time

Install `iotop`:

```bash
sudo apt install iotop -y
sudo iotop
```

`iotop` shows which processes are reading/writing most to disk.

---

## 12.5 Checking System Load and Uptime

```bash
uptime
```

Output example:

```
09:45:23 up 3 days,  2:15,  2 users,  load average: 0.15, 0.20, 0.18
```

| Field | Meaning |
| :--- | :--- |
| `up 3 days, 2:15` | System has been running for 3 days and 2 hours |
| `2 users` | Two active login sessions |
| `load average: 0.15, 0.20, 0.18` | Average CPU load over 1, 5, and 15 minutes |

**Load average interpretation:**

On a single-CPU system, a load average above 1.0 means the CPU is overloaded.  
On a 4-CPU system, a load average up to 4.0 is normal.

```bash
nproc       # Number of CPU cores
```

---

## 12.6 Installing virt-manager (Virtual Machine Manager)

`virt-manager` is a graphical application for managing KVM/QEMU virtual machines — useful when you want to run VMs inside your Ubuntu server.

### Prerequisites

Your CPU must support hardware virtualisation (Intel VT-x or AMD-V). Check:

```bash
grep -o 'vmx\|svm' /proc/cpuinfo | head -1
```

Output `vmx` (Intel) or `svm` (AMD) confirms support.

### Install virt-manager and KVM

```bash
sudo apt install virt-manager qemu-kvm libvirt-daemon-system -y
```

### Add Your User to the libvirt Group

```bash
sudo usermod -aG libvirt $(whoami)
```

Log out and back in for the group change to take effect.

### Reboot

```bash
sudo reboot
```

After rebooting, you can launch virt-manager from the terminal (if a desktop environment is installed):

```bash
virt-manager
```

Or manage VMs from the command line:

```bash
virsh list --all      # List all VMs
virsh start myvm      # Start a VM
virsh shutdown myvm   # Gracefully shut down a VM
```

---

## 12.7 Scheduling Tasks with Cron

**Cron** is a time-based job scheduler. Use it to automate recurring tasks.

### Edit the User's Crontab

```bash
crontab -e
```

### Crontab Syntax

```
┌───────────── minute (0–59)
│ ┌─────────── hour (0–23)
│ │ ┌───────── day of month (1–31)
│ │ │ ┌─────── month (1–12)
│ │ │ │ ┌───── day of week (0–7, 0 and 7 = Sunday)
│ │ │ │ │
* * * * * command-to-execute
```

### Common Crontab Examples

```cron
# Run apt update every day at 2:00 AM
0 2 * * * sudo apt update

# Back up a directory every Sunday at 3:30 AM
30 3 * * 0 tar -czf /backup/home-$(date +\%F).tar.gz /home/linuxuser

# Clear /tmp every hour
0 * * * * rm -rf /tmp/*
```

### Cron Shorthand

| Shorthand | Equivalent |
| :--- | :--- |
| `@reboot` | Run once on startup |
| `@hourly` | `0 * * * *` |
| `@daily` | `0 0 * * *` |
| `@weekly` | `0 0 * * 0` |
| `@monthly` | `0 0 1 * *` |

### View Current Crontab

```bash
crontab -l
```

---

## 12.8 Monitoring Quick Reference

| Task | Command |
| :--- | :--- |
| Interactive process monitor | `htop` |
| Classic process monitor | `top` |
| List all processes | `ps aux` |
| Find a process by name | `ps aux \| grep <name>` |
| Kill a process | `kill <PID>` or `pkill <name>` |
| Check disk usage | `df -h` |
| Check directory size | `du -sh <dir>` |
| Find large files | `find / -size +100M 2>/dev/null` |
| View system uptime and load | `uptime` |
| View CPU count | `nproc` |
| Schedule tasks | `crontab -e` |

---

## 12.9 Module Summary

- `htop` provides a clear, interactive view of processes, CPU, memory, and swap
- `ps aux | grep <name>` finds processes; `kill <PID>` stops them
- `df -h` and `du -sh` show disk usage; `find / -size +100M` locates large files
- Load average tells you whether your CPUs are under or over capacity
- `virt-manager` provides a GUI for managing KVM virtual machines on Linux
- `crontab -e` schedules recurring tasks using the cron time syntax

---

## Course Complete!

Congratulations! You have completed all 12 modules of the **Linux for Beginners** course. You now have the foundational skills to:

- Install and configure Ubuntu Server
- Navigate the Linux filesystem
- Manage users, groups, and permissions
- Connect securely via SSH
- Manage packages and services
- Work with files, directories, and text
- Configure networking and firewall rules
- Tune server performance with swap
- Enable a graphical remote desktop
- Monitor system health

### Next Steps

| Topic | Resource |
| :--- | :--- |
| Bash scripting | [LinuxCommand.org](http://linuxcommand.org/lc3_learning_the_shell.php) |
| Web servers (Nginx) | [DigitalOcean Nginx Guide](https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-ubuntu-22-04) |
| Databases (MySQL/PostgreSQL) | [Server World DB Guide](https://www.server-world.info/en/note?os=Ubuntu_22.04) |
| Docker & Containers | [Docker Get Started](https://docs.docker.com/get-started/) |
| System administration | [Linux Command Reference](https://www.server-world.info/) |
| CompTIA Linux+ Certification | [CompTIA Linux+](https://www.comptia.org/certifications/linux) |

---

[← Module 11: Remote Desktop](11-remote-desktop.md) | [Back to Course Home](../README.md)
