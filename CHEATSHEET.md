# Linux for Beginners – Command Cheat Sheet

Quick reference for all commands covered in this course. Print or bookmark this page.

---

## Navigation & Filesystem

| Command | Description |
| :--- | :--- |
| `pwd` | Print current working directory |
| `ls` | List directory contents |
| `ls -la` | List all files with details (including hidden) |
| `ls -lh` | List with human-readable file sizes |
| `cd <path>` | Change directory |
| `cd ~` | Go to home directory |
| `cd ..` | Go up one directory level |
| `cd -` | Go to previous directory |
| `tree` | Show directory tree (requires install) |
| `find / -name <filename>` | Find a file by name |
| `which <command>` | Show the full path of a command |

---

## Package Management (apt)

| Command | Description |
| :--- | :--- |
| `sudo apt update` | Refresh the package index |
| `sudo apt upgrade -y` | Upgrade all installed packages |
| `sudo apt update && sudo apt upgrade -y` | Update index and upgrade in one step |
| `sudo apt install <package>` | Install a package |
| `sudo apt remove <package>` | Remove a package |
| `sudo apt purge <package>` | Remove a package and its config files |
| `sudo apt autoremove` | Remove unused dependency packages |
| `apt search <keyword>` | Search for a package |
| `apt show <package>` | Show package details |
| `apt list --installed` | List all installed packages |

---

## Files & Directories

| Command | Description |
| :--- | :--- |
| `touch <file>` | Create an empty file |
| `mkdir <dir>` | Create a directory |
| `mkdir -p a/b/c` | Create nested directories |
| `cp <src> <dest>` | Copy a file |
| `cp -r <src> <dest>` | Copy a directory recursively |
| `mv <src> <dest>` | Move or rename a file/directory |
| `rm <file>` | Delete a file |
| `rm -rf <dir>` | Delete a directory and all contents |
| `rmdir <dir>` | Remove an empty directory |
| `cat <file>` | Display file contents |
| `less <file>` | Page through a file (q to quit) |
| `head -n 10 <file>` | Show first 10 lines |
| `tail -n 10 <file>` | Show last 10 lines |
| `tail -f <file>` | Watch file for new content |
| `nano <file>` | Open file in nano editor |
| `echo "text" > <file>` | Write text to file (overwrites) |
| `echo "text" >> <file>` | Append text to file |
| `grep "pattern" <file>` | Search for pattern in file |
| `grep -r "pattern" <dir>` | Recursive search in directory |
| `grep -i "pattern" <file>` | Case-insensitive search |

---

## Permissions & Ownership

| Command | Description |
| :--- | :--- |
| `ls -l` | View file permissions |
| `chmod 755 <file>` | Set permissions numerically |
| `chmod +x <file>` | Add execute permission |
| `chmod u+w <file>` | Add write permission for owner |
| `chmod go-rwx <file>` | Remove all permissions from group/others |
| `chown user:group <file>` | Change file owner and group |
| `sudo chown -R user <dir>` | Recursively change ownership |

**Common permission patterns:**

| Octal | String | Use Case |
| :--- | :--- | :--- |
| 755 | `rwxr-xr-x` | Executables, directories |
| 644 | `rw-r--r--` | Normal files |
| 600 | `rw-------` | Private files (SSH keys) |
| 700 | `rwx------` | Private directories |

---

## User Management

| Command | Description |
| :--- | :--- |
| `whoami` | Show current user |
| `id` | Show user ID and group memberships |
| `who` | Show logged-in users |
| `sudo adduser <username>` | Create a new user interactively |
| `sudo deluser <username>` | Delete a user |
| `sudo deluser --remove-home <username>` | Delete user and home directory |
| `groups <username>` | Show user's groups |
| `sudo usermod -aG <group> <user>` | Add user to a group |
| `su - <username>` | Switch to another user |
| `sudo su -` | Switch to root |
| `passwd` | Change your own password |
| `sudo passwd <username>` | Change another user's password |

---

## SSH

| Command | Description |
| :--- | :--- |
| `ssh user@ip` | Connect to remote server |
| `ssh-keygen -t ed25519` | Generate an SSH key pair |
| `ssh-copy-id user@ip` | Copy public key to server |
| `scp file user@ip:/path/` | Copy file to remote server |
| `scp user@ip:/path/file .` | Copy file from remote server |
| `exit` | Close SSH session |

---

## Services (systemctl)

