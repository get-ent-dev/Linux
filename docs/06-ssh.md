# Module 6 – Secure Shell (SSH)

[← Module 5: User Management](05-user-management.md) | [Back to Course Home](../README.md) | [Next Module: Basic CLI →](07-basic-cli.md)

---

## Learning Objectives

By the end of this module you will be able to:

- Explain what SSH is and why it is preferred over older protocols
- Connect to an Ubuntu Server using SSH from Windows, macOS, and Linux
- Generate an SSH key pair and configure key-based authentication
- Understand the SSH server configuration file
- Harden SSH by disabling password authentication

**Estimated time:** 45 minutes

---

## 6.1 What is SSH?

**SSH (Secure Shell)** is a cryptographic network protocol for secure communication between computers. It provides:

- **Encrypted channel** — all data (including passwords) is encrypted in transit
- **Authentication** — verifies the identity of both client and server
- **Remote command execution** — run commands on a remote machine
- **File transfer** — via `scp` and `sftp` built on top of SSH

SSH replaced older, insecure protocols like **Telnet** and **rsh** that transmitted everything in plain text.

> **Default port:** SSH listens on **port 22** by default.

---

## 6.2 How SSH Works

When you initiate an SSH connection:

1. Your **SSH client** contacts the server on port 22
2. The server sends its **public host key** (to prove its identity)
3. Your client checks this key against `~/.ssh/known_hosts`
4. A **session key** is negotiated using Diffie-Hellman key exchange
5. Authentication occurs (password or key-based)
6. An encrypted session begins

---

## 6.3 Connecting via SSH

### From Linux or macOS

Open a terminal and run:

```bash
ssh <username>@<server-ip-address>
```

**Example:**

```bash
ssh linuxuser@192.168.1.105
```

On first connection you see:

```
The authenticity of host '192.168.1.105 (192.168.1.105)' can't be established.
ED25519 key fingerprint is SHA256:...
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
```

Type `yes` and press <kbd>Enter</kbd>. The server's fingerprint is saved to `~/.ssh/known_hosts`.

Enter your password when prompted.

### From Windows using PuTTY

