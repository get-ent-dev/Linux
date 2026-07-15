# Module 8 – File & Directory Operations

[← Module 7: Basic CLI](07-basic-cli.md) | [Back to Course Home](../README.md) | [Next Module: Networking & Firewall →](09-networking-firewall.md)

---

## Learning Objectives

By the end of this module you will be able to:

- Create, edit, copy, move, and delete files and directories
- Use `nano` to edit text files
- Understand and modify file permissions with `chmod` and `chown`
- Use `cat`, `less`, `head`, and `tail` to view file content
- Use `grep` to search within files

**Estimated time:** 45 minutes

---

## 8.1 Working with Files

### Create an Empty File

```bash
touch filename.txt
```

`touch` creates an empty file, or updates the timestamp of an existing one.

### Create a File with Content

```bash
echo "Hello, Linux!" > greeting.txt
```

`>` redirects output to a file, **overwriting** it. Use `>>` to **append**:

```bash
echo "Second line" >> greeting.txt
```

### View File Content

```bash
cat filename.txt          # Print entire file
less filename.txt         # Scroll through (press q to quit)
head -n 10 filename.txt   # First 10 lines
tail -n 10 filename.txt   # Last 10 lines
tail -f /var/log/syslog   # Watch file grow in real time
```

### Copy a File

```bash
cp source.txt destination.txt
```

Copy to a directory:

```bash
cp source.txt /home/linuxuser/backup/
```

Copy and overwrite without prompt:

```bash
cp -f source.txt destination.txt
```

Copy a directory and its contents:

```bash
cp -r source-directory/ destination-directory/
```

### Move or Rename a File

```bash
mv oldname.txt newname.txt           # Rename
mv file.txt /home/linuxuser/backup/  # Move to directory
mv olddir/ newdir/                   # Rename a directory
```

### Delete a File

```bash
rm filename.txt
```

Delete without confirmation prompt:

```bash
rm -f filename.txt
```

### Delete a Directory

```bash
rm -r directoryname/       # Recursive (required for directories)
rm -rf directoryname/      # Recursive + force (no prompts)
```

> **Warning:** `rm -rf` is permanent. Linux has no recycle bin. Double-check your command before pressing <kbd>Enter</kbd>.

---

## 8.2 Working with Directories

### Create a Directory

```bash
mkdir new-directory
```

Create nested directories in one command:

```bash
mkdir -p parent/child/grandchild
```

### Remove an Empty Directory

```bash
rmdir empty-directory
```

### View Directory Tree

If `tree` is installed:

```bash
sudo apt install tree
tree /home/linuxuser
```

---

## 8.3 Editing Files with nano

`nano` is a simple, beginner-friendly terminal text editor.

### Open a File

```bash
nano filename.txt
```

To edit a system configuration file (requires root privileges):

```bash
sudo nano /etc/hostname
```

### nano Keyboard Shortcuts

| Shortcut | Action |
| :--- | :--- |
| <kbd>Ctrl</kbd>+<kbd>O</kbd> | Save (write Out) |
| <kbd>Ctrl</kbd>+<kbd>X</kbd> | Exit |
| <kbd>Ctrl</kbd>+<kbd>W</kbd> | Search (Where) |
| <kbd>Ctrl</kbd>+<kbd>K</kbd> | Cut current line |
| <kbd>Ctrl</kbd>+<kbd>U</kbd> | Paste (Un-cut) |
| <kbd>Ctrl</kbd>+<kbd>G</kbd> | Display help |
| <kbd>Ctrl</kbd>+<kbd>C</kbd> | Show cursor position |

> Shortcuts are shown at the bottom of the nano editor as `^` (which means <kbd>Ctrl</kbd>).

### Practical Example — Edit the hostname

```bash
sudo nano /etc/hostname
```

Change the hostname, press <kbd>Ctrl</kbd>+<kbd>O</kbd>, press <kbd>Enter</kbd> to confirm the filename, then <kbd>Ctrl</kbd>+<kbd>X</kbd> to exit.

---

## 8.4 File Permissions

Linux controls access to files and directories with a **permission model** based on three categories of users:

| Category | Symbol | Meaning |
| :--- | :--- | :--- |
| **Owner** | `u` | The user who owns the file |
| **Group** | `g` | Users in the file's group |
| **Others** | `o` | Everyone else |

### Permission Types

| Permission | Symbol | Numeric | File Meaning | Directory Meaning |
| :--- | :--- | :--- | :--- | :--- |
| Read | `r` | 4 | View file contents | List directory contents |
| Write | `w` | 2 | Modify file contents | Create/delete files inside |
| Execute | `x` | 1 | Run as a program | Enter the directory (`cd`) |

### Reading Permissions with `ls -l`

```bash
ls -l greeting.txt
# -rw-r--r-- 1 linuxuser linuxuser 14 Jul 10 09:00 greeting.txt
```

Breaking down `-rw-r--r--`:

