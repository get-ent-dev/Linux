# Linux Command Cheat Sheet

A one-page quick reference for the commands used in this course. Keep it open while you practice.
`<...>` means "replace with your value". `#` starts a comment.

> Tip: press <kbd>Tab</kbd> to auto-complete paths, and <kbd>↑</kbd>/<kbd>↓</kbd> to reuse previous
> commands.

---

## Navigation & Orientation

```bash
pwd                 # print current directory
ls -lah             # list all files, long format, human-readable sizes
cd <dir>            # change directory
cd ..               # up one level
cd ~   |  cd        # go home
cd -                # go to previous directory
tree                # show directory tree (may need: sudo apt install tree)
```

## Viewing Files

```bash
cat <file>          # print whole file
less <file>         # scroll a file (q to quit)
head -n 20 <file>   # first 20 lines
tail -n 20 <file>   # last 20 lines
tail -f <file>      # follow a growing file (logs)
```

## Files & Directories

```bash
touch <file>        # create empty file / update timestamp
mkdir -p a/b/c      # create nested directories
cp <src> <dst>      # copy file
cp -r <src> <dst>   # copy directory
mv <src> <dst>      # move or rename
rm <file>           # delete file
rm -r <dir>         # delete directory (careful!)
ln -s <target> <link>   # symbolic link
```

## Searching

```bash
find <dir> -name "*.log"    # find by name
grep -ri "text" <dir>       # recursive, case-insensitive search
locate <name>               # fast index-based search (updatedb first)
which <cmd>                 # path to a command
```

## Permissions & Ownership

```bash
chmod 755 <file>            # rwx / r-x / r-x   (r=4 w=2 x=1)
chmod +x <file>             # make executable
chown user:group <file>     # change owner & group
chown -R user:group <dir>   # recursively
```

Permission math: `rwx=7  rw-=6  r-x=5  r--=4`

## Pipes, Redirection & Text

```bash
cmd > file          # write output to file (overwrite)
cmd >> file         # append
cmd 2> err.log      # redirect errors
cmd1 | cmd2         # pipe output into next command
grep sort uniq wc cut awk sed   # text-processing toolbox
```

## Users & Groups

```bash
whoami                          # current user
id <user>                       # UID/GID and groups
sudo adduser <user>             # create user + home
sudo deluser --remove-home <u>  # delete user + home
sudo usermod -aG <group> <u>    # add user to group (append!)
groups <user>                   # list a user's groups
passwd [<user>]                 # change password
sudo su -                       # become root
```

## SSH & File Transfer

```bash
ssh <user>@<ip>                 # connect (add -p <port> for custom port)
ssh-keygen -t ed25519           # generate a key pair
ssh-copy-id <user>@<ip>         # install your public key on server
scp <file> <user>@<ip>:/path/   # copy file to server
scp -r <dir> <user>@<ip>:/path/ # copy directory
rsync -avz <dir> <user>@<ip>:/path/   # efficient sync
```

## Packages (Ubuntu/Debian)

```bash
sudo apt update                 # refresh package index
sudo apt upgrade                # install updates
sudo apt install <pkg>          # install
sudo apt remove <pkg>           # remove
sudo apt purge <pkg>            # remove + config
sudo apt autoremove             # clean unused deps
apt search <keyword>            # find packages
# RHEL-family: swap 'apt' for 'dnf'
```

## Services (systemd)

```bash
sudo systemctl start|stop|restart <svc>
sudo systemctl status <svc>
sudo systemctl enable|disable <svc>   # (do not) start at boot
journalctl -u <svc>                   # service logs
```

## Networking & Firewall

```bash
ip addr                 # IP addresses
ip route                # routing table
ping -c 4 <host>        # test connectivity
ss -tulpn               # listening ports
dig <domain>            # DNS lookup
sudo netplan apply      # apply /etc/netplan/*.yaml
sudo ufw allow OpenSSH  # allow SSH (before enabling!)
sudo ufw enable         # turn firewall on
sudo ufw status verbose # show rules
```

## Performance & Monitoring

```bash
top | htop              # live processes
free -h                 # memory & swap
df -h                   # disk space
du -sh <dir>            # directory size
uptime                  # load averages
vmstat 1                # CPU/memory stats each second
```

## Swap

```bash
sudo fallocate -l 2G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
swapon --show
```

## Archives

```bash
tar -czvf out.tar.gz <dir>/     # create gzip archive
tar -xzvf out.tar.gz            # extract
zip -r out.zip <dir>/           # create zip
unzip out.zip                   # extract zip
```

## Getting Help

```bash
man <cmd>               # full manual (q to quit)
<cmd> --help            # short usage
apropos <keyword>       # search man pages
```

## Handy Keyboard Shortcuts

| Shortcut | Action |
| :--- | :--- |
| <kbd>Tab</kbd> | Auto-complete |
| <kbd>Ctrl</kbd>+<kbd>C</kbd> | Cancel the running command |
| <kbd>Ctrl</kbd>+<kbd>D</kbd> | End input / log out |
| <kbd>Ctrl</kbd>+<kbd>L</kbd> | Clear the screen |
| <kbd>Ctrl</kbd>+<kbd>R</kbd> | Search command history |
| <kbd>Ctrl</kbd>+<kbd>A</kbd> / <kbd>Ctrl</kbd>+<kbd>E</kbd> | Jump to start / end of line |
