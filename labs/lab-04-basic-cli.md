# Lab 4 – CLI Essentials

**Module:** [Module 7 – Basic Command Line](../docs/07-basic-cli.md)  
**Duration:** ~30 minutes  
**Difficulty:** Beginner

---

## Objective

Practice essential command-line operations: package management, system information, service management, and reading logs.

---

## Prerequisites

- Ubuntu Server running and accessible via SSH
- `linuxuser` account with sudo privileges

---

## Lab Steps

### Part A – Package Management

- [ ] 1. Update the package index:
    ```bash
    sudo apt update
    ```
    Note how many packages can be upgraded.

- [ ] 2. Upgrade all installed packages:
    ```bash
    sudo apt upgrade -y
    ```

- [ ] 3. Install `tree` (a directory visualiser):
    ```bash
    sudo apt install tree -y
    ```

- [ ] 4. Verify installation:
    ```bash
    tree --version
    ```

- [ ] 5. Search for the `curl` package:
    ```bash
    apt search curl | head -20
    ```

- [ ] 6. Install `curl` and `wget`:
    ```bash
    sudo apt install curl wget -y
    ```

- [ ] 7. Remove `wget` (we won't need it):
    ```bash
    sudo apt remove wget -y
    sudo apt autoremove -y
    ```

### Part B – System Information

- [ ] 8. Check the Ubuntu version:
    ```bash
    lsb_release -a
    ```

- [ ] 9. Check the kernel version:
    ```bash
    uname -a
    ```

- [ ] 10. Check CPU information:
    ```bash
    lscpu | grep -E "^CPU\(s\)|^Model name|^Thread"
    ```

- [ ] 11. Check memory usage:
    ```bash
    free -h
    ```

- [ ] 12. Check disk usage:
    ```bash
    df -h
    ```

- [ ] 13. Check system uptime:
    ```bash
    uptime
    ```

### Part C – Service Management

- [ ] 14. Check the SSH service status:
    ```bash
    sudo systemctl status ssh
    ```
    Confirm it says `active (running)`.

- [ ] 15. List all running services:
    ```bash
    systemctl list-units --type=service --state=running
    ```

- [ ] 16. Restart the SSH service:
    ```bash
    sudo systemctl restart ssh
    ```

- [ ] 17. Check the status again to confirm it restarted:
    ```bash
    sudo systemctl status ssh
    ```
    Look for `active (running)` and the new start time.

### Part D – Logs and History

- [ ] 18. View the last 20 lines of the system log:
    ```bash
    sudo tail -20 /var/log/syslog
    ```

- [ ] 19. View SSH authentication logs:
    ```bash
    sudo tail -30 /var/log/auth.log
    ```
    You should see your SSH login attempts.

- [ ] 20. Search for your own sudo usage in auth.log:
    ```bash
    sudo grep "$(whoami)" /var/log/auth.log | tail -10
    ```

- [ ] 21. View your command history:
    ```bash
    history
    ```

- [ ] 22. Use the systemd journal for SSH logs:
    ```bash
    journalctl -u ssh --since today
    ```

---

## Verification

1. What version of Ubuntu is installed? (from `lsb_release -a`)
2. How much available memory does your server have? (from `free -h`)
3. How long has your server been running? (from `uptime`)
4. Where are SSH authentication events logged?

---

## Next Lab

Proceed to [Lab 5 – File Operations](lab-05-file-operations.md)
