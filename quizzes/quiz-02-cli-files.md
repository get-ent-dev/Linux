# Quiz 2 – CLI, Files & Networking

**Covers:** Modules 4–9  
**Questions:** 10  
**Format:** Multiple choice and short answer

---

> Try to answer from memory before checking the answer key at the bottom.

---

## Questions

**1.** What does the following command do?

```bash
sudo apt update && sudo apt upgrade -y
```

a) Installs new software and removes old packages  
b) Refreshes the package index then upgrades all installed packages, auto-confirming  
c) Updates the system and reboots automatically  
d) Upgrades the Ubuntu version to the latest release  

---

**2.** Which directory holds system-wide configuration files in Linux?

a) `/var`  
b) `/usr`  
c) `/etc`  
d) `/opt`  

---

**3.** What permission string does `chmod 755` produce?

a) `rwxrwxrwx`  
b) `rwxr-xr-x`  
c) `rw-r--r--`  
d) `r-xr-xr-x`  

---

**4.** What command shows the current network interfaces and their IP addresses?

a) `ifconfig -a`  
b) `netstat -i`  
c) `ip addr show`  
d) `net show ip`  

---

**5.** You want to allow HTTPS traffic through UFW. Which command is correct?

a) `sudo ufw open 443`  
b) `sudo ufw allow https`  
c) `sudo firewall-cmd --add-port=443/tcp`  
d) `sudo ufw permit 443/tcp`  

---

**6.** What does `tail -f /var/log/syslog` do?

a) Shows the first 10 lines of the log  
b) Searches the log for errors  
c) Watches the log file and prints new lines as they appear  
d) Archives the log file  

---

**7.** You generate an SSH key pair with `ssh-keygen -t ed25519`. Which file is the **private** key?

a) `~/.ssh/id_ed25519.pub`  
b) `~/.ssh/authorized_keys`  
c) `~/.ssh/id_ed25519`  
d) `~/.ssh/known_hosts`  

---

**8.** What does this command do?

```bash
sudo usermod -aG sudo alice
```

a) Creates a new user called `alice` with sudo access  
b) Adds `alice` to the `sudo` group without removing her from other groups  
c) Grants `alice` permanent root access  
d) Changes `alice`'s password  

---

**9.** Which command creates nested directories `a/b/c` in a single step?

a) `mkdir a b c`  
b) `mkdir -r a/b/c`  
c) `mkdir -p a/b/c`  
d) `makedir a/b/c`  

---

**10.** What is the purpose of the `/etc/fstab` file?

a) Stores user passwords  
b) Defines filesystem mount points and their options  
c) Lists installed packages  
d) Contains the system hostname  

---

## Answer Key

| Q | Answer | Explanation |
| :--- | :--- | :--- |
| 1 | **b** | `apt update` refreshes the package index; `apt upgrade -y` upgrades packages, the `-y` flag auto-confirms |
| 2 | **c** | `/etc` is the standard location for system-wide configuration files |
| 3 | **b** | 7=rwx (owner), 5=r-x (group), 5=r-x (others) → `rwxr-xr-x` |
| 4 | **c** | `ip addr show` is the modern replacement for `ifconfig` |
| 5 | **b** | `sudo ufw allow https` is the correct form; `sudo ufw allow 443` also works |
| 6 | **c** | `-f` (follow) streams new lines appended to the log in real time |
| 7 | **c** | `id_ed25519` is the private key; `id_ed25519.pub` is the public key |
| 8 | **b** | `-a` appends to the group list; `-G sudo` adds the sudo group |
| 9 | **c** | `-p` creates parent directories as needed |
| 10 | **b** | `/etc/fstab` defines what filesystems are mounted at boot, including swap entries |

---

**Score:** ___/10

- 9–10: Excellent — you have a strong command of Linux CLI fundamentals
- 7–8: Good — review any missed questions and their modules
- 5–6: Fair — revisit the relevant modules before proceeding to labs
- < 5: Re-read Modules 4–9 before continuing

---

[Back to Course Home](../README.md) | [← Quiz 1: Intro & Distros](quiz-01-intro.md)
