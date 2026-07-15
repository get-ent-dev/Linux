# Lab 01 — First Shell

**Goal:** Prove your environment works and capture baseline system facts.  
**Time:** 20–30 minutes  
**Requires:** [Module 02](../modules/02-install-environments.md)

## Tasks

1. Open a Linux shell (WSL or VM).
2. Run and record the output of:

```bash
whoami
hostname
uname -a
pwd
ls /
cat /etc/os-release
```

3. Create a course folder and a notes file:

```bash
mkdir -p ~/linux-course
cd ~/linux-course
nano lab01-notes.txt
```

Write: your distro name, kernel version, and install path (WSL / VirtualBox / other).

4. List hidden files in your home directory:

```bash
ls -la ~
```

## Success checklist

- [ ] Shell prompt responds to commands
- [ ] `uname -a` shows a Linux kernel
- [ ] `~/linux-course/lab01-notes.txt` exists
- [ ] You know whether you are on WSL or a full VM

## Stretch

```bash
echo $SHELL
df -h
free -h
```
