<div align="center">
  <img src="https://github.com/user-attachments/assets/35210bee-7e01-44bc-bf31-0daa60c8b04b" alt="Linux Logo" width="150" />

  # Linux: Linux For Beginners

  ![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)
  ![Ubuntu](https://img.shields.io/badge/Ubuntu-E95420?style=for-the-badge&logo=ubuntu&logoColor=white)
  ![Bash](https://img.shields.io/badge/Bash-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white)
</div>

Welcome to the **Linux for Beginners** course guide. This repository contains the complete syllabus, command references, and step-by-step server configuration guides to get you up and running with Linux environments.

---

<details>
<summary><b>📖 Table of Contents</b> (Click to expand)</summary>

1.[Course Overview & Syllabus](#course-overview--syllabus)
2. [Ubuntu Server Setup](#ubuntu-server-setup)
3. [User Management](#user-management)
4. [Secure Shell (SSH)](#secure-shell-ssh)
5. [Basic & Advanced Command Line](#basic--advanced-command-line)
    - [Basic Operations](#basic-server-commands)
    - [Swap File & Server Performance](#swap-file-and-server-performance)
6. [File & Directory Operations](#file--directory-operations)
7.[Remote Desktop (xRDP)](#remote-desktop-xrdp)
8. [Ubuntu Server Networking & Firewall](#ubuntu-server-networking)
9. [Applications & Monitoring](#applications)
10. [References](#full-notes-about-servers)

</details>

---

## Course Overview & Syllabus

### Background, Introduction, and Preparation

**1. Course Overview (pptx 1)**

**2. Background and Introduction**
In this lesson you will learn:
*[What Linux is](https://www.youtube.com/watch?v=zA3vmx0GaO8)
* [Brief history of Linux](https://www.youtube.com/watch?v=rrB13utjYV4)
* [What a Linux Distribution or Linux Distro is](https://www.youtube.com/watch?v=VKNMI6cYOFk)
* [Reasons Linux is used](https://www.youtube.com/watch?v=mAFMJ1LnQu8)

> *Briefly introduces:* RHEL (RedHat Enterprise Linux), Fedora, CentOS, AlmaLinux, Rocky Linux, Ubuntu, Debian, OpenSUSE, and SLES (SUSE Linux Enterprise Server).

**3. Linux Distributions (pptx 2)**
Learn what a Linux Distro is, the most common distros, and how to choose the right one (RHEL, AlmaLinux, Rocky Linux, CentOS, Ubuntu, Mint, Debian, Pop!_OS, Arch Linux, etc.).

**4. Installing Linux using WSL on Windows**
Learn how to install, use, and remove a Linux distro using Windows Subsystem for Linux (WSL) and access Linux files via Windows File Explorer.

**5. Installing VirtualBox on Windows**
Learn how to install VirtualBox on Windows for running virtual machines.

**6. When to Install Linux from Scratch**
Understand why and when manual installation from scratch is necessary.

**7. Installing AlmaLinux / Rocky Linux / RHEL**
Manual install guide for AlmaLinux 9 and RHEL 9 (pptx 3).

**8. Logging In Directly to a Linux System**
Connecting to Linux via physical hardware or virtual machines (Graphical and text-based logins).

**9 & 10. The Linux Directory Structure**
Learn where OS components are located and how applications employ conventions for directory structures.

---

## Ubuntu Server Setup

![How-to-Install-Ubuntu-Server](https://github.com/user-attachments/assets/ad870ee3-e4ae-46fd-9d9d-63b55c377b47)

### Step-by-Step Installation

1. **Select Language**: Insert the installation media and restart. Select your preferred language (e.g., English).
   <br><img src="https://github.com/user-attachments/assets/e92e03ae-4470-4940-af40-91c5188a188a" width="600"/>
2. **Keyboard Layout**: Use <kbd>Tab</kbd> to switch items, <kbd>Enter</kbd> to open lists, and arrow keys to select.
   <br><img src="https://github.com/user-attachments/assets/1783f44a-838f-451d-9694-fa66ecffb88d" width="600"/>
3. **Server Configuration**: Select the general server configuration (top) or the minimal set (bottom).
   <br><img src="https://github.com/user-attachments/assets/452fd03e-766b-4df5-808a-1476721c3698" width="600"/>
4. **Network Connections**: Obtain automatically via DHCP or set manually.
   <br><img src="https://github.com/user-attachments/assets/c5916a6d-7be2-4f24-901d-9cf9f42bda54" width="600"/>
5. **Proxy Server**: Enter if necessary; otherwise, leave blank.
   <br><img src="https://github.com/user-attachments/assets/f8534141-772f-4a41-b234-eedfd99de0dd" width="600"/>
6. **Mirror Server**: Used for package updates. Usually auto-selects the best nearby mirror.
   <br><img src="https://github.com/user-attachments/assets/142f42d1-9459-4b42-ae8b-af65cea0aba1" width="600"/>
7. **Storage Settings**: Set disk partition layouts. Defaults are usually fine for beginners.
   <br><img src="https://github.com/user-attachments/assets/e4c9d898-802a-4765-a9f4-7f1708c68fd9" width="600"/>
8. **Confirm Storage**: Choose **Done** to confirm partitions.
   <br><img src="https://github.com/user-attachments/assets/e2e5ff49-ca54-46f1-838e-8ea036d0351c" width="600"/>
9. **Install Confirmation**: Click **Continue**. *Warning: Existing data will be overwritten.*
   <br><img src="https://github.com/user-attachments/assets/48cb7523-403c-43d1-9455-93c0726b9b4e" width="600"/>
10. **Administrator Account**: Enter a name, username, and password.
    <br><img src="https://github.com/user-attachments/assets/04cf4cae-1038-41c1-ac6e-dde3605ea5ac" width="600"/>
11. **SSH Setup**: Choose to install an SSH server if you plan to access the server remotely.
    <br><img src="https://github.com/user-attachments/assets/a5fe542d-0ae4-416a-a608-54a536451511" width="600"/>
12. **Server Snaps**: Select any extra software you need. Leave blank for a clean install.
    <br><img src="https://github.com/user-attachments/assets/0b5a3676-70f9-4db8-adc3-52a6ac533587" width="600"/>
13. **Complete**: When done, select **Reboot Now**.
    <br><img src="https://github.com/user-attachments/assets/38305255-2399-4c2a-a4fc-1fbada7059c0" width="600"/>
14. **Login**: After rebooting, authenticate with your new credentials.
    <br><img src="https://github.com/user-attachments/assets/3a8759e0-c7d8-4752-a905-a1113cc3c059" width="600"/>

---

## User Management

| Task | Command |
| :--- | :--- |
| **Add a new user** | `sudo adduser <username>` |
| **Check user groups** | `groups <username>` |
| **Grant Sudo privileges** | `sudo usermod -aG sudo <username>` |
| **Login as normal user (Remote)** | `ssh <username>@<ip_address>` |
| **Switch to Root user** | `sudo su -` |

### Changing Passwords

If you are logged in as the **Root** user:
```bash
passwd <username>
