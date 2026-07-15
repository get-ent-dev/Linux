# Module 2 – Environment Setup

[← Module 1: Introduction](01-introduction.md) | [Back to Course Home](../README.md) | [Next Module: Ubuntu Server Setup →](03-ubuntu-server-setup.md)

---

## Learning Objectives

By the end of this module you will be able to:

- Install and use a Linux distribution via Windows Subsystem for Linux (WSL)
- Install VirtualBox on Windows and create a virtual machine
- Describe when to install Linux from scratch vs using a VM or WSL
- Understand the general steps to install AlmaLinux / Rocky Linux / RHEL

**Estimated time:** 60 minutes

---

## 2.1 Options for Running Linux

There are several ways to run Linux depending on your goals:

| Method | Best For | Pros | Cons |
| :--- | :--- | :--- | :--- |
| **WSL** (Windows) | Development, learning CLI | Fast setup, integrates with Windows | Not a full server environment |
| **VirtualBox / VMware** | Server labs, full OS testing | Isolated, snapshots, full environment | Requires more RAM and disk |
| **Dual Boot** | Daily driver Linux use | Native hardware performance | Risk to existing OS |
| **Bare Metal Install** | Production servers, dedicated learning | Full performance | Overwrites the disk |
| **Cloud VM** (AWS, Azure) | Remote server administration | No local hardware needed | Costs money |

> **For this course** we use **VirtualBox with Ubuntu Server 22.04**, which gives you the full server experience in a safe, isolated environment.

---

## 2.2 Installing Linux with WSL on Windows

Windows Subsystem for Linux (WSL) lets you run a Linux environment directly inside Windows without a virtual machine.

### Prerequisites

- Windows 10 version 2004 or later, or Windows 11
- Administrator access

### Step 1 – Enable WSL

Open **PowerShell** as Administrator and run:

```powershell
wsl --install
```

This installs WSL 2 and Ubuntu by default. Restart when prompted.

### Step 2 – First Launch

After restarting, Ubuntu launches automatically. Create a username and password when prompted.

```
Enter new UNIX username: linuxuser
New password:
Retype new password:
```

> **Important:** The password you type is invisible — this is normal Linux security behaviour.

### Step 3 – Update Packages

Once inside the WSL terminal:

```bash
sudo apt update && sudo apt upgrade -y
```

### Step 4 – Install a Specific Distribution

To see available distributions:

```bash
wsl --list --online
```

To install a specific one (for example, Debian):

```bash
wsl --install -d Debian
```

### Step 5 – Access Linux Files from Windows

Your Linux home directory is accessible from Windows File Explorer at:

```
\\wsl$\Ubuntu\home\<your-username>
```

### Step 6 – Remove a WSL Distribution

```bash
wsl --unregister Ubuntu
```

> **Note:** This permanently deletes the distribution and all its data.

---

## 2.3 Installing VirtualBox on Windows

VirtualBox is a free, open-source hypervisor that lets you run full virtual machines on your computer.

### Step 1 – Download VirtualBox

