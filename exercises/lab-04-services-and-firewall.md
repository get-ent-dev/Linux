# Lab 04 — Web Server, Services & Firewall

**Prerequisites:** [Applications & Monitoring](../README.md#applications--monitoring) and
[Networking & Firewall](../README.md#ubuntu-server-networking--firewall).
**Environment:** an Ubuntu VM/WSL with `sudo` and internet access.

## Objectives

- Install software with `apt`.
- Manage a background service with `systemd`.
- Open a port with `ufw` and confirm the service is reachable.

## Tasks

1. Refresh the package index and install the **nginx** web server.
2. Confirm nginx is running and enabled to start at boot.
3. Verify the web server responds locally.
4. Find which port nginx is listening on.
5. Allow HTTP through the firewall, then enable the firewall — **making sure SSH stays allowed**.
6. Confirm the firewall rules include your new rule.
7. Stop the nginx service, confirm it is stopped, then start it again.
8. View the most recent nginx service logs.

## Verify Your Work

- [ ] `systemctl status nginx` shows `active (running)` and `enabled`.
- [ ] `curl http://localhost` returns the "Welcome to nginx!" HTML.
- [ ] `sudo ufw status` lists rules for both `OpenSSH` (or `22`) and `80/tcp` (or `Nginx HTTP`).

<details>
<summary><b>Hints / Solution</b></summary>

```bash
# 1
sudo apt update
sudo apt install -y nginx

# 2
sudo systemctl status nginx
sudo systemctl enable nginx      # ensure it starts at boot

# 3
curl http://localhost            # or: curl -I http://localhost

# 4
sudo ss -tulpn | grep nginx      # expect :80

# 5  (allow SSH FIRST so you don't lock yourself out)
sudo ufw allow OpenSSH
sudo ufw allow 80/tcp            # or: sudo ufw allow 'Nginx HTTP'
sudo ufw enable

# 6
sudo ufw status verbose

# 7
sudo systemctl stop nginx
sudo systemctl status nginx      # inactive (dead)
sudo systemctl start nginx

# 8
journalctl -u nginx --no-pager -n 20
```

**Cleanup (optional):**
```bash
sudo systemctl stop nginx
sudo apt purge -y nginx && sudo apt autoremove -y
sudo ufw delete allow 80/tcp
```

</details>
