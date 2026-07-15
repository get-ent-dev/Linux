# Module 06 — Command Line Basics

**Time:** 60 minutes  
**Prerequisites:** A working shell  
**Assessment:** [Quiz 02](../quizzes/quiz-02-cli-and-files.md)

## Learning objectives

- Keep a server updated with `apt`
- Navigate with `pwd`, `ls`, `cd`
- Read help with `--help` and `man`
- Chain commands and reboot safely
- Use a few “power user” CLI techniques

## 1. Package updates (Ubuntu)

> Update package metadata and apply security fixes regularly — especially on servers.

```bash
sudo apt update
sudo apt upgrade
```

Combined (auto-confirm):

```bash
sudo apt update && sudo apt upgrade -y
```

- `&&` runs the next command only if the previous succeeded
- `-y` answers “yes” to prompts

Reboot when the kernel or critical services require it:

```bash
sudo reboot
```

## 2. Where am I?

```bash
pwd                 # print working directory
ls                  # list files
ls -la              # long listing, including hidden files
cd /etc             # change directory
cd ~                # home
cd ..               # parent directory
cd -                # previous directory
```

## 3. Getting help

```bash
ls --help
man ls              # manual page (q to quit)
whatis ls
apropos copy        # search man descriptions
```

## 4. Viewing and searching text

```bash
cat file.txt
less file.txt       # scroll; q to quit
head -n 20 file.txt
tail -n 20 file.txt
tail -f /var/log/syslog   # follow log (Ctrl+C to stop)
grep "error" file.txt
```

## 5. Finding things

```bash
find /home -name "*.txt"
which bash
command -v sudo
```

## 6. Disk and memory snapshots

```bash
df -h               # disk free, human-readable
free -h             # memory + swap
uptime              # load averages
```

## 7. Advanced techniques (beginner-friendly)

### Tab completion

Type part of a command or path and press <kbd>Tab</kbd>.

### History

```bash
history
!100                # re-run history item 100
Ctrl+R              # reverse search in history
```

### Pipes and redirection

```bash
ls /etc | less
dmesg | grep -i error
echo "hello" > out.txt      # overwrite
echo "more" >> out.txt      # append
sort names.txt | uniq
```

### Environment and identity

```bash
echo $PATH
echo $HOME
whoami
id
env | less
```

### Processes

```bash
ps aux | head
top                 # press q to quit
```

You will install a friendlier monitor (`htop`) in [Module 11](11-apps-and-monitoring.md).

## Try it

```bash
sudo apt update && sudo apt upgrade -y
pwd
ls -la /
cd /var/log && ls
df -h && free -h
man man
```

## Checkpoint

You can update packages, move around the tree, read man pages, and use pipes/`grep` for simple inspection.

## Next

[Module 07 — Files and Directories](07-files-and-directories.md)
