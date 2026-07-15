# Module 3 – Ubuntu Server Setup

[← Module 2: Environment Setup](02-environment-setup.md) | [Back to Course Home](../README.md) | [Next Module: Linux Directory Structure →](04-linux-directory-structure.md)

---

## Learning Objectives

By the end of this module you will be able to:

- Create a VirtualBox VM configured for Ubuntu Server
- Complete a full Ubuntu Server 22.04 LTS installation
- Log in to the newly installed server
- Perform an initial system update

**Estimated time:** 45 minutes

---

## 3.1 Preparing the VirtualBox VM

Before running the installer, set up a virtual machine in VirtualBox.

### Download Ubuntu Server

1. Go to [ubuntu.com/download/server](https://ubuntu.com/download/server)
2. Download **Ubuntu Server 22.04 LTS** (the `.iso` file, approximately 1.4 GB)

### Create the Virtual Machine

1. Open **VirtualBox** and click **New**
2. Configure the basic settings:

| Setting | Value |
| :--- | :--- |
| Name | `ubuntu-server-lab` |
| Type | Linux |
| Version | Ubuntu (64-bit) |

3. Click **Next**

4. **Memory:** Allocate at least **2048 MB** (2 GB). 4096 MB is recommended.

5. **Hard Disk:** Select **Create a virtual hard disk now** → **VDI (VirtualBox Disk Image)** → **Dynamically allocated** → **20 GB** minimum (40 GB recommended)

6. Click **Create**

### Attach the ISO

1. Select your new VM and click **Settings**
2. Go to **Storage** → click the empty optical drive
3. Click the disk icon on the right → **Choose a disk file**
4. Select the Ubuntu Server `.iso` you downloaded
5. Click **OK**

### Configure Network

1. In VM Settings, go to **Network**
2. **Adapter 1:** Attached to **Bridged Adapter** (recommended — gives the VM its own IP on your network) or **NAT** (simpler, but harder to SSH into from the host)
3. Click **OK**

---

## 3.2 Step-by-Step Installation

Start the VM by clicking **Start**. The Ubuntu Server installer will boot from the ISO.

![Ubuntu Server Installation Banner](https://github.com/user-attachments/assets/ad870ee3-e4ae-46fd-9d9d-63b55c377b47)

### Step 1 – Select Language

The first screen asks for the installation language.

- Use arrow keys to highlight **English** (or your preferred language)
- Press <kbd>Enter</kbd> to confirm

<img src="https://github.com/user-attachments/assets/e92e03ae-4470-4940-af40-91c5188a188a" width="600" alt="Language selection"/>

---

### Step 2 – Keyboard Layout

Select your keyboard layout:

- Use <kbd>Tab</kbd> to move between fields
- Press <kbd>Enter</kbd> to open a dropdown list
- Use arrow keys to select your layout (e.g., **English (US)**)
- Navigate to **Done** and press <kbd>Enter</kbd>

<img src="https://github.com/user-attachments/assets/1783f44a-838f-451d-9694-fa66ecffb88d" width="600" alt="Keyboard layout"/>

---

### Step 3 – Server Configuration Type

Choose between:

- **Ubuntu Server** — general configuration with commonly used packages (recommended for this course)
- **Ubuntu Server (minimized)** — stripped-down install with a smaller footprint

Select **Ubuntu Server** and press <kbd>Enter</kbd>.

<img src="https://github.com/user-attachments/assets/452fd03e-766b-4df5-808a-1476721c3698" width="600" alt="Server type"/>

---

### Step 4 – Network Connections

The installer detects your network interface. If a DHCP server is present (typical for home/office networks), an IP address is assigned automatically.

- If you see an IP address assigned — you can proceed
- If not, configure a static IP manually using the interface editor

Press <kbd>Enter</kbd> on **Done**.

<img src="https://github.com/user-attachments/assets/c5916a6d-7be2-4f24-901d-9cf9f42bda54" width="600" alt="Network configuration"/>

---

### Step 5 – Proxy Server

If your network requires a proxy, enter the address here. For most home labs, leave this blank.

Press <kbd>Enter</kbd> on **Done**.

<img src="https://github.com/user-attachments/assets/f8534141-772f-4a41-b234-eedfd99de0dd" width="600" alt="Proxy configuration"/>

---

### Step 6 – Mirror Server

The mirror server is used for package downloads and updates. The installer automatically selects a nearby mirror.

- Leave the default unless you need to specify a regional mirror
- Press <kbd>Enter</kbd> on **Done**

<img src="https://github.com/user-attachments/assets/142f42d1-9459-4b42-ae8b-af65cea0aba1" width="600" alt="Mirror selection"/>

---

### Step 7 – Storage Configuration

Set the partition layout. For beginners, the default layout is fine:

- Select **Use an entire disk**
- Leave **Set up this disk as an LVM group** checked (optional but recommended)
- Press <kbd>Enter</kbd> on **Done**

<img src="https://github.com/user-attachments/assets/e4c9d898-802a-4765-a9f4-7f1708c68fd9" width="600" alt="Storage setup"/>

---

### Step 8 – Confirm Storage Layout

Review the partition summary. You will see entries for:

- A small EFI/boot partition
- A swap partition (optional)
- The main root (`/`) partition using the remaining space

Press <kbd>Enter</kbd> on **Done**.

<img src="https://github.com/user-attachments/assets/e2e5ff49-ca54-46f1-838e-8ea036d0351c" width="600" alt="Storage confirmation"/>

---

### Step 9 – Confirm Destructive Action

A warning appears: *"Continuing will result in loss of data on the disk."*

> **This only applies to the virtual disk you created — not your real machine.** It is safe to continue.

Select **Continue** and press <kbd>Enter</kbd>.

<img src="https://github.com/user-attachments/assets/48cb7523-403c-43d1-9455-93c0726b9b4e" width="600" alt="Installation confirmation"/>

---

### Step 10 – Create Administrator Account

Set up the first user account. This account will have `sudo` (administrator) privileges.

| Field | Example Value |
| :--- | :--- |
| Your name | Linux User |
| Server's name | ubuntu-server |
| Username | linuxuser |
| Password | (choose a strong password) |

Fill in the fields, navigate to **Done**, and press <kbd>Enter</kbd>.

<img src="https://github.com/user-attachments/assets/04cf4cae-1038-41c1-ac6e-dde3605ea5ac" width="600" alt="User creation"/>

---

### Step 11 – SSH Setup

**Recommended:** Enable the OpenSSH server so you can connect remotely.

- Highlight **Install OpenSSH server** and press <kbd>Space</kbd> to check it
- Press <kbd>Enter</kbd> on **Done**

<img src="https://github.com/user-attachments/assets/a5fe542d-0ae4-416a-a608-54a536451511" width="600" alt="SSH setup"/>

> If you skip this, you can install it later with `sudo apt install openssh-server`.

---

### Step 12 – Featured Server Snaps

A list of popular server applications (Nextcloud, Docker, Microk8s, etc.) is offered as optional installs.

- For a clean learning environment, leave all items unchecked
- Press <kbd>Enter</kbd> on **Done**

<img src="https://github.com/user-attachments/assets/0b5a3676-70f9-4db8-adc3-52a6ac533587" width="600" alt="Server snaps"/>

---

### Step 13 – Installation Progress

The installer now formats the disk, extracts packages, and configures the system. This takes 5–15 minutes depending on your hardware.

When complete, a **Reboot Now** option appears.

- Remove the ISO from the virtual optical drive:
  - In VirtualBox menu: **Devices → Optical Drives → Remove disk from virtual drive**
- Press <kbd>Enter</kbd> on **Reboot Now**

<img src="https://github.com/user-attachments/assets/38305255-2399-4c2a-a4fc-1fbada7059c0" width="600" alt="Installation complete"/>

---

### Step 14 – First Login

After rebooting, the server displays a text login prompt:

```
ubuntu-server login:
```

- Type your **username** and press <kbd>Enter</kbd>
- Type your **password** (invisible) and press <kbd>Enter</kbd>

You are now logged in and will see the bash prompt:

```bash
linuxuser@ubuntu-server:~$
```

<img src="https://github.com/user-attachments/assets/3a8759e0-c7d8-4752-a905-a1113cc3c059" width="600" alt="Login screen"/>

---

## 3.3 Initial System Update

Always update your server immediately after a fresh install to apply the latest security patches:

```bash
sudo apt update && sudo apt upgrade -y
```

- `sudo apt update` — refreshes the package index
- `sudo apt upgrade -y` — upgrades installed packages (`-y` auto-confirms)

You will be prompted for your password the first time you use `sudo`.

---

## 3.4 Find Your Server's IP Address

You will need the IP address to SSH in from another machine:

```bash
ip addr show
```

Look for a line starting with `inet` under your network interface (e.g., `ens3`, `eth0`). It will look similar to:

```
inet 192.168.1.105/24
```

The IP address in this example is `192.168.1.105`.

---

## 3.5 Module Summary

- Download the Ubuntu Server 22.04 LTS ISO before creating the VM
- Allocate at least 2 GB RAM and 20 GB disk to the virtual machine
- Enable the OpenSSH server during installation for remote access
- Run `sudo apt update && sudo apt upgrade -y` immediately after installation
- Use `ip addr show` to find the server's IP address

---

## Knowledge Check

1. What type of virtual hard disk format does VirtualBox use by default?
2. Why should you enable OpenSSH during installation?
3. What command updates both the package list and installs upgrades in one step?
4. How do you find the server's IP address from the command line?
5. What does the `-y` flag do in `sudo apt upgrade -y`?

*(Answers: 1. VDI (VirtualBox Disk Image) | 2. To allow SSH access from other machines | 3. `sudo apt update && sudo apt upgrade -y` | 4. `ip addr show` | 5. Automatically answers "yes" to all prompts)*

---

[← Module 2: Environment Setup](02-environment-setup.md) | [Back to Course Home](../README.md) | [Next Module: Linux Directory Structure →](04-linux-directory-structure.md)
