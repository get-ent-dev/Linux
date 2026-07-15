# Module 02 — Install Environments

**Time:** 60–90 minutes  
**Prerequisites:** [Module 01](01-linux-fundamentals.md)  
**Lab:** [Lab 01 — First shell](../labs/lab-01-first-shell.md)

## Learning objectives

- Install Linux via **WSL** on Windows *or* create a **VirtualBox** VM
- Know when a from-scratch install is worth doing
- Log in to a graphical or text console
- Reach a working shell prompt for the rest of the course

## Option A — WSL on Windows

Windows Subsystem for Linux (WSL) runs a real Linux userspace on Windows. Ideal for command-line practice.

### Install

1. Open **PowerShell as Administrator**.
2. Run:

```powershell
wsl --install
```

3. Reboot if prompted.
4. After reboot, Ubuntu (default) finishes setup — create a **UNIX username and password**.
5. Launch **Ubuntu** from the Start menu.

### Useful WSL commands (from PowerShell)

```powershell
wsl --list --verbose
wsl --shutdown
wsl --unregister Ubuntu
```

### Access Linux files from Windows Explorer

In File Explorer address bar:

```text
\\wsl$\Ubuntu\home\<your-username>
```

Or from inside WSL:

```bash
explorer.exe .
```

### Remove a distro

```powershell
wsl --unregister Ubuntu
```

> WSL is excellent for Modules 01, 04 (partial), 06, 07, and 11. For full server labs (UFW from outside, xRDP, VirtualBox networking), use Option B or Module 03.

## Option B — VirtualBox

VirtualBox lets you run a full virtual machine (recommended for the Ubuntu Server track).

### Install VirtualBox on Windows

1. Download VirtualBox from the [official VirtualBox site](https://www.virtualbox.org/).
2. Run the installer; accept default networking components (Host-Only / Bridged).
3. Optionally install the **VirtualBox Extension Pack** matching your version.

### Create a VM (overview)

1. Download an ISO:
   - [Ubuntu Server LTS](https://ubuntu.com/download/server) (course default), or
   - [Ubuntu Desktop](https://ubuntu.com/download/desktop)
2. In VirtualBox: **New** → name it → Type: Linux → Version: Ubuntu (64-bit).
3. Memory: at least **2048 MB** (4096 MB better).
4. Create a virtual disk: **20 GB+**, dynamically allocated.
5. Settings → Storage → attach the ISO to the optical drive.
6. Settings → Network → **NAT** (simple) or **Bridged** (LAN IP for SSH from host).
7. Start the VM and follow the installer.

Detailed Ubuntu Server click-through: [Module 03](03-ubuntu-server-setup.md).

## Option C — When to install from scratch

Install manually (ISO on bare metal or VM) when you need to:

- Learn partitioning, bootloader, and first-boot services
- Match a production server build
- Use RHEL-family systems (AlmaLinux / Rocky / RHEL)

### AlmaLinux / Rocky / RHEL (summary)

1. Download the Minimal or DVD ISO for AlmaLinux 9 / Rocky 9 / RHEL 9.
2. Boot the installer → language → installation destination (disk).
3. Set root password; create an admin user.
4. Enable network; finish install → reboot → remove ISO.
5. Package manager will be `dnf` (not `apt`). This course’s later modules assume Ubuntu/`apt`; translate as needed.

## Logging in

| Method | Where |
| --- | --- |
| Local text console | VM window after Ubuntu Server install |
| Local GUI | Desktop distro or xRDP session |
| SSH | `ssh user@ip` from another machine/terminal |
| WSL | Windows Start → Ubuntu |

After login you should see a prompt similar to:

```text
alex@ubuntu-lab:~$
```

## Try it

1. Get any Linux shell running (WSL or VM).
2. Run:

```bash
whoami
uname -a
pwd
ls /
```

3. Write down your username and the output of `uname -a`.

## Checkpoint

You have a working Linux prompt and know which install path you are on.

## Next

- Do [Lab 01 — First shell](../labs/lab-01-first-shell.md)
- Server track: [Module 03 — Ubuntu Server Setup](03-ubuntu-server-setup.md)
- WSL-only track: skip to [Module 04](04-users-and-permissions.md) (some sudo/SSH labs work differently on WSL)
