# Module 03 — Ubuntu Server Setup

**Time:** 60–90 minutes  
**Prerequisites:** [Module 02](02-install-environments.md) (VirtualBox or bare metal ready)  
**Images:** Screenshots below match a typical Ubuntu Server installer flow.

## Learning objectives

- Install Ubuntu Server from ISO
- Create the first administrator account
- Optionally enable OpenSSH during install
- Complete first login and verify the system

![How-to-Install-Ubuntu-Server](https://github.com/user-attachments/assets/ad870ee3-e4ae-46fd-9d9d-63b55c377b47)

## Before you start

- Ubuntu Server LTS ISO attached to the VM
- VM has ≥ 2 GB RAM and ≥ 20 GB disk
- Note whether you want **NAT** or **Bridged** networking for later SSH

## Step-by-step installation

### 1. Language

Insert the installation media and boot. Select your language (for example, English).

<img src="https://github.com/user-attachments/assets/e92e03ae-4470-4940-af40-91c5188a188a" width="600" alt="Language selection"/>

### 2. Keyboard layout

Use <kbd>Tab</kbd> to move, <kbd>Enter</kbd> to open lists, and arrow keys to select.

<img src="https://github.com/user-attachments/assets/1783f44a-838f-451d-9694-fa66ecffb88d" width="600" alt="Keyboard layout"/>

### 3. Server configuration type

Choose the general server configuration (more packages) or the minimal set.

<img src="https://github.com/user-attachments/assets/452fd03e-766b-4df5-808a-1476721c3698" width="600" alt="Server configuration"/>

### 4. Network

DHCP is fine for labs. For a fixed LAN IP, configure a static address.

<img src="https://github.com/user-attachments/assets/c5916a6d-7be2-4f24-901d-9cf9f42bda54" width="600" alt="Network connections"/>

### 5. Proxy

Leave blank unless your network requires a proxy.

<img src="https://github.com/user-attachments/assets/f8534141-772f-4a41-b234-eedfd99de0dd" width="600" alt="Proxy"/>

### 6. Mirror

Keep the default mirror unless you have a preferred regional mirror.

<img src="https://github.com/user-attachments/assets/142f42d1-9459-4b42-ae8b-af65cea0aba1" width="600" alt="Mirror"/>

### 7. Storage

Default guided partitioning is fine for beginners.

<img src="https://github.com/user-attachments/assets/e4c9d898-802a-4765-a9f4-7f1708c68fd9" width="600" alt="Storage"/>

### 8. Confirm storage

Select **Done** when the layout looks correct.

<img src="https://github.com/user-attachments/assets/e2e5ff49-ca54-46f1-838e-8ea036d0351c" width="600" alt="Confirm storage"/>

### 9. Destructive confirm

**Continue** only if you accept that the selected disk will be overwritten.

<img src="https://github.com/user-attachments/assets/48cb7523-403c-43d1-9455-93c0726b9b4e" width="600" alt="Install confirmation"/>

### 10. Administrator account

Enter your name, a username, and a strong password. Remember these credentials.

<img src="https://github.com/user-attachments/assets/04cf4cae-1038-41c1-ac6e-dde3605ea5ac" width="600" alt="Admin account"/>

### 11. SSH setup

For this course, **install the OpenSSH server** so you can practice Module 05.

<img src="https://github.com/user-attachments/assets/a5fe542d-0ae4-416a-a608-54a536451511" width="600" alt="SSH setup"/>

### 12. Featured snaps

Optional. Leave blank for a clean learning install.

<img src="https://github.com/user-attachments/assets/0b5a3676-70f9-4db8-adc3-52a6ac533587" width="600" alt="Snaps"/>

### 13. Finish and reboot

Select **Reboot Now**. Remove the ISO if the VM tries to boot the installer again.

<img src="https://github.com/user-attachments/assets/38305255-2399-4c2a-a4fc-1fbada7059c0" width="600" alt="Installation complete"/>

### 14. First login

Sign in with the account you created.

<img src="https://github.com/user-attachments/assets/3a8759e0-c7d8-4752-a905-a1113cc3c059" width="600" alt="Login"/>

## First commands after install

```bash
whoami
hostname
ip a
sudo apt update && sudo apt upgrade -y
```

Find your IP (look for `inet` under your main interface, often `enp0s3` in VirtualBox):

```bash
ip -4 addr show
```

## Try it

1. Log in successfully.
2. Update packages.
3. Record your IP address for SSH practice.

## Checkpoint

Ubuntu Server boots to a login prompt, your user can use `sudo`, and packages update cleanly.

## Next

[Module 04 — Users and Permissions](04-users-and-permissions.md)
