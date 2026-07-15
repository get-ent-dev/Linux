# Module 7 – Basic Command Line Operations

[← Module 6: SSH](06-ssh.md) | [Back to Course Home](../README.md) | [Next Module: File & Directory Operations →](08-file-operations.md)

---

## Learning Objectives

By the end of this module you will be able to:

- Use the bash shell effectively (history, tab completion, shortcuts)
- Update and upgrade packages with `apt`
- Install and remove software
- View system information (hostname, uptime, disk, memory)
- Schedule a reboot and gracefully shut down the server
- Read and follow system logs

**Estimated time:** 45 minutes

---

## 7.1 The Bash Shell

When you log in to Ubuntu Server, you are placed in the **bash shell** (Bourne Again SHell). The command prompt looks like:

```
linuxuser@ubuntu-server:~$
```

| Part | Meaning |
| :--- | :--- |
| `linuxuser` | Current user |
| `ubuntu-server` | Hostname |
| `~` | Current directory (tilde = home) |
| `$` | Regular user (root shows `#`) |

### Productivity Tips

| Feature | How to Use |
| :--- | :--- |
| **Tab completion** | Press <kbd>Tab</kbd> to autocomplete commands and paths |
| **Command history** | Press <kbd>↑</kbd>/<kbd>↓</kbd> to cycle through previous commands |
| **Search history** | Press <kbd>Ctrl</kbd>+<kbd>R</kbd> and type to search |
| **Cancel a command** | Press <kbd>Ctrl</kbd>+<kbd>C</kbd> |
| **Clear the screen** | Press <kbd>Ctrl</kbd>+<kbd>L</kbd> or type `clear` |
| **Exit the shell** | Type `exit` or press <kbd>Ctrl</kbd>+<kbd>D</kbd> |

### Useful Shell Features

```bash
# Repeat last command
!!

# Run multiple commands in sequence (stop on error)
sudo apt update && sudo apt upgrade -y

# Run multiple commands regardless of errors
sudo apt update ; sudo apt upgrade -y

# Run a command in the background
sudo apt upgrade -y &

# View command history
history

# Run command number 42 from history
!42
```

---

## 7.2 Package Management with APT

Ubuntu uses the **APT (Advanced Package Tool)** system to manage software packages.

### Understanding the Process

```
Package Repository (Internet)
        ↓  apt update       (refresh the package index)
   Package Index
        ↓  apt install      (download + install)
   Installed Software
        ↓  apt upgrade      (update installed packages)
   Updated Software
```

### Update the Package Index

Always run this before installing or upgrading:

```bash
sudo apt update
```

This downloads the latest package lists from the configured repositories. It does **not** install any updates — it only refreshes what's available.

### Upgrade Installed Packages

```bash
sudo apt upgrade
```

Or auto-confirm all prompts:

```bash
sudo apt upgrade -y
```

### Combined Update + Upgrade (Most Common)

```bash
sudo apt update && sudo apt upgrade -y
```

> **Best practice:** Run this every time you log in to keep security patches current.

### Install a Package

```bash
sudo apt install <package-name>
```

**Examples:**

```bash
sudo apt install curl
sudo apt install git
sudo apt install nginx
```

Install multiple packages at once:

```bash
sudo apt install curl git wget unzip
```

### Remove a Package

```bash
sudo apt remove <package-name>
```

Remove the package and its configuration files:

```bash
sudo apt purge <package-name>
```

Remove packages that are no longer needed:

```bash
sudo apt autoremove
```

### Search for a Package

```bash
apt search <keyword>
```

### Get Package Information

```bash
apt show <package-name>
```

### List Installed Packages

```bash
apt list --installed
```

---

## 7.3 System Information Commands

### Hostname

```bash
hostname
```

Change the hostname permanently:

```bash
sudo hostnamectl set-hostname new-server-name
```

### System and Kernel Version

```bash
uname -a
```

Or more readable:

```bash
lsb_release -a
```

### Uptime

```bash
uptime
```

Shows how long the system has been running, load averages over 1, 5, and 15 minutes.

### CPU Information

