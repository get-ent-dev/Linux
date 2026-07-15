# Module 09 — Remote Desktop (xRDP)

**Time:** 45–60 minutes  
**Prerequisites:** Ubuntu Server you can reach over the network; SSH working  
**Optional module** — skip if you only need CLI admin

## Learning objectives

- Install a lightweight desktop (Xfce) on Ubuntu Server
- Install and configure **xrdp**
- Connect from Windows Remote Desktop (or another RDP client)
- Open firewall port **3389** only when needed

![Ubuntu-XRDP-Thumbnail](https://github.com/user-attachments/assets/a2513308-2bda-43f1-841a-a03ccb677eeb)

## Background

**RDP** is Microsoft’s Remote Desktop Protocol. **xrdp** is an open-source RDP server for Linux, so Windows (and other) RDP clients can show a Linux desktop.

## Step 1 — Install a desktop environment

```bash
sudo apt update
sudo apt install xfce4 xfce4-goodies -y
```

If prompted for a display manager, **gdm3** is fine for this lab.

## Step 2 — Install xrdp

```bash
sudo apt install xrdp -y
sudo systemctl enable --now xrdp
sudo systemctl status xrdp
```

If it is not running:

```bash
sudo systemctl start xrdp
```

## Step 3 — Configure the session

Default config lives in `/etc/xrdp/xrdp.ini`. For a first connection, defaults are enough.

Tell xrdp to start Xfce for your user:

```bash
cd ~
echo "xfce4-session" | tee ~/.xsession
sudo systemctl restart xrdp
```

Allow RDP through UFW (after you understand Module 10 — or do this now if UFW is already enabled):

```bash
sudo ufw allow 3389/tcp
sudo ufw status
```

## Step 4 — Test from Windows

1. Open **Remote Desktop Connection** (`mstsc`).
2. Computer: your server IP (and user under Show Options if needed).
3. Connect → accept the certificate warning if prompted.
4. Log in with your Linux username and password.
5. You should see the Xfce desktop.

![RDP connect](https://github.com/user-attachments/assets/57a487b7-4e61-411d-8522-d794749caf93)

![Identity verification](https://github.com/user-attachments/assets/aa1c2673-2d5b-4db0-ae7a-38166ed25327)

![Credentials](https://github.com/user-attachments/assets/64920bfd-316a-42db-b120-15a9016919de)

![Xfce desktop](https://github.com/user-attachments/assets/8516b373-b0e2-4325-8be2-26cc792d5029)

### macOS / Linux clients

Use Microsoft Remote Desktop (macOS), Remmina, FreeRDP, or another RDP client pointed at `server-ip:3389`.

## Troubleshooting

| Issue | What to try |
| --- | --- |
| Black screen / instant disconnect | Ensure `~/.xsession` contains `xfce4-session`; restart xrdp |
| Cannot connect | Check `systemctl status xrdp`, port 3389, UFW, NAT forwarding |
| Works on LAN only | Expected unless you intentionally expose the host (do not expose labs to the public internet) |

## Security note

RDP access is powerful. For labs, keep it on a private network. Prefer SSH for daily admin; use xRDP when you need a GUI.

## Try it

Connect once, open a terminal inside the remote desktop, run `uname -a`, then disconnect.

## Checkpoint

You can reach an Xfce session over RDP from your client machine.

## Next

[Module 10 — Networking and Firewall](10-networking-and-firewall.md)