1. Download PuTTY from [putty.org](https://www.putty.org/)
2. Open PuTTY and enter:
   - **Host Name:** `192.168.1.105`
   - **Port:** `22`
   - **Connection type:** SSH
3. Click **Open**
4. Accept the host key fingerprint when prompted
5. Enter your username and password

![SSH PuTTY](https://github.com/user-attachments/assets/d88e1e98-a14a-4906-b50f-94964e11ce24)

### From Windows using PowerShell / Command Prompt

Modern Windows 10/11 includes OpenSSH. Open PowerShell and run:

```powershell
ssh linuxuser@192.168.1.105
```

---

## 6.4 SSH Key-Based Authentication

Password authentication is convenient but vulnerable to brute-force attacks. **SSH key authentication** is more secure:

- You generate a **key pair**: a private key (kept secret) and a public key (shared with the server)
- The server stores your public key in `~/.ssh/authorized_keys`
- When you connect, SSH proves you hold the private key without sending it

### Step 1 – Generate a Key Pair

Run this on your **local machine** (the one you SSH *from*):

```bash
ssh-keygen -t ed25519 -C "your-email@example.com"
```

| Option | Meaning |
| :--- | :--- |
| `-t ed25519` | Use the Ed25519 algorithm (modern and secure) |
| `-C "comment"` | Optional comment to identify the key |

When prompted:
- Press <kbd>Enter</kbd> to accept the default file location (`~/.ssh/id_ed25519`)
- Enter a **passphrase** (recommended for additional security) or press <kbd>Enter</kbd> for none

This creates two files:

| File | Description |
| :--- | :--- |
| `~/.ssh/id_ed25519` | **Private key** — never share this |
| `~/.ssh/id_ed25519.pub` | **Public key** — copy this to the server |

### Step 2 – Copy the Public Key to the Server

```bash
ssh-copy-id linuxuser@192.168.1.105
```

This appends your public key to `/home/linuxuser/.ssh/authorized_keys` on the server.

If `ssh-copy-id` is not available (e.g., on Windows), copy it manually:

```bash
# View your public key
cat ~/.ssh/id_ed25519.pub

# On the server, create the .ssh directory and paste the key
mkdir -p ~/.ssh
echo "paste-your-public-key-here" >> ~/.ssh/authorized_keys
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
```

### Step 3 – Test Key Authentication

```bash
ssh linuxuser@192.168.1.105
```

You should connect without a password prompt (or with just a passphrase if you set one).

---

## 6.5 SSH Server Configuration

The SSH server daemon (`sshd`) is configured at `/etc/ssh/sshd_config`.

```bash
sudo nano /etc/ssh/sshd_config
```

### Important Settings

| Setting | Default | Recommended |
| :--- | :--- | :--- |
| `Port` | `22` | Keep 22, or change to a non-standard port |
| `PermitRootLogin` | `prohibit-password` | `no` — disable root login entirely |
| `PasswordAuthentication` | `yes` | `no` — after key auth is set up |
| `PubkeyAuthentication` | `yes` | `yes` |
| `MaxAuthTries` | `6` | `3` — limit brute force |
| `LoginGraceTime` | `120` | `30` — reduce the connection window |

### Disable Password Authentication (After Setting Up Keys)

> **Warning:** Only do this after confirming key authentication works. Locking yourself out requires console access to recover.

1. Edit the config:

```bash
sudo nano /etc/ssh/sshd_config
```

2. Find and change:

```
PasswordAuthentication no
```

3. Restart SSH to apply:

```bash
sudo systemctl restart ssh
```

4. Test in a **new terminal window** (do not close your existing session) to confirm you can still connect.

---

## 6.6 Using sudo Over SSH

Once connected via SSH, use `sudo` to run administrative commands:

```bash
sudo apt update
sudo systemctl status nginx
sudo nano /etc/hostname
```

You will be prompted for your user's password (not root's). Sudo access requires your user to be in the `sudo` group (covered in Module 5).

---

## 6.7 Transferring Files with scp

`scp` (Secure Copy) transfers files over SSH.

### Copy a File from Local to Server

```bash
scp /path/to/local/file linuxuser@192.168.1.105:/home/linuxuser/
```

### Copy a File from Server to Local

```bash
scp linuxuser@192.168.1.105:/home/linuxuser/file.txt /local/destination/
```

### Copy a Directory Recursively

```bash
scp -r /local/directory linuxuser@192.168.1.105:/home/linuxuser/
```

---

## 6.8 Common SSH Issues

| Problem | Likely Cause | Solution |
| :--- | :--- | :--- |
| `Connection refused` | SSH not running or wrong port | `sudo systemctl start ssh` on the server |
| `Permission denied (publickey)` | Key not in `authorized_keys` | Re-run `ssh-copy-id` |
| `Host key verification failed` | Server key changed | Remove the old entry: `ssh-keygen -R <ip>` |
| `Connection timed out` | Firewall blocking port 22 | `sudo ufw allow ssh` on the server |
| Can't log in after changing `PasswordAuthentication no` | Lost key or wrong key | Recover via console access on VM |

---

## 6.9 Module Summary

- SSH provides an encrypted, authenticated remote terminal session
- Default port is 22; replace Telnet and rsh entirely
- Connect with `ssh username@server-ip` from any SSH client
- Key-based authentication is more secure than passwords — use Ed25519 keys
- `ssh-copy-id` automates copying your public key to the server
- Always test key login before disabling password authentication

---

## Knowledge Check

1. What protocol did SSH replace, and why was the old protocol insecure?
2. What does `ssh-keygen -t ed25519` create?
3. Where on the server is the public key stored?
4. What command do you use to copy a file to the server securely?
5. What should you verify before setting `PasswordAuthentication no`?

*(Answers: 1. Telnet / rsh — they transmitted data including passwords in plain text | 2. An Ed25519 key pair (private key + public key) | 3. `~/.ssh/authorized_keys` | 4. `scp` | 5. That key-based authentication works — open a new terminal and confirm you can log in with the key)*

---

[← Module 5: User Management](05-user-management.md) | [Back to Course Home](../README.md) | [Next Module: Basic CLI →](07-basic-cli.md)
