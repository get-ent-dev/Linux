# Lab 04 — Firewall and SSH

**Goal:** Keep SSH working while enabling UFW.  
**Time:** 30–45 minutes  
**Requires:** [Modules 05 & 10](../modules/10-networking-and-firewall.md)  
**Safety:** Prefer VirtualBox console access in case you lock SSH out.

## Tasks

1. Confirm SSH works **before** changing the firewall. From your client:

```bash
ssh <user>@<server-ip>
```

2. On the server, allow SSH, then enable UFW:

```bash
sudo ufw allow OpenSSH
sudo ufw enable
sudo ufw status verbose
```

3. From the client, SSH again — it must still work.

4. Add and verify an HTTP allow rule (even if no web server yet):

```bash
sudo ufw allow 80/tcp
sudo ufw status numbered
```

5. Delete the HTTP rule by number:

```bash
sudo ufw status numbered
sudo ufw delete <number>
```

6. Connectivity checks:

```bash
ping -c 4 1.1.1.1
ip -4 addr show
```

7. Write `~/linux-course/lab04-notes.txt` with: server IP, UFW status, allowed ports.

## Success checklist

- [ ] UFW status is `active`
- [ ] SSH still connects after `ufw enable`
- [ ] You practiced numbered delete safely
- [ ] Notes file lists open ports

## Recovery if locked out

Use the VM window/console, log in locally, then:

```bash
sudo ufw allow OpenSSH
sudo ufw reload
# or temporarily:
sudo ufw disable
```
