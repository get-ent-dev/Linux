# Lab 3 – SSH & Key-Based Authentication

**Module:** [Module 6 – Secure Shell](../docs/06-ssh.md)  
**Duration:** ~30 minutes  
**Difficulty:** Beginner–Intermediate

---

## Objective

Connect to the Ubuntu Server via SSH from your local machine, generate an SSH key pair, configure key-based authentication, and optionally disable password login.

---

## Prerequisites

- Lab 1 completed (Ubuntu Server running with OpenSSH installed)
- Know the server's IP address (from Lab 1, Part C, step 23)
- SSH client on your local machine (Windows: PowerShell or PuTTY; macOS/Linux: Terminal)

---

## Lab Steps

### Part A – First SSH Connection

- [ ] 1. On your **local machine**, open a terminal (or PowerShell on Windows)

- [ ] 2. SSH into the server:
    ```bash
    ssh linuxuser@<your-server-ip>
    ```

- [ ] 3. When prompted about the host fingerprint, type `yes` and press <kbd>Enter</kbd>

- [ ] 4. Enter your password when prompted

- [ ] 5. Verify you are connected:
    ```bash
    hostname
    whoami
    ```

- [ ] 6. Disconnect:
    ```bash
    exit
    ```

### Part B – Generate an SSH Key Pair

Run these commands on your **local machine**:

- [ ] 7. Generate an Ed25519 key pair:
    ```bash
    ssh-keygen -t ed25519 -C "linux-course-key"
    ```
    Press <kbd>Enter</kbd> to accept the default file location.  
    Enter a passphrase (recommended) or leave blank.

- [ ] 8. Verify the key files were created:
    ```bash
    ls -la ~/.ssh/
    ```
    You should see `id_ed25519` (private) and `id_ed25519.pub` (public).

- [ ] 9. View your public key:
    ```bash
    cat ~/.ssh/id_ed25519.pub
    ```
    It should start with `ssh-ed25519`.

### Part C – Copy the Public Key to the Server

- [ ] 10. Copy the public key to the server:
    ```bash
    ssh-copy-id linuxuser@<your-server-ip>
    ```
    Enter your password when prompted.

    > **Windows alternative:** If `ssh-copy-id` is not available, manually copy the public key:
    > 1. Copy the output of `cat ~/.ssh/id_ed25519.pub`
    > 2. SSH into the server with a password
    > 3. Run: `mkdir -p ~/.ssh && echo "<paste-key-here>" >> ~/.ssh/authorized_keys && chmod 700 ~/.ssh && chmod 600 ~/.ssh/authorized_keys`

- [ ] 11. Test key-based login (should not ask for a password):
    ```bash
    ssh linuxuser@<your-server-ip>
    ```
    If you set a passphrase, you will be asked for that instead.

### Part D – Transfer a File with scp

- [ ] 12. Create a test file on your local machine:
    ```bash
    echo "Hello from local machine" > test-transfer.txt
    ```

- [ ] 13. Copy it to the server:
    ```bash
    scp test-transfer.txt linuxuser@<your-server-ip>:~/
    ```

- [ ] 14. SSH in and verify the file arrived:
    ```bash
    ssh linuxuser@<your-server-ip>
    cat ~/test-transfer.txt
    ```

### Part E – (Optional) Disable Password Authentication

> **Only do this step if key authentication works reliably. You could lock yourself out.**

- [ ] 15. On the server, edit the SSH config:
    ```bash
    sudo nano /etc/ssh/sshd_config
    ```

- [ ] 16. Find the line `#PasswordAuthentication yes` and change it to:
    ```
    PasswordAuthentication no
    ```

- [ ] 17. Restart SSH:
    ```bash
    sudo systemctl restart ssh
    ```

- [ ] 18. **In a new terminal window**, test that you can still connect with your key

- [ ] 19. Attempt to connect from a machine without the key — it should be refused

---

## Verification

1. What file on the server stores the authorised public keys?
2. What command copies a public key to a remote server?
3. Why should you test key login in a new terminal before disabling password auth?

---

## Next Lab

Proceed to [Lab 4 – CLI Essentials](lab-04-basic-cli.md)
