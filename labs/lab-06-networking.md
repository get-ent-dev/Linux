# Lab 6 – Networking & Firewall Rules

**Module:** [Module 9 – Networking & Firewall](../docs/09-networking-firewall.md)  
**Duration:** ~30 minutes  
**Difficulty:** Beginner–Intermediate

---

## Objective

Enable the UFW firewall, configure rules to allow SSH and HTTP, deny a test port, and verify connectivity using `ping` and `ss`.

---

## Prerequisites

- Ubuntu Server running and accessible via SSH
- `linuxuser` with sudo privileges

---

## Lab Steps

### Part A – Check Current Network State

- [ ] 1. View all network interfaces and IP addresses:
    ```bash
    ip addr show
    ```
    Note your server's IP (the `inet` line under your main interface).

- [ ] 2. View the routing table:
    ```bash
    ip route show
    ```
    Identify the default gateway.

- [ ] 3. Check what ports are currently listening:
    ```bash
    ss -tlnp
    ```
    SSH (port 22) should appear as listening.

### Part B – Test Connectivity

- [ ] 4. Ping the default gateway (substitute your gateway IP):
    ```bash
    ping -c 4 192.168.1.1
    ```

- [ ] 5. Ping a public host:
    ```bash
    ping -c 4 8.8.8.8
    ```

- [ ] 6. Test DNS resolution:
    ```bash
    ping -c 4 google.com
    ```

- [ ] 7. Fetch a web page with curl:
    ```bash
    curl -I https://google.com
    ```
    You should see HTTP response headers (200 OK or 301 redirect).

### Part C – Configure UFW

> **Critical:** Allow SSH before enabling the firewall.

- [ ] 8. Check current firewall status:
    ```bash
    sudo ufw status
    ```
    Expected: `Status: inactive`

- [ ] 9. Allow SSH (do this FIRST):
    ```bash
    sudo ufw allow ssh
    ```

- [ ] 10. Set default policies:
    ```bash
    sudo ufw default deny incoming
    sudo ufw default allow outgoing
    ```

- [ ] 11. Enable the firewall:
    ```bash
    sudo ufw enable
    ```
    Type `y` and press <kbd>Enter</kbd> to confirm.

- [ ] 12. Verify the firewall is active and SSH is allowed:
    ```bash
    sudo ufw status
    ```
    Confirm your SSH session is still working.

### Part D – Add and Manage Rules

- [ ] 13. Allow HTTP:
    ```bash
    sudo ufw allow 80
    ```

- [ ] 14. Allow HTTPS:
    ```bash
    sudo ufw allow 443
    ```

- [ ] 15. Allow RDP (for Lab 8):
    ```bash
    sudo ufw allow 3389
    ```

- [ ] 16. View numbered rules:
    ```bash
    sudo ufw status numbered
    ```

- [ ] 17. Install a simple web server to test HTTP:
    ```bash
    sudo apt install nginx -y
    sudo systemctl start nginx
    sudo systemctl status nginx
    ```

- [ ] 18. Test HTTP access from your local machine:
    Open a browser and go to `http://<your-server-ip>`.  
    You should see the default Nginx welcome page.

- [ ] 19. Block port 8080 (test deny rule):
    ```bash
    sudo ufw deny 8080
    ```

- [ ] 20. View numbered rules again and find the 8080 deny rule:
    ```bash
    sudo ufw status numbered
    ```

- [ ] 21. Delete the 8080 deny rule (find its number first):
    ```bash
    sudo ufw delete <number-of-8080-rule>
    ```

### Part E – Review and Log

- [ ] 22. Enable UFW logging:
    ```bash
    sudo ufw logging on
    ```

- [ ] 23. Check the UFW log (may be empty if no blocked traffic yet):
    ```bash
    sudo tail -20 /var/log/ufw.log
    ```

- [ ] 24. View your final firewall rules:
    ```bash
    sudo ufw status verbose
    ```

---

## Verification

1. What command shows the numbered list of UFW rules?
2. What default incoming policy did you set?
3. Why must SSH be allowed before enabling the firewall?
4. What port does nginx (HTTP) listen on?

---

## Next Lab

Proceed to [Lab 7 – Swap File](lab-07-swap.md)
