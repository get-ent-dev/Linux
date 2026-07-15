# Module 05 — Secure Shell (SSH)

**Time:** 45 minutes  
**Prerequisites:** Ubuntu Server with OpenSSH (or another machine with `sshd`)  
**Related lab:** [Lab 04](../labs/lab-04-firewall-and-ssh.md) (after firewall module)

## Learning objectives

- Explain what SSH is and why it replaced telnet/rlogin for remote admin
- Connect with `ssh user@host` from Linux, macOS, WSL, or PuTTY on Windows
- Know the default port and basic connection troubleshooting
- Prefer key-based auth when you are ready to harden access

![secure-shell-protocol](https://github.com/user-attachments/assets/982742e4-efc4-4dee-9817-775b653f898f)

## What is SSH?

**SSH (Secure Shell)** provides encrypted remote login and command execution. It also supports secure file transfer (`scp`, `sftp`).

> Default port: **22/tcp**

It is the standard way to administer Linux servers over a network.

## Connect from a terminal

```bash
ssh <username>@<ip_address>
```

Example:

```bash
ssh alex@192.168.1.50
```

On first connect, confirm the host fingerprint (`yes`). Then enter the user’s password.

![SSH login illustration](https://github.com/user-attachments/assets/d88e1e98-a14a-4906-b50f-94964e11ce24)

### Windows options

- **PowerShell / Windows Terminal** — OpenSSH client is built into modern Windows
- **PuTTY** — classic GUI SSH client
- **WSL** — use the Linux `ssh` client inside your distro

### VirtualBox networking tip

| Mode | How you SSH |
| --- | --- |
| **Bridged** | Use the guest’s LAN IP (`ip a`) |
| **NAT** | Add a port forward: host `2222` → guest `22`, then `ssh -p 2222 user@127.0.0.1` |

## Install / verify SSH server (if needed)

```bash
sudo apt update
sudo apt install openssh-server -y
sudo systemctl enable --now ssh
sudo systemctl status ssh
```

On some Ubuntu versions the service unit is `ssh`; on others you may see `sshd`. Use tab-completion if unsure.

## Essential SSH client options

```bash
ssh -p 2222 alex@127.0.0.1          # custom port
ssh -v alex@192.168.1.50            # verbose (debug)
scp ./file.txt alex@host:~/file.txt # copy file to remote
```

## Optional hardening (beginner-safe)

After password login works, consider:

1. **Create an SSH key** on your client:

```bash
ssh-keygen -t ed25519 -C "laptop-lab"
ssh-copy-id alex@192.168.1.50
```

2. Later (advanced): disable password auth in `/etc/ssh/sshd_config` only after key login is proven.

Never disable password auth until key-based login works in a second session.

## Troubleshooting

| Symptom | Check |
| --- | --- |
| Connection refused | `sshd` running? correct IP/port? |
| Timed out | firewall, wrong network mode, host unreachable |
| Permission denied | username/password; account exists; `AllowUsers` not blocking you |
| Works then UFW locks you out | allow SSH before `ufw enable` (Module 10) |

## Try it

1. From your host (or another VM), SSH into the server.
2. Run `hostname` and `whoami` remotely.
3. Disconnect with `exit`.

## Checkpoint

You can open a remote shell over SSH and know the default port.

## Next

[Module 06 — Command Line Basics](06-command-line-basics.md)
