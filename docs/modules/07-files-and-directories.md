# Module 07 — Files and Directories

**Time:** 60 minutes  
**Prerequisites:** [Module 06](06-command-line-basics.md)  
**Lab:** [Lab 03 — Filesystem tour](../labs/lab-03-filesystem-tour.md)

## Learning objectives

- Create, edit, copy, move, and delete files/directories safely
- Read permission bits and change them with `chmod` / `chown`
- Understand important system directories at a practical level
- Avoid destructive mistakes with `rm`

## 1. Create and edit

### New empty file

```bash
touch notes.txt
sudo touch /etc/lab-marker.conf    # needs sudo outside your home
```

### New directory

```bash
mkdir projects
mkdir -p projects/linux/module07   # create parents as needed
```

### Edit with nano

```bash
nano notes.txt
# Ctrl+O save, Enter confirm, Ctrl+X exit

sudo nano /etc/hosts
```

## 2. Copy, move, rename

```bash
cp notes.txt notes.bak
cp -r projects projects-backup
mv notes.txt documents/notes.txt   # move
mv oldname.txt newname.txt         # rename
```

## 3. Delete (careful!)

```bash
rm file.txt
rm -r emptydir_or_tree     # recursive
rm -ri important_dir       # interactive recursive (safer practice)
```

> Prefer `rm -ri` while learning. Avoid `rm -rf /` or wild deletes as root.

Historic cheat-sheet style (use with care):

```bash
sudo rm -rf <path>
```

## 4. Viewing permissions

```bash
ls -l
```

```text
drwxr-xr-x 2 alex alex 4096 Jul 15 10:00 projects
-rw-r--r-- 1 alex alex  120 Jul 15 10:00 notes.txt
```

| Chunk | Meaning |
| --- | --- |
| `d` or `-` | directory or file |
| `rwx` (user) | owner read/write/execute |
| `r-x` (group) | group permissions |
| `r-x` (other) | everyone else |

Execute on a directory means you can **enter** it (`cd`).

## 5. Changing permissions and ownership

```bash
chmod u+x script.sh        # add execute for owner
chmod 644 notes.txt        # rw-r--r--
chmod 755 script.sh        # rwxr-xr-x
sudo chown alex:alex file.txt
sudo chown -R alex:alex projects/
```

Common modes:

| Mode | Typical use |
| --- | --- |
| `644` | Normal files |
| `755` | Scripts / directories |
| `600` | Private keys / swap files |
| `700` | Private directories |

## 6. Directory structure — practical map

| Path | You will use it for |
| --- | --- |
| `/home/<user>` | Your files |
| `/etc` | Config (`sshd_config`, `fstab`, `sysctl.conf`) |
| `/var/log` | Logs |
| `/tmp` | Scratch space |
| `/usr/bin` | User commands |
| `/opt` | Optional apps |
| `/mnt` | Temporary mounts |

Explore:

```bash
ls /
ls /home
ls /etc | head
du -sh /var/log
```

## Try it

```bash
mkdir -p ~/lab07/{inbox,outbox}
echo "hello linux" > ~/lab07/inbox/hello.txt
cp ~/lab07/inbox/hello.txt ~/lab07/outbox/
mv ~/lab07/outbox/hello.txt ~/lab07/outbox/hello-copy.txt
chmod 600 ~/lab07/outbox/hello-copy.txt
ls -lR ~/lab07
```

## Checkpoint

You can manage files in your home directory and explain what `755` vs `644` means.

## Next

- [Lab 03](../labs/lab-03-filesystem-tour.md)
- [Quiz 02](../quizzes/quiz-02-cli-and-files.md)
- Server track continues: [Module 08 — Swap and Performance](08-swap-and-performance.md)
