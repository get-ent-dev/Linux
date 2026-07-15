# Lab 2 – User Management

**Module:** [Module 5 – User Management](../docs/05-user-management.md)  
**Duration:** ~20 minutes  
**Difficulty:** Beginner

---

## Objective

Create and manage user accounts, assign groups, grant sudo privileges, and practice switching between users.

---

## Prerequisites

- Lab 1 completed (Ubuntu Server running)
- Logged in to the server console or via SSH

---

## Lab Steps

### Part A – Create Users

- [ ] 1. Create a new user named `alice`:
    ```bash
    sudo adduser alice
    ```
    Set a password when prompted.

- [ ] 2. Create another user named `bob`:
    ```bash
    sudo adduser bob
    ```

- [ ] 3. Verify both users exist:
    ```bash
    cat /etc/passwd | grep -E "alice|bob"
    ```

### Part B – Assign Groups and sudo

- [ ] 4. Check alice's current groups:
    ```bash
    groups alice
    ```

- [ ] 5. Grant alice sudo privileges:
    ```bash
    sudo usermod -aG sudo alice
    ```

- [ ] 6. Verify alice is now in the sudo group:
    ```bash
    groups alice
    ```
    Expected output includes `sudo`.

- [ ] 7. **Do not** grant bob sudo access.

### Part C – Switch Users

- [ ] 8. Switch to alice:
    ```bash
    su - alice
    ```

- [ ] 9. Verify you are now alice:
    ```bash
    whoami
    id
    ```

- [ ] 10. Test alice's sudo access:
    ```bash
    sudo apt update
    ```
    Enter alice's password when prompted. It should succeed.

- [ ] 11. Return to linuxuser:
    ```bash
    exit
    ```

- [ ] 12. Switch to bob:
    ```bash
    su - bob
    ```

- [ ] 13. Test bob's sudo access (should fail):
    ```bash
    sudo apt update
    ```
    Expected: `bob is not in the sudoers file. This incident will be reported.`

- [ ] 14. Return to linuxuser:
    ```bash
    exit
    ```

### Part D – Change a Password

- [ ] 15. Change alice's password:
    ```bash
    sudo passwd alice
    ```
    Set a new password.

- [ ] 16. Change your own password:
    ```bash
    passwd
    ```
    Enter your current password, then the new password twice.

### Part E – Clean Up

- [ ] 17. Delete bob (he is not needed for further labs):
    ```bash
    sudo deluser --remove-home bob
    ```

- [ ] 18. Verify bob is gone:
    ```bash
    id bob
    ```
    Expected: `id: 'bob': no such user`

---

## Verification

1. What groups does alice belong to? (Run `groups alice`)
2. What happens when a user without sudo tries to run `sudo apt update`?
3. What flag is required with `deluser` to also remove the home directory?

---

## Next Lab

Proceed to [Lab 3 – SSH & Key Authentication](lab-03-ssh.md)
