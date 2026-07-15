# Command Cheatsheet

Quick reference for the Linux for Beginners course. Details live in the modules.

## System identity

```bash
whoami
id
hostname
hostnamectl
uname -a
cat /etc/os-release
```

## Packages (Ubuntu)

```bash
sudo apt update
sudo apt upgrade -y
sudo apt install <package> -y
sudo apt remove <package>
apt search <keyword>
```

## Navigation & files

```bash
pwd
ls -la
cd /path
mkdir -p dir/sub
touch file
cp -r src dest
mv old new
rm -ri path
find /home -name "*.txt"
nano file
cat file
less file
head -n 20 file
tail -n 20 file
grep "text" file
chmod 644 file
chmod 755 script.sh
sudo chown user:group file
```

## Users

```bash
sudo adduser <user>
sudo passwd <user>
groups <user>
sudo usermod -aG sudo <user>
sudo -i
su - <user>
```

## SSH

```bash
ssh user@host
ssh -p 2222 user@127.0.0.1
scp file user@host:~/file
ssh-keygen -t ed25519
ssh-copy-id user@host
sudo systemctl status ssh
```

## Disk / memory / process

```bash
df -h
free -h
du -sh *
uptime
ps aux | head
top
htop
```

## Swap

```bash
sudo swapon --show
sudo fallocate -l 4G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
# persist in /etc/fstab:
# /swapfile none swap sw 0 0
```

## Networking & UFW

```bash
ip a
ip route
ping -c 4 1.1.1.1
sudo ufw allow OpenSSH
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw enable
sudo ufw status numbered
sudo ufw delete <n>
```

## Services

```bash
sudo systemctl status <service>
sudo systemctl start <service>
sudo systemctl enable <service>
sudo systemctl restart <service>
```

## xRDP (optional)

```bash
sudo apt install xfce4 xfce4-goodies xrdp -y
echo "xfce4-session" | tee ~/.xsession
sudo systemctl enable --now xrdp
sudo ufw allow 3389/tcp
```
