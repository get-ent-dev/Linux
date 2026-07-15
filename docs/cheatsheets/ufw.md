# UFW Cheatsheet

## Lifecycle

```bash
sudo ufw status
sudo ufw status verbose
sudo ufw status numbered
sudo ufw enable
sudo ufw disable
sudo ufw reload
```

## Allow / deny

```bash
sudo ufw allow OpenSSH
sudo ufw allow 22/tcp
sudo ufw allow http
sudo ufw allow 80/tcp
sudo ufw allow https
sudo ufw allow 443/tcp
sudo ufw allow 3389/tcp
sudo ufw deny 23/tcp
```

## By address

```bash
sudo ufw allow from 192.168.1.100
sudo ufw deny from 203.0.113.50
sudo ufw allow from 192.168.1.100 to any port 22
```

## Delete

```bash
sudo ufw status numbered
sudo ufw delete 3
```

## Safe remote enable sequence

```bash
sudo ufw allow OpenSSH
sudo ufw enable
sudo ufw status
```

## Help

```bash
man ufw
```