| Command | Description |
| :--- | :--- |
| `sudo systemctl status <svc>` | Check service status |
| `sudo systemctl start <svc>` | Start a service |
| `sudo systemctl stop <svc>` | Stop a service |
| `sudo systemctl restart <svc>` | Restart a service |
| `sudo systemctl enable <svc>` | Enable service at boot |
| `sudo systemctl disable <svc>` | Disable service at boot |
| `systemctl list-units --type=service` | List all services |

---

## Networking

| Command | Description |
| :--- | :--- |
| `ip addr show` | Show IP addresses |
| `ip route show` | Show routing table |
| `ping -c 4 <host>` | Ping a host 4 times |
| `ss -tlnp` | Show listening TCP ports |
| `curl -I https://example.com` | Fetch HTTP headers |
| `nslookup <domain>` | Query DNS |

---

## UFW Firewall

| Command | Description |
| :--- | :--- |
| `sudo ufw status` | Show firewall status |
| `sudo ufw status numbered` | Show rules with numbers |
| `sudo ufw enable` | Enable the firewall |
| `sudo ufw disable` | Disable the firewall |
| `sudo ufw allow ssh` | Allow SSH (port 22) |
| `sudo ufw allow 80` | Allow HTTP |
| `sudo ufw allow 443` | Allow HTTPS |
| `sudo ufw allow 3389` | Allow RDP |
| `sudo ufw deny from <ip>` | Block an IP address |
| `sudo ufw delete <number>` | Delete a rule by number |
| `sudo ufw default deny incoming` | Block all incoming by default |

---

## Swap

| Command | Description |
| :--- | :--- |
| `sudo swapon --show` | Check active swap |
| `free -h` | Show memory and swap usage |
| `df -h` | Show disk usage |
| `sudo swapoff -a` | Disable all swap |
| `sudo fallocate -l 4G /swapfile` | Create a 4 GB swap file |
| `sudo chmod 600 /swapfile` | Secure the swap file |
| `sudo mkswap /swapfile` | Format as swap |
| `sudo swapon /swapfile` | Activate swap |
| `cat /proc/sys/vm/swappiness` | Check swappiness value |
| `sudo sysctl vm.swappiness=10` | Set swappiness |
| `sudo sysctl -p` | Apply sysctl settings |

---

## Process & System Monitoring

| Command | Description |
| :--- | :--- |
| `htop` | Interactive process monitor |
| `top` | Classic process monitor |
| `ps aux` | List all processes |
| `ps aux \| grep <name>` | Find process by name |
| `kill <PID>` | Terminate a process |
| `kill -9 <PID>` | Force-kill a process |
| `pkill <name>` | Kill by process name |
| `uptime` | System uptime and load |
| `nproc` | Number of CPU cores |
| `du -sh <dir>` | Directory size |
| `journalctl -u <svc>` | View service logs |
| `journalctl -f` | Watch logs in real time |

---

## System Control

| Command | Description |
| :--- | :--- |
| `sudo reboot` | Reboot the server |
| `sudo shutdown -h now` | Shut down immediately |
| `sudo shutdown -r +5 "msg"` | Reboot in 5 minutes with message |
| `sudo shutdown -c` | Cancel scheduled shutdown |
| `hostname` | Show hostname |
| `sudo hostnamectl set-hostname <name>` | Change hostname |
| `uname -a` | Show kernel version |
| `lsb_release -a` | Show Ubuntu version |

---

## nano Editor Shortcuts

| Shortcut | Action |
| :--- | :--- |
| <kbd>Ctrl</kbd>+<kbd>O</kbd> | Save file |
| <kbd>Ctrl</kbd>+<kbd>X</kbd> | Exit |
| <kbd>Ctrl</kbd>+<kbd>W</kbd> | Search |
| <kbd>Ctrl</kbd>+<kbd>K</kbd> | Cut line |
| <kbd>Ctrl</kbd>+<kbd>U</kbd> | Paste |
| <kbd>Ctrl</kbd>+<kbd>G</kbd> | Help |

---

## Common Port Numbers

| Port | Protocol | Service |
| :--- | :--- | :--- |
| 22 | TCP | SSH |
| 80 | TCP | HTTP |
| 443 | TCP | HTTPS |
| 3389 | TCP | RDP |
| 21 | TCP | FTP |
| 25 | TCP | SMTP (email) |
| 3306 | TCP | MySQL |
| 5432 | TCP | PostgreSQL |

---

[Back to Course Home](README.md) | [Glossary →](GLOSSARY.md)
