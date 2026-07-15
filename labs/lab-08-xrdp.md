# Lab 8 – Remote Desktop with xRDP

**Module:** [Module 11 – Remote Desktop](../docs/11-remote-desktop.md)  
**Duration:** ~30 minutes  
**Difficulty:** Intermediate

---

## Objective

Install the Xfce desktop environment and xrdp on Ubuntu Server, then connect using an RDP client from your local machine.

---

## Prerequisites

- Ubuntu Server running and accessible via SSH
- UFW firewall active (Lab 6 completed)
- Port 3389 allowed in UFW (Lab 6 added this)
- At least 1 GB free disk space

---

## Lab Steps

### Part A – Install Xfce Desktop

Connect to the server via SSH, then run:

- [ ] 1. Update packages:
    ```bash
    sudo apt update
    ```

- [ ] 2. Install Xfce and extras:
    ```bash
    sudo apt install xfce4 xfce4-goodies -y
    ```
    This takes several minutes. If prompted for a display manager, select **lightdm**.

- [ ] 3. Verify the desktop files are present:
    ```bash
    dpkg -l | grep xfce4
    ```

### Part B – Install and Start xRDP

- [ ] 4. Install xrdp:
    ```bash
    sudo apt install xrdp -y
    ```

- [ ] 5. Verify xrdp is running:
    ```bash
    sudo systemctl status xrdp
    ```
    Expected: `active (running)`

- [ ] 6. If not running, start and enable it:
    ```bash
    sudo systemctl start xrdp
    sudo systemctl enable xrdp
    ```

### Part C – Configure the Session

- [ ] 7. Set Xfce as the xrdp session manager:
    ```bash
    echo "xfce4-session" | tee ~/.xsession
    ```

- [ ] 8. Verify the file:
    ```bash
    cat ~/.xsession
    ```
    Expected output: `xfce4-session`

- [ ] 9. Restart xrdp:
    ```bash
    sudo systemctl restart xrdp
    ```

### Part D – Verify the Firewall

- [ ] 10. Confirm port 3389 is open:
    ```bash
    sudo ufw status | grep 3389
    ```
    If not listed, add the rule:
    ```bash
    sudo ufw allow 3389
    ```

- [ ] 11. Confirm xrdp is listening on port 3389:
    ```bash
    ss -tlnp | grep 3389
    ```

### Part E – Connect via RDP

**From Windows:**

- [ ] 12. Press <kbd>Win</kbd>+<kbd>R</kbd>, type `mstsc`, press <kbd>Enter</kbd>
- [ ] 13. Enter your server's IP address in **Computer**
- [ ] 14. Click **Connect**
- [ ] 15. Accept the certificate warning
- [ ] 16. Log in with your Ubuntu username and password in the xRDP login screen
- [ ] 17. The Xfce desktop should appear

**From macOS:**

- [ ] 12. Install **Microsoft Remote Desktop** from the App Store
- [ ] 13. Add a new PC with your server's IP
- [ ] 14. Connect and log in

**From Linux:**

- [ ] 12. Install Remmina:
    ```bash
    sudo apt install remmina remmina-plugin-rdp -y
    ```
- [ ] 13. Open Remmina, create a new RDP connection with your server's IP
- [ ] 14. Connect and log in

### Part F – Explore the Desktop

- [ ] 18. Open the Xfce Terminal from the desktop or application menu
- [ ] 19. Run a command in the graphical terminal:
    ```bash
    htop
    ```
    Press `q` to quit htop.

- [ ] 20. Disconnect by closing the RDP window or logging out of the session

---

## Troubleshooting

| Issue | Solution |
| :--- | :--- |
| Black/blank screen after login | Verify `~/.xsession` contains `xfce4-session` and restart xrdp |
| Connection refused | Confirm `sudo systemctl status xrdp` is active |
| Port 3389 not reachable | Run `sudo ufw allow 3389` |
| Slow/laggy desktop | Reduce colour depth in RDP client settings (16-bit instead of 32-bit) |

---

## Verification

1. What service provides the RDP server on Linux?
2. What file tells xrdp which desktop to launch?
3. What port must be open in the firewall for RDP connections?
4. What command restarts the xrdp service?

---

## Congratulations!

You have completed all 8 labs. Review the [Command Cheat Sheet](../CHEATSHEET.md) and test your knowledge with the [quizzes](../quizzes/).
