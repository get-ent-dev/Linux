# Module 5 – User Management

[← Module 4: Linux Directory Structure](04-linux-directory-structure.md) | [Back to Course Home](../README.md) | [Next Module: SSH →](06-ssh.md)

---

## Learning Objectives

By the end of this module you will be able to:

- Create and delete user accounts
- Assign users to groups and grant sudo privileges
- Switch between users and elevate to root
- Change passwords for users and the root account
- Understand the `/etc/passwd` and `/etc/shadow` files

**Estimated time:** 30 minutes

---

## 5.1 Users and Groups in Linux

Linux is a **multi-user** operating system. Every file and process is owned by a user and a group. Access is controlled by **permissions** on those resources.

### Types of Users

| Type | UID Range | Description |
| :--- | :--- | :--- |
| **root** | 0 | Superuser; unrestricted access to everything |
| **System users** | 1–999 | Created by services (e.g., `www-data`, `sshd`) |
| **Regular users** | 1000+ | Human accounts created during setup or later |

Check your own user ID:

```bash
id
# uid=1000(linuxuser) gid=1000(linuxuser) groups=1000(linuxuser),4(adm),27(sudo)
```

---

## 5.2 Creating a User

### `adduser` (Recommended — Interactive)

```bash
sudo adduser <username>
```

**Example:**

```bash
sudo adduser alice
```

The command prompts you to:
1. Set and confirm a password
2. Optionally enter Full Name, Room Number, Work Phone, etc.
3. Confirm with `Y`

This automatically:
- Creates `/home/alice/`
- Copies default files from `/etc/skel/`
- Creates a matching group `alice`

### `useradd` (Low-level — Manual)

```bash
sudo useradd -m -s /bin/bash bob
sudo passwd bob
```

| Flag | Meaning |
| :--- | :--- |
| `-m` | Create home directory |
| `-s /bin/bash` | Set the default shell |

> **Prefer `adduser` on Ubuntu** for interactive, guided user creation.

---

## 5.3 Viewing Users

```bash
# List all users
cat /etc/passwd

# View just the username column
cut -d: -f1 /etc/passwd

# Show currently logged-in users
who
w
```

### Understanding `/etc/passwd`

Each line has the format:

```
username:x:UID:GID:comment:home_directory:shell
```

Example:

```
linuxuser:x:1000:1000:Linux User,,,:/home/linuxuser:/bin/bash
```

| Field | Value | Meaning |
| :--- | :--- | :--- |
| username | `linuxuser` | Login name |
| password | `x` | Password stored in `/etc/shadow` |
| UID | `1000` | User ID |
| GID | `1000` | Primary group ID |
| comment | `Linux User,,,` | Full name / GECOS |
| home | `/home/linuxuser` | Home directory |
| shell | `/bin/bash` | Default shell |

---

## 5.4 Groups

### Check a User's Groups

```bash
groups alice
# alice : alice sudo
```

### Add a User to a Group

```bash
sudo usermod -aG <groupname> <username>
```

| Flag | Meaning |
| :--- | :--- |
| `-a` | Append (do not remove from other groups) |
| `-G` | Supplementary groups |

**Example — grant sudo privileges:**

```bash
sudo usermod -aG sudo alice
```

> **Changes take effect at next login.** The user must log out and back in.

### Common Groups

| Group | Purpose |
| :--- | :--- |
| `sudo` | Members can run commands as root via `sudo` |
| `adm` | Access to system log files |
| `www-data` | Web server group (Apache/Nginx) |
| `docker` | Run Docker without sudo |

### List All Groups

```bash
cat /etc/group
```

---

## 5.5 Granting and Revoking sudo

`sudo` (**S**ubstitute **U**ser **Do**) lets a regular user run commands with root-level privileges.

### Grant sudo

```bash
sudo usermod -aG sudo alice
```

Verify:

```bash
groups alice
# alice : alice sudo
```

### Revoke sudo

```bash
sudo deluser alice sudo
```

### Test sudo Access

Log in as `alice` and run:

```bash
sudo apt update
```

If prompted for a password (alice's own password) and the command succeeds, sudo is working correctly.

---

## 5.6 Switching Users

### Switch to Another User

```bash
su - alice
```

The `-` loads alice's full environment (home directory, shell settings). Omitting it leaves you in the current directory.

### Switch to Root

```bash
sudo su -
```

This elevates you to the root shell. The prompt changes from `$` to `#`.

> **Use root access sparingly.** Prefer `sudo <command>` for individual tasks rather than staying as root.

### Return to Previous User

```bash
exit
```

---

## 5.7 Changing Passwords

### Change Your Own Password

```bash
passwd
```

You will be prompted for your current password, then the new one twice.

### Change Another User's Password (as root/sudo)

```bash
sudo passwd alice
```

No current password is required.

### Change the Root Password

```bash
sudo passwd root
```

> **Tip:** On Ubuntu, the root account has no password by default and is locked. Prefer using `sudo` rather than enabling a root password.

---

## 5.8 Deleting a User

### Remove the User but Keep Home Directory

```bash
sudo deluser alice
```

### Remove the User and Their Home Directory

```bash
sudo deluser --remove-home alice
```

> Always verify the username before deleting — this cannot be easily undone.

---

## 5.9 Locking and Unlocking Accounts

### Lock an Account (disable login)

```bash
sudo usermod -L alice
```

### Unlock an Account

```bash
sudo usermod -U alice
```

---

## 5.10 User Management Quick Reference

| Task | Command |
| :--- | :--- |
| Add a user | `sudo adduser <username>` |
| Delete a user (keep files) | `sudo deluser <username>` |
| Delete a user (remove files) | `sudo deluser --remove-home <username>` |
| Check user's groups | `groups <username>` |
| Grant sudo | `sudo usermod -aG sudo <username>` |
| Remove from sudo | `sudo deluser <username> sudo` |
| Switch user | `su - <username>` |
| Become root | `sudo su -` |
| Change your password | `passwd` |
| Change another's password | `sudo passwd <username>` |
| Lock account | `sudo usermod -L <username>` |
| Unlock account | `sudo usermod -U <username>` |
| View current user | `whoami` |
| View current user's ID and groups | `id` |

---

## 5.11 Module Summary

- Every file and process in Linux is owned by a user and a group
- `sudo adduser` is the recommended way to create users interactively on Ubuntu
- `sudo usermod -aG sudo <username>` grants a user administrator privileges
- Use `su - <username>` to switch users; `sudo su -` to become root
- `passwd` changes your own password; `sudo passwd <username>` changes another's

---

## Knowledge Check

1. What UID does the root user have?
2. What does the `-a` flag mean in `sudo usermod -aG sudo alice`?
3. Which file stores the hashed passwords on Linux?
4. What command shows you which groups your current user belongs to?
5. Why is it better to use `sudo <command>` than to remain logged in as root?

*(Answers: 1. UID 0 | 2. Append — it adds to the group list without removing alice from existing groups | 3. `/etc/shadow` | 4. `groups` or `id` | 5. Reduces risk of accidental destructive commands; creates an audit trail in `/var/log/auth.log`)*

---

[← Module 4: Linux Directory Structure](04-linux-directory-structure.md) | [Back to Course Home](../README.md) | [Next Module: SSH →](06-ssh.md)