```
- rw- r-- r--
│ │   │   └── others: read only
│ │   └────── group: read only
│ └────────── owner: read + write
└──────────── file type: - = file, d = directory, l = symbolic link
```

### Changing Permissions with `chmod`

**Symbolic mode:**

```bash
chmod u+x script.sh       # Add execute for owner
chmod g-w file.txt        # Remove write from group
chmod o+r file.txt        # Add read for others
chmod a+x script.sh       # Add execute for all (a = all)
chmod go-rwx private.txt  # Remove all permissions from group and others
```

**Numeric (octal) mode:**

```bash
chmod 755 script.sh    # rwxr-xr-x (owner: rwx, group: r-x, others: r-x)
chmod 644 file.txt     # rw-r--r-- (owner: rw, group: r, others: r)
chmod 600 private.key  # rw------- (owner only)
chmod 700 ~/.ssh       # rwx------ (owner only, directory)
```

**Common permission patterns:**

| Pattern | Octal | Use Case |
| :--- | :--- | :--- |
| `rwxr-xr-x` | `755` | Executable scripts, directories |
| `rw-r--r--` | `644` | Normal text files |
| `rw-------` | `600` | Private files (SSH private key) |
| `rwx------` | `700` | Private directories |
| `rwxrwxr-x` | `775` | Shared group directories |

### Changing Ownership with `chown`

```bash
sudo chown alice file.txt              # Change owner to alice
sudo chown alice:developers file.txt   # Change owner and group
sudo chown -R alice /var/www/mysite    # Change owner recursively
sudo chgrp developers project/         # Change only the group
```

---

## 8.5 Searching with grep

`grep` searches for patterns (text) inside files.

### Basic Search

```bash
grep "error" /var/log/syslog
```

### Case-Insensitive Search

```bash
grep -i "error" /var/log/syslog
```

### Search Recursively in a Directory

```bash
grep -r "PasswordAuthentication" /etc/ssh/
```

### Show Line Numbers

```bash
grep -n "Port" /etc/ssh/sshd_config
```

### Invert Match (Show Lines that Do NOT Match)

```bash
grep -v "^#" /etc/ssh/sshd_config    # Exclude comment lines
```

### Count Matching Lines

```bash
grep -c "error" /var/log/syslog
```

---

## 8.6 Combining Commands with Pipes

The pipe character `|` sends the output of one command as input to another:

```bash
ls -la /etc | less                   # Browse a long listing
cat /etc/passwd | grep linuxuser     # Find a user
ps aux | grep nginx                  # Find a process
grep -i "error" /var/log/syslog | tail -20   # Last 20 errors
```

---

## 8.7 Links

### Symbolic Link (Symlink)

A shortcut pointing to another file or directory:

```bash
ln -s /etc/nginx/sites-available/mysite /etc/nginx/sites-enabled/mysite
```

### Hard Link

A second directory entry pointing to the same data on disk:

```bash
ln original.txt hardlink.txt
```

---

## 8.8 File Operations Quick Reference

| Task | Command |
| :--- | :--- |
| Create empty file | `touch filename` |
| Create file with content | `echo "text" > filename` |
| View file | `cat filename` |
| Page through file | `less filename` |
| View first N lines | `head -n N filename` |
| View last N lines | `tail -n N filename` |
| Edit file | `nano filename` |
| Copy file | `cp source dest` |
| Move / rename | `mv source dest` |
| Delete file | `rm filename` |
| Create directory | `mkdir dirname` |
| Create nested directories | `mkdir -p a/b/c` |
| Delete directory | `rm -rf dirname` |
| View permissions | `ls -l filename` |
| Change permissions | `chmod 644 filename` |
| Change owner | `sudo chown user:group filename` |
| Search in file | `grep "pattern" filename` |

---

## 8.9 Module Summary

- `touch`, `mkdir`, `cp`, `mv`, `rm` are the five core file operation commands
- `nano` is the recommended beginner text editor for the terminal
- Linux permissions use owner / group / others and read / write / execute categories
- `chmod` changes permissions; `chown` changes ownership
- `grep` searches for text in files; combine with `|` pipes for powerful queries

---

## Knowledge Check

1. What does `mkdir -p a/b/c` do that `mkdir a/b/c` does not?
2. What permission string does `chmod 644` produce?
3. Which command changes the owner of a file?
4. How do you search for the word "failed" in all files under `/var/log/`?
5. What is the difference between `>` and `>>` when redirecting output?

*(Answers: 1. `-p` creates all intermediate directories; without it, the command fails if `a/b` does not exist | 2. `rw-r--r--` | 3. `chown` | 4. `grep -r "failed" /var/log/` | 5. `>` overwrites the file; `>>` appends to it)*

---

[← Module 7: Basic CLI](07-basic-cli.md) | [Back to Course Home](../README.md) | [Next Module: Networking & Firewall →](09-networking-firewall.md)
