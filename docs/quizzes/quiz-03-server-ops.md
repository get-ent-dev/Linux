# Quiz 03 — Server Operations

**Modules covered:** 04–05, 08, 10–11  
**Pass mark:** 8/11

## Questions

**1.** Default SSH port is:

- A) 80
- B) 443
- C) 22
- D) 3389

**2.** Before `sudo ufw enable` on a remote server you should:

- A) Delete all users
- B) Allow SSH (for example `ufw allow OpenSSH`)
- C) Disable the network interface
- D) Format `/home`

**3.** Correct command to install htop on Ubuntu:

- A) `sudo install htop`
- B) `sudo apt install htop`
- C) `sudo ufw install htop`
- D) `htop --apt`

**4.** Swap file permissions should typically be:

- A) `777`
- B) `644`
- C) `600`
- D) `755`

**5.** Which command shows active swap devices/files?

- A) `sudo swapon --show`
- B) `sudo ufw swap`
- C) `chmod swap`
- D) `nano /swap`

**6.** `sudo usermod -aG sudo jenny` does what?

- A) Deletes jenny
- B) Adds jenny to the sudo group without removing other groups
- C) Changes jenny’s shell to sudo
- D) Opens RDP

**7.** xRDP commonly listens on:

- A) 22
- B) 53
- C) 3389
- D) 8080

**8.** To make swap survive reboot you must:

- A) Only run `swapon` once
- B) Add an entry to `/etc/fstab` (and keep the file)
- C) Disable UFW
- D) Delete `/etc/sysctl.conf`

**9.** `ping -c 4 8.8.8.8` sends how many ICMP echo requests?

- A) Unlimited
- B) 4
- C) 8
- D) 88

**10.** `sudo ufw status numbered` helps you:

- A) Compile the kernel
- B) See rule numbers for deletion/editing
- C) Create users
- D) Resize disks

**11.** True or false: Chronic heavy swapping is a sign you may need more RAM or a lighter workload.

- A) True
- B) False

---

## Answer key

| # | Answer |
| --- | --- |
| 1 | C |
| 2 | B |
| 3 | B |
| 4 | C |
| 5 | A |
| 6 | B |
| 7 | C |
| 8 | B |
| 9 | B |
| 10 | B |
| 11 | A |
