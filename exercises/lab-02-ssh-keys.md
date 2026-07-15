# Lab 02 — Passwordless SSH with Keys

**Prerequisites:** [Secure Shell (SSH)](../README.md#secure-shell-ssh).
**Environment:** two machines, or one machine acting as both client and server (you can SSH to
`localhost`). Install a server with `sudo apt install -y openssh-server` if needed.

## Objectives

- Generate an SSH key pair.
- Log in to a server without a password.
- Understand which key goes where, and harden the server.

## Tasks

1. On the **client**, generate an `ed25519` key pair with a comment (your email).
2. Identify the two files that were created and state which one is secret.
3. Copy your **public** key to the server account you want to log in as.
4. Confirm you can now SSH in **without** being prompted for a password.
5. On the server, view the file that now contains your public key.
6. (Read-only exercise) Open `/etc/ssh/sshd_config` and find the settings that would disable root
   login and password authentication.

## Verify Your Work

- [ ] `ls ~/.ssh/` shows `id_ed25519` and `id_ed25519.pub`.
- [ ] `ssh <user>@<host>` logs in with no password prompt.
- [ ] The server's `~/.ssh/authorized_keys` contains a line ending with your email comment.

<details>
<summary><b>Hints / Solution</b></summary>

```bash
# 1  (press Enter to accept defaults; set a passphrase if you like)
ssh-keygen -t ed25519 -C "you@example.com"

# 2
ls -l ~/.ssh/
#   id_ed25519      -> PRIVATE key: keep secret, never copy off this machine
#   id_ed25519.pub  -> PUBLIC key: safe to share / install on servers

# 3
ssh-copy-id <user>@<host>          # <host> can be localhost for a single machine

# 4
ssh <user>@<host>

# 5  (on the server)
cat ~/.ssh/authorized_keys

# 6  (on the server) look for these lines:
sudo grep -E 'PermitRootLogin|PasswordAuthentication' /etc/ssh/sshd_config
#   To harden (only after key login works!):
#     PermitRootLogin no
#     PasswordAuthentication no
#   then: sudo systemctl restart ssh   (keep an existing session open to test!)
```

</details>
