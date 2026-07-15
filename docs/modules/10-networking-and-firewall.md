# Module 10 — Networking and Firewall (UFW)

**Time:** 60 minutes  
**Prerequisites:** Ubuntu Server; SSH access you can recover (VM console)  
**Lab:** [Lab 04 — Firewall and SSH](../labs/lab-04-firewall-and-ssh.md)

## Learning objectives

- Inspect addresses and test connectivity with `ip` and `ping`
- Enable **UFW** without locking yourself out
- Allow/deny services by name, port, and source IP
- List and delete numbered rules

![Firewall concept](https://github.com/user-attachments/assets/963acdb8-1ee0-4f04-a7f9-bb6fd976185e)

## Networking basics

```bash
ip a                    # addresses
ip route                # default route
hostname -I             # quick IP list
ping -c 4 8.8.8.8       # ICMP to a public DNS IP
ping -c 4 ubuntu.com    # by hostname (DNS + ICMP)
```

Stop a continuous ping with <kbd>Ctrl+C</kbd>.

![Networking diagram](https://github.com/user-attachments/assets/6a11c014-d90d-4e4e-9c1b-dd71da8ff922)

## UFW overview

**UFW (Uncomplicated Firewall)** is a friendly frontend to iptables/nftables on Ubuntu.

### Status / enable / disable

```bash
sudo ufw status
sudo ufw status verbose
sudo ufw enable
sudo ufw disable
```

### Golden rule for remote servers

**Allow SSH before enabling UFW.**

```bash
sudo ufw allow OpenSSH
# or:
sudo ufw allow 22/tcp
sudo ufw enable
sudo ufw status
```

If you skip this on a remote-only host, you can cut off your own access. Use the VirtualBox/local console to recover.

## Common allow rules

```bash
sudo ufw allow ssh          # port 22
sudo ufw allow 22/tcp
sudo ufw allow http         # port 80
sudo ufw allow 80/tcp
sudo ufw allow https        # port 443
sudo ufw allow 443/tcp
sudo ufw allow 3389/tcp     # RDP / xrdp
```

## Allow / deny by source IP

```bash
sudo ufw allow from 192.168.1.100
sudo ufw deny from 203.0.113.50
sudo ufw allow from 192.168.1.100 to any port 22
```

## Numbered rules (edit/delete)

```bash
sudo ufw status numbered
sudo ufw delete 3           # deletes rule number 3 — double-check first!
```

## Manual pages

```bash
man ufw
```

## Try it (safe pattern)

From the **VM console** (not only SSH):

```bash
sudo ufw allow OpenSSH
sudo ufw enable
sudo ufw status verbose
ping -c 3 1.1.1.1
```

Then confirm SSH from your host still works.

## Checkpoint

UFW is active, SSH still works, and you can read numbered rules.

## Next

- [Lab 04](../labs/lab-04-firewall-and-ssh.md)
- [Module 11 — Applications and Monitoring](11-apps-and-monitoring.md)
