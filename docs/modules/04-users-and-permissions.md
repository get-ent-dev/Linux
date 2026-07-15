# Module 04 — Users and Permissions

**Time:** 45 minutes  
**Prerequisites:** Working Ubuntu (Server, Desktop, or WSL)  
**Lab:** [Lab 02 — Users and sudo](../labs/lab-02-users-and-sudo.md)

## Learning objectives

- Create and inspect user accounts
- Add a user to the `sudo` group
- Change passwords safely as root or as a normal user
- Switch users and understand `sudo` vs `su`

## Quick reference

| Task | Command |
| --- | --- |
| Add a new user (Debian/Ubuntu, interactive) | `sudo adduser <username>` |
| Add a new user (lower-level) | `sudo useradd -m -s /bin/bash <username>` |
| Set / change a password | `sudo passwd <username>` |
| List a user’s groups | `groups <username>` |
| Grant sudo (Ubuntu) | `sudo usermod -aG sudo <username>` |
| Switch to root shell | `sudo -i` or `sudo su -` |
| Run one command as root | `sudo <command>` |
| Switch to another user | `sudo su - <username>` |
| SSH as a user | `ssh <username>@<ip_address>` |

## Create a user

```bash
sudo adduser student
```

`adduser` on Ubuntu prompts for password and optional GECOS fields (full name, etc.) and creates a home directory under `/home/student`.

Verify:

```bash
id student
ls -ld /home/student
```

## Grant sudo privileges

```bash
groups student
sudo usermod -aG sudo student
```

The user may need to **log out and back in** (or start a new SSH session) before the new group applies.

Test:

```bash
su - student
sudo whoami    # should print: root
```

## Changing passwords

### As root (or via sudo)

```bash
sudo passwd student
```

### Change your own password

```bash
passwd
```

### Important clarifications

| Situation | Command |
| --- | --- |
| Root changing any user’s password | `passwd <username>` |
| Normal user changing own password | `passwd` |
| Normal user changing another user’s password | `sudo passwd <username>` |

> Older notes sometimes showed `sudo passwd` for “normal user.” That changes **root’s** password if your sudoers setup allows it — usually not what you want for day-to-day self-service. Prefer plain `passwd` for yourself.

## Understanding sudo

`sudo` lets permitted users run commands with elevated privileges (usually as root).

```bash
sudo apt update
sudo cat /etc/shadow    # privileged file
```

Related tools:

| Command | Meaning |
| --- | --- |
| `sudo -i` | Interactive root login shell |
| `sudo su -` | Similar: root shell with root’s environment |
| `su -` | Switch user (to root if no name); needs root password unless configured otherwise |
| `sudo -u postgres psql` | Run a command as a different user |

## Permissions preview

Every file has an owner, a group, and mode bits (read/write/execute for user/group/other):

```bash
ls -l
```

Example:

```text
-rw-r--r-- 1 alex alex 120 Jul 15 10:00 notes.txt
```

You will practice ownership and modes in [Module 07](07-files-and-directories.md).

## Try it

```bash
sudo adduser labuser
sudo usermod -aG sudo labuser
groups labuser
sudo passwd labuser
```

Then open a second session as `labuser` and run `sudo whoami`.

## Checkpoint

You can create a user, grant sudo, and change passwords without locking yourself out.

## Next

- [Lab 02](../labs/lab-02-users-and-sudo.md)
- [Module 05 — SSH and Remote Access](05-ssh-and-remote-access.md)