1. Go to [virtualbox.org/wiki/Downloads](https://www.virtualbox.org/wiki/Downloads)
2. Click **Windows hosts** to download the installer
3. Also download the **VirtualBox Extension Pack** for USB 2.0/3.0 and RDP support

### Step 2 – Install VirtualBox

1. Run the downloaded `.exe` installer
2. Accept default options and click **Next** through each screen
3. When prompted about network interfaces, click **Yes** — this installs virtual network adapters
4. Click **Install** and wait for the process to finish
5. Click **Finish** to launch VirtualBox

### Step 3 – Install the Extension Pack

1. Open VirtualBox
2. Go to **File → Tools → Extension Pack Manager**
3. Click **Install** and select the `.vbox-extpack` file you downloaded

### Step 4 – Create a New Virtual Machine

You will create the Ubuntu Server VM in Module 3. The general steps are:

1. Click **New**
2. Set a name (e.g., `ubuntu-server-lab`)
3. Set **Type** to `Linux` and **Version** to `Ubuntu (64-bit)`
4. Allocate RAM (2048 MB minimum, 4096 MB recommended)
5. Create a virtual hard disk (20 GB minimum, 40 GB recommended)

---

## 2.4 When to Install Linux from Scratch

Installing Linux "from scratch" (manually, on bare metal or a clean VM) is important in these scenarios:

- **Production servers** — cloud providers provision bare VMs, not pre-installed setups
- **Custom configurations** — specific partition layouts (e.g., separate `/var`, `/home`)
- **Security requirements** — minimal install surface, full control over what is installed
- **Learning** — understanding the installer teaches how the system is structured
- **Hardware compatibility** — WSL and VMs may not expose all hardware features

For this course, learning from scratch using a VM gives you the best balance of safety and realism.

---

## 2.5 Installing AlmaLinux / Rocky Linux / RHEL

AlmaLinux and Rocky Linux are free, binary-compatible rebuilds of Red Hat Enterprise Linux (RHEL). They are popular in enterprise environments that need RHEL compatibility without the subscription cost.

### Download

- **AlmaLinux:** [almalinux.org](https://almalinux.org) → **Downloads** → AlmaLinux 9 → `AlmaLinux-9-x86_64-dvd.iso`
- **Rocky Linux:** [rockylinux.org](https://rockylinux.org) → **Get Rocky** → Rocky Linux 9 → DVD ISO

### General Installation Steps

1. **Boot** from the ISO in VirtualBox (set the ISO as the optical drive)
2. **Select language** on the welcome screen
3. **Installation Summary** — configure these items:
   - **Installation Destination** — select the virtual disk
   - **Network & Host Name** — enable the network interface
   - **Root Password** — set a strong root password
   - **User Creation** — create a regular user with administrator privileges
4. **Begin Installation** — the installer formats the disk and installs packages
5. **Reboot** when prompted and remove the ISO

### Key Differences from Ubuntu

| Feature | AlmaLinux / Rocky / RHEL | Ubuntu |
| :--- | :--- | :--- |
| Package manager | `dnf` | `apt` |
| Package format | `.rpm` | `.deb` |
| Firewall tool | `firewalld` | `ufw` |
| Service manager | `systemctl` (same) | `systemctl` (same) |
| Default shell | `bash` (same) | `bash` (same) |

> **The remainder of this course focuses on Ubuntu Server.** AlmaLinux concepts are similar but commands differ slightly.

---

## 2.6 Logging In to Linux

### Physical / VM Console Login

After installation, you will see a text-based login prompt:

```
ubuntu-server login: linuxuser
Password:
```

Type your username, press <kbd>Enter</kbd>, type your password (invisible), and press <kbd>Enter</kbd>.

### Graphical Login (Desktop Only)

If a desktop environment is installed, a graphical login manager (GDM, LightDM, or SDDM) displays a username and password screen.

> **Ubuntu Server has no desktop by default.** You interact entirely through the terminal. Module 11 covers adding a remote graphical session via xRDP.

---

## 2.7 Module Summary

- **WSL** is the fastest way to get Linux running on Windows for CLI practice
- **VirtualBox** gives you a full server environment for this course
- Install Linux from scratch when you need realism, custom configurations, or production-like conditions
- AlmaLinux and Rocky Linux are free RHEL alternatives — useful for enterprise environments
- Linux logins are text-based on servers; username and password are required

---

## Knowledge Check

1. What does WSL stand for?
2. Which command installs WSL with the default Ubuntu distribution?
3. How much RAM is recommended for a Ubuntu Server VM in this course?
4. Name two differences between AlmaLinux and Ubuntu in terms of tooling.
5. Why is the password invisible when typing it at a Linux login prompt?

*(Answers: 1. Windows Subsystem for Linux | 2. `wsl --install` | 3. 4096 MB (4 GB) | 4. AlmaLinux uses `dnf` and `firewalld`; Ubuntu uses `apt` and `ufw` | 5. It is a security feature — hiding the password prevents shoulder-surfing)*

---

[← Module 1: Introduction](01-introduction.md) | [Back to Course Home](../README.md) | [Next Module: Ubuntu Server Setup →](03-ubuntu-server-setup.md)
