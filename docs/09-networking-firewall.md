# Module 9 – Networking & Firewall

[← Module 8: File & Directory Operations](08-file-operations.md) | [Back to Course Home](../README.md) | [Next Module: Swap & Performance →](10-swap-performance.md)

---

## Learning Objectives

By the end of this module you will be able to:

- Check and configure network interfaces
- Understand IP addressing and common port numbers
- Enable and manage the UFW firewall
- Allow and deny traffic by port, service, or IP address
- Test network connectivity with `ping` and `curl`

**Estimated time:** 45 minutes

---

## 9.1 Networking Basics

### IP Addresses

Every device on a network has an **IP address** — a unique identifier.

- **IPv4:** `192.168.1.105` — four numbers separated by dots (0–255 each)
- **IPv6:** `fe80::1` — longer address for future-proofing; less common in home/small business

**Private address ranges (not routable on the public internet):**

| Range | Common Use |
| :--- | :--- |
| `192.168.0.0/16` | Home and office networks |
| `10.0.0.0/8` | Corporate and cloud networks |
| `172.16.0.0/12` | Data centers |

### Ports

A **port** is a number (0–65535) that identifies a specific service on a host.

| Port | Protocol | Service |
| :--- | :--- | :--- |
| 22 | TCP | SSH |
| 80 | TCP | HTTP (web) |
| 443 | TCP | HTTPS (secure web) |
| 3389 | TCP | RDP (Remote Desktop) |
| 21 | TCP | FTP |
| 25 | TCP | SMTP (email) |
| 3306 | TCP | MySQL |
| 5432 | TCP | PostgreSQL |

---

## 9.2 Network Commands

### View Network Interfaces

```bash
ip addr show
```

Or the shorter form:

```bash
ip a
```

Look for the interface name (e.g., `ens3`, `eth0`, `enp0s3`) and the `inet` line showing the IP address:

```
2: ens3: <BROADCAST,MULTICAST,UP,LOWER_UP>
    inet 192.168.1.105/24 brd 192.168.1.255 scope global ens3
```

### View Routing Table

```bash
ip route show
```

The default gateway (your router) appears as:

```
default via 192.168.1.1 dev ens3
```

### Check DNS Configuration

```bash
cat /etc/resolv.conf
```

Or use `resolvectl` on modern Ubuntu:

```bash
resolvectl status
```

### Check Open Ports and Listening Services

```bash
ss -tlnp
```

| Flag | Meaning |
| :--- | :--- |
| `-t` | TCP sockets |
| `-l` | Listening sockets |
| `-n` | Show port numbers, not service names |
| `-p` | Show process using the socket |

### Test DNS Resolution

```bash
nslookup google.com
```

Or:

```bash
dig google.com
```

---

## 9.3 Testing Connectivity with ping

`ping` sends ICMP echo requests to test basic connectivity.

### Ping by IP Address

```bash
ping 192.168.1.1
```

### Ping by Hostname

```bash
ping google.com
```

### Limit the Number of Pings

```bash
ping -c 4 google.com
```

Press <kbd>Ctrl</kbd>+<kbd>C</kbd> to stop an infinite ping.

### Ping Output Explained

```
PING google.com (142.250.184.174) 56(84) bytes of data.
64 bytes from 142.250.184.174: icmp_seq=1 ttl=117 time=12.4 ms
64 bytes from 142.250.184.174: icmp_seq=2 ttl=117 time=11.8 ms
```

| Field | Meaning |
| :--- | :--- |
| `icmp_seq` | Sequence number |
| `ttl` | Time to live — decrements at each router hop |
| `time` | Round-trip latency in milliseconds |

---

## 9.4 UFW — Uncomplicated Firewall

**UFW (Uncomplicated Firewall)** is Ubuntu's user-friendly interface for managing firewall rules. It sits on top of `iptables`.

