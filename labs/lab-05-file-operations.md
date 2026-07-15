# Lab 5 – File & Directory Operations

**Module:** [Module 8 – File & Directory Operations](../docs/08-file-operations.md)  
**Duration:** ~30 minutes  
**Difficulty:** Beginner

---

## Objective

Practice creating, editing, copying, moving, and deleting files and directories. Configure file permissions using `chmod` and `chown`.

---

## Prerequisites

- Ubuntu Server running and accessible
- `linuxuser` account with sudo privileges

---

## Lab Steps

### Part A – Directory Structure

- [ ] 1. Create a practice directory:
    ```bash
    mkdir ~/linux-lab
    cd ~/linux-lab
    ```

- [ ] 2. Create a nested structure:
    ```bash
    mkdir -p projects/web projects/scripts notes/drafts
    ```

- [ ] 3. View the structure:
    ```bash
    tree ~/linux-lab
    ```

### Part B – Creating and Editing Files

- [ ] 4. Create an empty file:
    ```bash
    touch notes/drafts/todo.txt
    ```

- [ ] 5. Create a file with content:
    ```bash
    echo "# Linux Lab Notes" > notes/README.txt
    echo "Created: $(date)" >> notes/README.txt
    ```

- [ ] 6. View the file:
    ```bash
    cat notes/README.txt
    ```

- [ ] 7. Open and edit the file with nano:
    ```bash
    nano notes/README.txt
    ```
    Add a new line: `Author: Linux User`  
    Save with <kbd>Ctrl</kbd>+<kbd>O</kbd>, <kbd>Enter</kbd>, then exit with <kbd>Ctrl</kbd>+<kbd>X</kbd>

- [ ] 8. Create a simple shell script:
    ```bash
    nano projects/scripts/hello.sh
    ```
    Add this content:
    ```bash
    #!/bin/bash
    echo "Hello, $(whoami)! Today is $(date)."
    ```
    Save and exit.

### Part C – Permissions

- [ ] 9. View the current permissions on the script:
    ```bash
    ls -l projects/scripts/hello.sh
    ```
    Note the permissions string (should be `-rw-r--r--`).

- [ ] 10. Try to run the script (it will fail):
    ```bash
    projects/scripts/hello.sh
    ```
    Expected: `Permission denied`

- [ ] 11. Add execute permission:
    ```bash
    chmod +x projects/scripts/hello.sh
    ```

- [ ] 12. Verify the permission change:
    ```bash
    ls -l projects/scripts/hello.sh
    ```
    Should now show `-rwxr-xr-x`.

- [ ] 13. Run the script:
    ```bash
    ./projects/scripts/hello.sh
    ```
    It should print a greeting.

- [ ] 14. Set permissions numerically:
    ```bash
    chmod 644 notes/README.txt
    ls -l notes/README.txt
    ```
    Expected: `-rw-r--r--`

- [ ] 15. Make the notes directory group-writable:
    ```bash
    chmod 775 notes/
    ls -ld notes/
    ```
    Expected: `drwxrwxr-x`

### Part D – Copy, Move, and Delete

- [ ] 16. Copy a file:
    ```bash
    cp notes/README.txt notes/drafts/README-backup.txt
    ```

- [ ] 17. Verify the copy:
    ```bash
    ls notes/drafts/
    ```

- [ ] 18. Move (rename) a file:
    ```bash
    mv notes/drafts/todo.txt notes/drafts/tasks.txt
    ```

- [ ] 19. Move a file to a different directory:
    ```bash
    mv notes/drafts/tasks.txt notes/
    ```

- [ ] 20. Delete a file:
    ```bash
    rm notes/drafts/README-backup.txt
    ```

- [ ] 21. Delete an empty directory:
    ```bash
    rmdir notes/drafts
    ```

### Part E – Searching with grep

- [ ] 22. Search for "Linux" in all files under notes/:
    ```bash
    grep -r "Linux" notes/
    ```

- [ ] 23. Search case-insensitively:
    ```bash
    grep -ri "author" notes/
    ```

- [ ] 24. Count lines containing "Linux":
    ```bash
    grep -c "Linux" notes/README.txt
    ```

---

## Verification

1. What permission string does `chmod 755` produce?
2. How do you give only the owner execute permission? (`chmod ___+x`)
3. What command creates nested directories in one step?
4. What flag makes `grep` search recursively in directories?

---

## Clean Up (Optional)

```bash
cd ~
rm -rf ~/linux-lab
```

---

## Next Lab

Proceed to [Lab 6 – Firewall Rules](lab-06-networking.md)
