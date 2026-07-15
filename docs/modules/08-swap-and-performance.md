# Module 08 — Swap File and Server Performance

**Time:** 45 minutes  
**Prerequisites:** Ubuntu Server with sudo  
**Images:** Swap concepts diagram below

## Learning objectives

- Explain what swap is and when it helps
- Check for existing swap
- Create, secure, enable, and persist a swap file
- Tune `swappiness` and `vfs_cache_pressure` for servers

![create-swap-file-linux](https://github.com/user-attachments/assets/33e5f07c-78e0-4420-93d4-92ddb3fc16fc)

## What is swap?

Swap is disk space used when RAM is full. It is **slower than RAM**, but can prevent out-of-memory failures. Prefer adding RAM for heavy workloads; use swap as a safety net.

**Sizing rule of thumb (labs):** about 1× RAM, often capped around 4G unless you have a special need (hibernate, etc.).

## Step 1 — Check current swap

```bash
sudo swapon --show
free -h
```

No output from `swapon --show` usually means no swap is active.

## Step 2 — Check free disk

```bash
df -h
```

Ensure enough free space on `/` for the swap file you plan to create.

## Step 3 — Create a swap file

If some swap is already active and you are replacing it:

```bash
sudo swapoff -a
```

Create a 4G example file (adjust size to your VM):

```bash
sudo fallocate -l 4G /swapfile
ls -lh /swapfile
```

If `fallocate` fails on some filesystems, use:

```bash
sudo dd if=/dev/zero of=/swapfile bs=1M count=4096 status=progress
```

## Step 4 — Secure and enable

```bash
sudo chmod 600 /swapfile
ls -lh /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
sudo swapon --show
free -h
```

Only root should read the swap file (`600`).

## Step 5 — Make it permanent

```bash
sudo cp /etc/fstab /etc/fstab.bak
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
```

Verify the line once:

```bash
tail -n 5 /etc/fstab
```

## Step 6 — Tune swappiness

`swappiness` (0–100) controls how aggressively the kernel swaps.

```bash
cat /proc/sys/vm/swappiness
```

Desktops often use ~60. Many servers prefer lower values (for example **10**):

```bash
sudo sysctl vm.swappiness=10
```

Persist:

```bash
echo 'vm.swappiness=10' | sudo tee -a /etc/sysctl.conf
```

Or edit with `sudo nano /etc/sysctl.conf` and add `vm.swappiness=10`.

## Step 7 — Tune cache pressure

```bash
cat /proc/sys/vm/vfs_cache_pressure
sudo sysctl vm.vfs_cache_pressure=50
echo 'vm.vfs_cache_pressure=50' | sudo tee -a /etc/sysctl.conf
```

Lower values keep inode/dentry cache longer (often helpful).

## Conclusion

Swap helps avoid some OOM situations, but chronic swapping means you need more RAM or lighter workloads.

## Try it

Complete steps 1–5 on your lab VM, then confirm swap survives a reboot:

```bash
sudo reboot
# after login
free -h
sudo swapon --show
```

## Checkpoint

`swapon --show` lists `/swapfile` after reboot, and permissions are `600`.

## Next

[Module 09 — xRDP Remote Desktop](09-xrdp-remote-desktop.md) (optional GUI track)  
or jump to [Module 10 — Networking and Firewall](10-networking-and-firewall.md)
