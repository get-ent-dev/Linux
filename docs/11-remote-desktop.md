# Module 11 – Remote Desktop (xRDP)

[← Module 10: Swap & Performance](10-swap-performance.md) | [Back to Course Home](../README.md) | [Next Module: Applications & Monitoring →](12-applications-monitoring.md)

---

## Learning Objectives

By the end of this module you will be able to:

- Install the Xfce lightweight desktop environment on Ubuntu Server
- Install and start the xrdp service
- Configure xrdp and set the session manager
- Connect to the server graphically from Windows, macOS, or Linux
- Troubleshoot common xRDP connection issues

**Estimated time:** 45 minutes

---

## 11.1 What is xRDP?

**xRDP** is an open-source implementation of Microsoft's **Remote Desktop Protocol (RDP)** for Linux. It allows you to connect to a Linux server's graphical desktop using the standard Windows Remote Desktop client or any compatible RDP application.

![xRDP overview](https://github.com/user-attachments/assets/a2513308-2bda-43f1-841a-a03ccb677eeb)

### Why Use xRDP?

| Reason | Detail |
| :--- | :--- |
| Familiar interface | Uses the same RDP protocol as Windows Remote Desktop |
| Graphical administration | Run GUI applications on the server from anywhere |
| Low bandwidth | RDP compresses the display efficiently |
| Cross-platform | Clients available for Windows, macOS, Linux, iOS, Android |

> **xRDP uses port 3389 by default.** Ensure this port is open in UFW before connecting.

---

## 11.2 Step 1 – Update the Server

Always update before installing new software:

```bash
sudo apt update && sudo apt upgrade -y
```

---

## 11.3 Step 2 – Install the Xfce Desktop Environment

Ubuntu Server has no graphical interface by default. **Xfce** is a lightweight, fast desktop environment well suited for server use.

```bash
sudo apt install xfce4 xfce4-goodies -y
```

During installation you may be asked to choose a **display manager**. Select **lightdm** for a lightweight option or leave the default and press <kbd>Enter</kbd>.

Installation downloads approximately 200–400 MB and takes several minutes.

---

## 11.4 Step 3 – Install xRDP

```bash
sudo apt install xrdp -y
```

After installation, verify xrdp is running:

```bash
sudo systemctl status xrdp
```

Expected output includes:

```
● xrdp.service - xrdp daemon
     Loaded: loaded (/lib/systemd/system/xrdp.service; enabled; ...)
     Active: active (running) since ...
```

If xrdp is not running, start it:

```bash
sudo systemctl start xrdp
```

Enable it to start automatically at boot:

```bash
sudo systemctl enable xrdp
```

---

## 11.5 Step 4 – Configure the Session Manager

Create a `.xsession` file in your home directory to specify which desktop environment xrdp should launch:

```bash
echo "xfce4-session" | tee ~/.xsession
```

This tells xrdp to start an Xfce session when you connect. Without this file, the RDP connection will open a blank or broken session.

Restart xrdp to apply the configuration:

```bash
sudo systemctl restart xrdp
```

---

## 11.6 Step 5 – Open the Firewall for RDP

Allow RDP traffic through the UFW firewall:

```bash
sudo ufw allow 3389
```

Verify the rule was added:

```bash
sudo ufw status
```

---

## 11.7 Step 6 – Find the Server's IP Address

```bash
ip addr show
```

Note the `inet` address (e.g., `192.168.1.105`). You will use this in your RDP client.

---

## 11.8 Step 7 – Connect via RDP

### From Windows

1. Press <kbd>Win</kbd>+<kbd>R</kbd>, type `mstsc`, and press <kbd>Enter</kbd>
2. In the **Remote Desktop Connection** window, enter your server's IP address
3. Click **Show Options** if you want to pre-fill the username
4. Click **Connect**
5. Accept the certificate warning (click **Yes** or **Connect Anyway**)

![RDP Windows login](https://github.com/user-attachments/assets/57a487b7-4e61-411d-8522-d794749caf93)

6. In the xRDP login screen, enter your Ubuntu username and password
7. Click **OK**

![xRDP login screen](https://github.com/user-attachments/assets/9qRGWoV)

You should now see the Xfce desktop:

![Xfce Desktop](https://github.com/user-attachments/assets/LnkM9F0)

### From macOS

1. Install **Microsoft Remote Desktop** from the [Mac App Store](https://apps.apple.com/app/microsoft-remote-desktop/id1295203466)
2. Click **+** → **Add PC**
3. Enter the server's IP address as the **PC Name**
4. Click **Add**
5. Double-click the new PC entry and enter your credentials

### From Linux

Install `remmina`:

```bash
sudo apt install remmina remmina-plugin-rdp -y
```

Open Remmina, create a new connection:
- **Protocol:** RDP
- **Server:** `192.168.1.105`
- **Username:** your Ubuntu username
- **Password:** your Ubuntu password

---

## 11.9 Reviewing the xRDP Configuration

The xrdp configuration file is at `/etc/xrdp/xrdp.ini`:

```bash
sudo nano /etc/xrdp/xrdp.ini
```

Key configuration sections:

| Section | Purpose |
| :--- | :--- |
| `[Globals]` | Port, max sessions, log level |
| `[Logging]` | Log file location and verbosity |
| `[Channels]` | Clipboard, audio, drive redirection |
| `[Xorg]` | Session type (Xorg, used by default) |

Default port is `3389`. To change it, update the `port=` value under `[Globals]` and remember to update the firewall rule.

---

## 11.10 Troubleshooting

| Problem | Cause | Solution |
| :--- | :--- | :--- |
| Connection refused | xrdp not running | `sudo systemctl start xrdp` |
| Blank / black screen | No session manager set | Verify `~/.xsession` contains `xfce4-session` |
| "Authentication is required" popup | polkit agent issue | Install `xfce4-polkit` or dismiss the popup |
| Slow performance | High latency or low bandwidth | Lower colour depth in RDP client settings |
| Port 3389 blocked | UFW blocking | `sudo ufw allow 3389` |
| Certificate error | Self-signed cert (normal) | Accept / trust the certificate in the RDP client |

### Check xRDP Logs

```bash
sudo tail -50 /var/log/xrdp.log
sudo tail -50 /var/log/xrdp-sesman.log
```

---

## 11.11 Module Summary

- xrdp provides an RDP server for Linux, enabling graphical remote desktop access
- Install Xfce as the desktop environment before installing xrdp
- Create `~/.xsession` containing `xfce4-session` to set the session manager
- Open port 3389 in UFW before attempting to connect
- Connect from Windows with the built-in Remote Desktop Connection (`mstsc`), from macOS with Microsoft Remote Desktop, and from Linux with Remmina

---

## Knowledge Check

1. What port does xRDP use by default?
2. Why do you need to create the `~/.xsession` file?
3. What command verifies that xrdp is running?
4. How do you open the Windows Remote Desktop client?
5. Where are xRDP log files stored?

*(Answers: 1. Port 3389 | 2. It tells xrdp which desktop session to launch; without it, the session fails or shows a blank screen | 3. `sudo systemctl status xrdp` | 4. Press Win+R, type `mstsc`, press Enter | 5. `/var/log/xrdp.log` and `/var/log/xrdp-sesman.log`)*

---

[← Module 10: Swap & Performance](10-swap-performance.md) | [Back to Course Home](../README.md) | [Next Module: Applications & Monitoring →](12-applications-monitoring.md)
