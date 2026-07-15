# Module 10 – Swap File & Server Performance

[← Module 9: Networking & Firewall](09-networking-firewall.md) | [Back to Course Home](../README.md) | [Next Module: Remote Desktop →](11-remote-desktop.md)

---

## Learning Objectives

By the end of this module you will be able to:

- Explain what swap space is and when to use it
- Check whether swap is currently enabled
- Create, enable, and make permanent a swap file
- Tune swappiness and cache pressure settings
- Check memory and swap usage

**Estimated time:** 30 minutes

---

## 10.1 What is Swap Space?

**Swap** is a portion of the hard drive (or SSD) reserved as overflow memory. When the system's physical RAM is full, the operating system moves less-used memory pages to swap, freeing RAM for active processes.

![Swap File Diagram](https://github.com/user-attachments/assets/33e5f07c-78e0-4420-93d4-92ddb3fc16fc)

### RAM vs Swap

| Property | RAM | Swap |
| :--- | :--- | :--- |
| Speed | Very fast (nanoseconds) | Much slower (milliseconds) |
| Volatile | Yes (lost on reboot) | No (persists on disk) |
| Purpose | Active working memory | Overflow / emergency memory |

### When is Swap Useful?

- **Low-RAM servers** (1–2 GB) — prevents out-of-memory (OOM) crashes
- **Memory spikes** — buffers sudden high-demand events
- **Hibernation** — desktop systems write RAM contents to swap before sleeping

### How Much Swap?

General guidelines:

| RAM Size | Recommended Swap |
| :--- | :--- |
| < 2 GB | Equal to RAM (1:1) |
| 2–8 GB | Half of RAM |
| > 8 GB | 4 GB is usually sufficient |

> Swap on SSD is fast enough to be practical; on spinning HDD it is noticeably slower.

---

## 10.2 Checking Current Swap Status

### Check for Active Swap

```bash
sudo swapon --show
```

If there is no output, swap is not currently configured.

### Check Memory and Swap Together

```bash
free -h
```

Example output with no swap:

```
              total        used        free      shared  buff/cache   available
Mem:           1.9G        512M        800M         12M        600M        1.3G
Swap:            0B          0B          0B
```

Example output with 4 GB swap active:

```
              total        used        free      shared  buff/cache   available
Mem:           1.9G        512M        800M         12M        600M        1.3G
Swap:          4.0G          0B        4.0G
```

---

## 10.3 Checking Available Disk Space

Ensure you have enough disk space before creating a swap file:

```bash
df -h
```

Look for the `/` (root) filesystem row. The **Avail** column shows free space.

---

## 10.4 Creating a Swap File — Step by Step

### Step 1 – Disable Any Existing Swap

If swap is already active, disable it before modifying:

```bash
sudo swapoff -a
```

### Step 2 – Create the Swap File

Use `fallocate` to allocate a 4 GB file instantly:

```bash
sudo fallocate -l 4G /swapfile
```

Verify the file was created correctly:

```bash
ls -lh /swapfile
```

Expected output:

```
-rw-r--r-- 1 root root 4.0G Jul 10 09:00 /swapfile
```

> If `fallocate` is not available, use `dd` instead:
> ```bash
> sudo dd if=/dev/zero of=/swapfile bs=1M count=4096
> ```

### Step 3 – Secure the Swap File

Only the root user should be able to read the swap file (it contains sensitive memory data):

```bash
sudo chmod 600 /swapfile
```

Verify:

```bash
ls -lh /swapfile
# -rw------- 1 root root 4.0G Jul 10 09:00 /swapfile
```

### Step 4 – Format as Swap

Mark the file as swap space:

```bash
sudo mkswap /swapfile
```

Expected output:

```
Setting up swapspace version 1, size = 4 GiB (4294963200 bytes)
no label, UUID=xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
```

### Step 5 – Activate the Swap File

```bash
sudo swapon /swapfile
```

Verify it is now active:

```bash
sudo swapon --show
```

Expected output:

```
NAME      TYPE  SIZE USED PRIO
/swapfile file    4G   0B   -2
```

Confirm with `free`:

```bash
free -h
```

---

## 10.5 Making Swap Permanent

The swap file is currently only active for this session. After a reboot it will not be active unless added to `/etc/fstab`.

### Back Up fstab First

```bash
sudo cp /etc/fstab /etc/fstab.bak
```

### Add Swap to fstab

```bash
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
```

Verify the entry was added:

```bash
tail -3 /etc/fstab
```

### Test the fstab Entry (Without Rebooting)

```bash
sudo swapoff -a        # Deactivate swap
sudo swapon -a         # Reactivate all swap listed in fstab
sudo swapon --show     # Confirm it is active
```

---

## 10.6 Tuning Swap Performance

### Swappiness

The **swappiness** kernel parameter (0–100) controls how aggressively the OS moves data from RAM to swap.

- **0** — avoid swap unless absolutely necessary
- **60** — default value (suitable for desktops)
- **10** — recommended for servers (prefer keeping data in RAM)
- **100** — swap aggressively

Check the current value:

```bash
cat /proc/sys/vm/swappiness
```

Change it for the current session:

```bash
sudo sysctl vm.swappiness=10
```

Make it permanent across reboots:

```bash
sudo nano /etc/sysctl.conf
```

Add or change this line at the bottom:

```
vm.swappiness=10
```

Save and close (<kbd>Ctrl</kbd>+<kbd>O</kbd>, <kbd>Enter</kbd>, <kbd>Ctrl</kbd>+<kbd>X</kbd>).

### Cache Pressure (vfs_cache_pressure)

This parameter controls how eagerly the kernel reclaims memory used for **directory and inode caches** — data about filesystem structure. Cached filesystem metadata is expensive to recreate, so a lower value means it stays in memory longer.

Check the current value:

```bash
cat /proc/sys/vm/vfs_cache_pressure
```

The default is 100. Setting it to 50 keeps filesystem cache in memory longer:

```bash
sudo sysctl vm.vfs_cache_pressure=50
```

Make it permanent:

```bash
sudo nano /etc/sysctl.conf
```

Add at the bottom:

```
vm.vfs_cache_pressure=50
```

Apply changes without rebooting:

```bash
sudo sysctl -p
```

---

## 10.7 Removing a Swap File

If you need to remove the swap file:

```bash
sudo swapoff /swapfile           # Deactivate
sudo rm /swapfile                # Delete the file
sudo nano /etc/fstab             # Remove the /swapfile entry
```

---

## 10.8 Module Summary

- Swap provides disk-backed overflow memory when RAM is full
- Create swap with `fallocate`, secure it with `chmod 600`, format with `mkswap`, activate with `swapon`
- Add `/swapfile none swap sw 0 0` to `/etc/fstab` for persistence across reboots
- Lower swappiness to 10 on servers to prefer keeping data in RAM
- Lower vfs_cache_pressure to 50 to cache filesystem metadata longer

---

## Knowledge Check

1. What command checks whether swap is currently active?
2. Why should the swap file permissions be set to `600`?
3. What file must be edited to make swap permanent across reboots?
4. What swappiness value is recommended for a server, and why?
5. What does `sudo sysctl -p` do?

*(Answers: 1. `sudo swapon --show` | 2. Swap may contain sensitive in-memory data; only root should access it | 3. `/etc/fstab` | 4. 10 — servers should keep active data in RAM rather than swapping it out; swapping causes latency | 5. Reloads the settings from `/etc/sysctl.conf` without rebooting)*

---

[← Module 9: Networking & Firewall](09-networking-firewall.md) | [Back to Course Home](../README.md) | [Next Module: Remote Desktop →](11-remote-desktop.md)
