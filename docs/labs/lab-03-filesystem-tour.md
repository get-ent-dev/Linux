# Lab 03 — Filesystem Tour

**Goal:** Navigate the Linux tree and practice safe file operations.  
**Time:** 30–40 minutes  
**Requires:** [Module 07](../modules/07-files-and-directories.md)

## Part A — Explore

```bash
ls /
ls /home
ls /etc | head -n 20
ls /var/log | head
du -sh /var/log
```

In notes, write one sentence each for `/`, `/home`, `/etc`, `/var`, `/tmp`.

## Part B — Build a mini project tree

```bash
mkdir -p ~/linux-course/lab03/{src,backup,bin}
echo 'echo hello from lab03' > ~/linux-course/lab03/src/hello.sh
chmod 755 ~/linux-course/lab03/src/hello.sh
~/linux-course/lab03/src/hello.sh
cp ~/linux-course/lab03/src/hello.sh ~/linux-course/lab03/backup/
mv ~/linux-course/lab03/backup/hello.sh ~/linux-course/lab03/backup/hello.bak.sh
ls -lR ~/linux-course/lab03
```

## Part C — Permissions

```bash
echo secret > ~/linux-course/lab03/secret.txt
chmod 600 ~/linux-course/lab03/secret.txt
ls -l ~/linux-course/lab03/secret.txt
```

Confirm mode is `-rw-------`.

## Success checklist

- [ ] Can explain five top-level directories
- [ ] Script is executable and runs
- [ ] Backup file renamed correctly
- [ ] `secret.txt` is mode `600`

## Stretch

```bash
find ~/linux-course/lab03 -type f
grep -R "hello" ~/linux-course/lab03
```
