# Lab 05 — Capstone Checklist

**Goal:** Prove end-to-end beginner server skills.  
**Time:** 90–120 minutes  
**Guide:** [Module 12](../modules/12-capstone.md)

Work through each box. Do not skip the reboot test.

## A. Base system

- [ ] Ubuntu Server installed (or equivalent lab VM)
- [ ] Hostname set (example):

```bash
sudo hostnamectl set-hostname linux-lab
```

- [ ] Packages updated:

```bash
sudo apt update && sudo apt upgrade -y
```

## B. Users

- [ ] Admin user with sudo (may be the installer account)
- [ ] Extra user `trainer` **without** sudo
- [ ] Verified with `groups` / `sudo whoami`

## C. Remote access

- [ ] `openssh-server` installed and running
- [ ] SSH login from another terminal/host succeeds

## D. Swap

- [ ] `/swapfile` exists with mode `600`
- [ ] Listed in `swapon --show`
- [ ] Line present in `/etc/fstab`

## E. Firewall

- [ ] `sudo ufw allow OpenSSH` (or `22/tcp`) applied **before** enable
- [ ] UFW active
- [ ] SSH still works

## F. Monitoring & docs

- [ ] `htop` installed
- [ ] Created `~/SERVER_NOTES.md` containing:
  - hostname
  - IP address(es)
  - usernames
  - open UFW ports
  - swap size
  - date completed

Example starter:

```bash
nano ~/SERVER_NOTES.md
```

## G. Reboot exam (required)

```bash
sudo reboot
```

After reboot, verify:

- [ ] SSH works
- [ ] `sudo swapon --show` still lists swap
- [ ] `sudo ufw status` is active
- [ ] `htop` still runs

## H. Optional bonus

- [ ] xRDP + Xfce session works on private network
- [ ] SSH key login for admin user
- [ ] UFW allows SSH only from your client IP

## Done

When every required box is checked, you have finished the **Linux for Beginners** learning module. Review any weak quiz areas and keep this VM for practice.
