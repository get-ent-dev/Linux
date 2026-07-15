# Lab 1 – Install Ubuntu Server 22.04 in VirtualBox

**Module:** [Module 3 – Ubuntu Server Setup](../docs/03-ubuntu-server-setup.md)  
**Duration:** ~45 minutes  
**Difficulty:** Beginner

---

## Objective

By the end of this lab you will have a fully installed and updated Ubuntu Server 22.04 LTS running in VirtualBox, ready for the remaining labs.

---

## Prerequisites

- VirtualBox installed (see Module 2)
- Ubuntu Server 22.04 LTS ISO downloaded from [ubuntu.com/download/server](https://ubuntu.com/download/server)
- At least 4 GB free RAM and 20 GB free disk on your host machine

---

## Lab Steps

### Part A – Create the Virtual Machine

- [ ] 1. Open VirtualBox and click **New**
- [ ] 2. Set **Name:** `ubuntu-server-lab`
- [ ] 3. Set **Type:** Linux, **Version:** Ubuntu (64-bit)
- [ ] 4. Allocate **2048 MB** RAM (4096 MB if available)
- [ ] 5. Create a virtual hard disk: **VDI**, **Dynamically allocated**, **20 GB**
- [ ] 6. Attach the Ubuntu Server ISO to the optical drive in Settings → Storage

### Part B – Run the Installer

- [ ] 7. Start the VM and wait for the installer to load
- [ ] 8. Select **English** as the installation language
- [ ] 9. Accept the default keyboard layout
- [ ] 10. Choose **Ubuntu Server** (not minimized)
- [ ] 11. Accept the auto-detected network settings
- [ ] 12. Leave the proxy field blank
- [ ] 13. Accept the default mirror server
- [ ] 14. Use the default storage layout (entire disk)
- [ ] 15. Confirm the storage changes
- [ ] 16. Create a user account:
    - Name: `Linux User`
    - Server name: `ubuntu-server`
    - Username: `linuxuser`
    - Password: (choose something memorable)
- [ ] 17. **Check the box** to install OpenSSH server
- [ ] 18. Skip the server snaps (leave all unchecked)
- [ ] 19. Wait for installation to complete, then click **Reboot Now**
- [ ] 20. Remove the ISO from the virtual drive when prompted

### Part C – First Login and Update

- [ ] 21. Log in at the console with your username and password
- [ ] 22. Run the initial update:
    ```bash
    sudo apt update && sudo apt upgrade -y
    ```
- [ ] 23. Find your server's IP address:
    ```bash
    ip addr show
    ```
- [ ] 24. Note the IP address for use in Lab 3 (SSH)

---

## Verification

Answer these questions to confirm you completed the lab:

1. What is your server's IP address? `____________`
2. What is the output of `hostname`? `____________`
3. What is the output of `lsb_release -a` (look for Description)? `____________`

---

## Troubleshooting

| Issue | Solution |
| :--- | :--- |
| VM won't boot from ISO | Check the optical drive in VM Settings → Storage |
| Network not detected | In VM Settings → Network, set Adapter 1 to Bridged |
| Installer freezes | Increase video memory to 16 MB in VM Settings → Display |
| Can't log in | The password is invisible when typing — try again slowly |

---

## Next Lab

Proceed to [Lab 2 – User Management](lab-02-user-management.md)