![Firewall diagram](https://github.com/user-attachments/assets/963acdb8-1ee0-4f04-a7f9-bb6fd976185e)

### Check Firewall Status

```bash
sudo ufw status
```

If inactive:

```
Status: inactive
```

If active:

```
Status: active

To                         Action      From
--                         ------      ----
22/tcp                     ALLOW IN    Anywhere
80/tcp                     ALLOW IN    Anywhere
```

### Enable and Disable UFW

> **Important:** Always allow SSH **before** enabling the firewall, or you will lock yourself out of the server.

```bash
sudo ufw allow ssh      # Allow SSH first!
sudo ufw enable         # Enable the firewall
```

Disable the firewall (for troubleshooting only):

```bash
sudo ufw disable
```

---

## 9.5 Allowing and Denying Traffic

### Allow by Service Name

UFW knows common service names:

```bash
sudo ufw allow ssh
sudo ufw allow http
sudo ufw allow https
```

### Allow by Port Number

```bash
sudo ufw allow 22        # SSH
sudo ufw allow 80        # HTTP
sudo ufw allow 443       # HTTPS
sudo ufw allow 3389      # RDP
```

### Allow a Port Range

```bash
sudo ufw allow 8000:8080/tcp
```

### Deny by Port

```bash
sudo ufw deny 23         # Block Telnet
sudo ufw deny 21         # Block FTP
```

### Allow or Deny by IP Address

```bash
sudo ufw allow from 192.168.1.50            # Allow all traffic from this IP
sudo ufw deny from 203.0.113.99             # Block all traffic from this IP
```

### Allow from an IP to a Specific Port

```bash
sudo ufw allow from 192.168.1.50 to any port 22
```

### Allow from a Subnet

```bash
sudo ufw allow from 192.168.1.0/24         # Allow entire LAN
```

---

## 9.6 Managing Firewall Rules

### View Rules with Numbers

```bash
sudo ufw status numbered
```

Output:

```
     To                         Action      From
     --                         ------      ----
[ 1] 22/tcp                     ALLOW IN    Anywhere
[ 2] 80/tcp                     ALLOW IN    Anywhere
[ 3] 443/tcp                    ALLOW IN    Anywhere
```

### Delete a Rule by Number

```bash
sudo ufw delete 2
```

This removes rule number 2 (HTTP in the example above). Re-run `sudo ufw status numbered` first to confirm the number.

### Delete a Rule by Specification

```bash
sudo ufw delete allow 80
```

### Reset All Rules

```bash
sudo ufw reset
```

> This disables UFW and removes all rules. Use with caution.

---

## 9.7 UFW Default Policies

UFW has default policies for incoming and outgoing traffic:

```bash
sudo ufw default deny incoming   # Block all incoming by default
sudo ufw default allow outgoing  # Allow all outgoing by default
```

This is the recommended starting configuration: deny everything in, allow everything out, then explicitly open only the ports you need.

---

## 9.8 UFW Logging

Enable logging to track firewall activity:

```bash
sudo ufw logging on
```

Logs appear in `/var/log/ufw.log`.

---

## 9.9 Testing Web Connectivity with curl

```bash
curl http://example.com       # Fetch web page
curl -I https://google.com    # Fetch headers only
curl -v https://google.com    # Verbose output (shows TLS handshake)
```

---

## 9.10 Networking Quick Reference

| Task | Command |
| :--- | :--- |
| View IP addresses | `ip addr show` |
| View routing table | `ip route show` |
| Test connectivity | `ping -c 4 <host>` |
| Check firewall status | `sudo ufw status` |
| Enable firewall | `sudo ufw enable` |
| Allow SSH | `sudo ufw allow ssh` |
| Allow HTTP | `sudo ufw allow 80` |
| Allow HTTPS | `sudo ufw allow 443` |
| Allow RDP | `sudo ufw allow 3389` |
| Block an IP | `sudo ufw deny from <ip>` |
| View numbered rules | `sudo ufw status numbered` |
| Delete rule by number | `sudo ufw delete <number>` |
| View listening ports | `ss -tlnp` |
| View UFW manual | `man ufw` |

---

## 9.11 Module Summary

- Linux uses `ip addr show` (not `ifconfig`) for modern network interface management
- Port numbers identify services; SSH=22, HTTP=80, HTTPS=443, RDP=3389
- UFW is Ubuntu's user-friendly firewall; always allow SSH before enabling it
- Default policy: deny all incoming, allow all outgoing; then open only required ports
- `ping` tests ICMP reachability; `curl` tests HTTP/HTTPS connectivity; `ss -tlnp` shows open ports

---

## Knowledge Check

1. What command checks the UFW firewall status?
2. What is the correct command to allow HTTPS traffic through UFW?
3. Why must you allow SSH before enabling the firewall?
4. What port does RDP use by default?
5. How do you delete firewall rule number 3?

*(Answers: 1. `sudo ufw status` | 2. `sudo ufw allow 443` or `sudo ufw allow https` | 3. If you don't, enabling the firewall will block your existing SSH connection and lock you out | 4. Port 3389 | 5. `sudo ufw delete 3` )*

---

[← Module 8: File & Directory Operations](08-file-operations.md) | [Back to Course Home](../README.md) | [Next Module: Swap & Performance →](10-swap-performance.md)
