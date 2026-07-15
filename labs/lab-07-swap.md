# Lab 7 – Create and Configure a Swap File

**Module:** [Module 10 – Swap & Server Performance](../docs/10-swap-performance.md)  
**Duration:** ~20 minutes  
**Difficulty:** Beginner

---

## Objective

Create a 2 GB swap file, enable it, make it permanent across reboots, and tune the swappiness value.

---

## Prerequisites

- Ubuntu Server running and accessible
- At least 3 GB free disk space (check with `df -h`)

---

## Lab Steps

### Part A – Check Current State

- [ ] 1. Check if swap is already active:
    ```bash
    sudo swapon --show
    ```
    If there is output, your system already has swap. You can still follow this lab to create an additional swap file, or skip to Part B to check its configuration.

- [ ] 2. View memory and swap status:
    ```bash
    free -h
    ```

- [ ] 3. Confirm enough disk space is available:
    ```bash
    df -h /
    ```
    Ensure the **Avail** column shows at least 3 GB.

### Part B – Create the Swap File

- [ ] 4. Disable any existing swap:
    ```bash
    sudo swapoff -a
    ```

- [ ] 5. Create a 2 GB swap file:
    ```bash
    sudo fallocate -l 2G /swapfile
    ```

- [ ] 6. Verify the file size:
    ```bash
    ls -lh /swapfile
    ```
    Expected: `2.0G`

- [ ] 7. Secure the swap file (root only):
    ```bash
    sudo chmod 600 /swapfile
    ```

- [ ] 8. Verify the permissions:
    ```bash
    ls -lh /swapfile
    ```
    Expected: `-rw------- 1 root root 2.0G ...`

- [ ] 9. Format the file as swap:
    ```bash
    sudo mkswap /swapfile
    ```

- [ ] 10. Activate the swap file:
    ```bash
    sudo swapon /swapfile
    ```

- [ ] 11. Verify swap is active:
    ```bash
    sudo swapon --show
    free -h
    ```
    The Swap row should now show 2 GB total.

### Part C – Make Swap Permanent

- [ ] 12. Back up the fstab file:
    ```bash
    sudo cp /etc/fstab /etc/fstab.bak
    ```

- [ ] 13. Add the swap entry to fstab:
    ```bash
    echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
    ```

- [ ] 14. Verify the entry was added:
    ```bash
    tail -5 /etc/fstab
    ```
    You should see `/swapfile none swap sw 0 0` at the bottom.

- [ ] 15. Test the fstab entry:
    ```bash
    sudo swapoff -a
    sudo swapon -a
    sudo swapon --show
    ```
    Swap should still be active.

### Part D – Tune Swappiness

- [ ] 16. Check current swappiness:
    ```bash
    cat /proc/sys/vm/swappiness
    ```
    The default is 60.

- [ ] 17. Set swappiness to 10 for the current session:
    ```bash
    sudo sysctl vm.swappiness=10
    ```

- [ ] 18. Verify the change:
    ```bash
    cat /proc/sys/vm/swappiness
    ```

- [ ] 19. Make swappiness permanent:
    ```bash
    echo 'vm.swappiness=10' | sudo tee -a /etc/sysctl.conf
    ```

- [ ] 20. Also set vfs_cache_pressure:
    ```bash
    echo 'vm.vfs_cache_pressure=50' | sudo tee -a /etc/sysctl.conf
    ```

- [ ] 21. Apply settings without rebooting:
    ```bash
    sudo sysctl -p
    ```

---

## Verification

1. What is the current swap size? (from `free -h`)
2. What permissions should the swap file have, and why?
3. What line did you add to `/etc/fstab`?
4. What swappiness value is now set, and why is a lower value better for servers?

---

## Next Lab

Proceed to [Lab 8 – Remote Desktop (xRDP)](lab-08-xrdp.md)