```bash
lscpu
```

Or:

```bash
cat /proc/cpuinfo
```

### Memory Usage

```bash
free -h
```

| Column | Meaning |
| :--- | :--- |
| `total` | Total installed RAM |
| `used` | Memory in use |
| `free` | Completely unused memory |
| `available` | Memory available for new processes (includes reclaimable cache) |

### Disk Usage

```bash
df -h
```

Show disk usage for a specific directory:

```bash
du -sh /var/log
```

### Running Processes

```bash
ps aux
```

Or interactively (covered more in Module 12):

```bash
top
```

### Network Information

```bash
ip addr show
ip route show
```

---

## 7.4 Managing Services with systemctl

Ubuntu uses **systemd** to manage services (background programs).

### Service Commands

```bash
# Check the status of a service
sudo systemctl status <service>

# Start a service
sudo systemctl start <service>

# Stop a service
sudo systemctl stop <service>

# Restart a service
sudo systemctl restart <service>

# Enable a service to start at boot
sudo systemctl enable <service>

# Disable a service from starting at boot
sudo systemctl disable <service>
```

**Examples:**

```bash
sudo systemctl status ssh
sudo systemctl restart nginx
sudo systemctl enable ufw
```

### List All Running Services

```bash
systemctl list-units --type=service --state=running
```

---

## 7.5 Rebooting and Shutting Down

### Reboot the Server

```bash
sudo reboot
```

Or schedule a reboot in 5 minutes with a warning message:

```bash
sudo shutdown -r +5 "Rebooting for kernel update in 5 minutes"
```

### Shut Down

```bash
sudo shutdown -h now
```

### Cancel a Scheduled Shutdown

```bash
sudo shutdown -c
```

---

## 7.6 Reading Log Files

System logs are stored in `/var/log/`. They are essential for troubleshooting.

| Log File | Contents |
| :--- | :--- |
| `/var/log/syslog` | General system messages |
| `/var/log/auth.log` | Authentication and sudo activity |
| `/var/log/kern.log` | Kernel messages |
| `/var/log/dpkg.log` | Package installation history |
| `/var/log/apt/history.log` | apt command history |

### Read a Log File

```bash
# View the whole file
cat /var/log/syslog

# View the last 50 lines
tail -n 50 /var/log/syslog

# Watch a log file in real time
sudo tail -f /var/log/syslog
```

### Use journalctl (systemd Journal)

```bash
# View all logs
journalctl

# View logs for a specific service
journalctl -u ssh

# View logs since the last boot
journalctl -b

# Follow new log entries in real time
journalctl -f
```

---

## 7.7 Getting Help

### Man Pages

Every command has a manual page:

```bash
man apt
man ls
man ssh
```

Press `q` to quit the man page.

### Built-in Help

Most commands accept `-h` or `--help`:

```bash
apt --help
ls --help
ssh --help
```

---

## 7.8 Module Summary

- `sudo apt update && sudo apt upgrade -y` keeps the system current — run it regularly
- `sudo apt install <package>` installs software; `sudo apt remove <package>` removes it
- `df -h`, `free -h`, and `uptime` give quick system health snapshots
- `systemctl` manages services: `start`, `stop`, `restart`, `enable`, `disable`
- `sudo reboot` and `sudo shutdown -h now` restart or power off gracefully
- Logs in `/var/log/` and `journalctl` are your first stop when troubleshooting

---

## Knowledge Check

1. What does `sudo apt update` do? (Be specific — does it install updates?)
2. How would you install `git` and `curl` in a single command?
3. What command shows how long the server has been running?
4. What `systemctl` sub-command prevents a service from starting at boot?
5. How do you watch a log file update in real time?

*(Answers: 1. Refreshes the package index from repositories — it does NOT install updates | 2. `sudo apt install git curl` | 3. `uptime` | 4. `disable` | 5. `sudo tail -f /var/log/syslog` or `journalctl -f`)*

---

[← Module 6: SSH](06-ssh.md) | [Back to Course Home](../README.md) | [Next Module: File & Directory Operations →](08-file-operations.md)
