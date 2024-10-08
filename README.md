# Ubuntu-Server-Training

## Ubuntu Server Setup

## Secure Shell ( SSH )

### Port 22 - SSH

> ssh **username**@**ip address**

Enter password

### Change sudo password

> sudo passwd

Enter new password

## Ubuntu Server Command Line ( Basic )

### Ubuntu Server Update

Must update and upgrade server every login to make sure security update

> sudo apt update

### Ubuntu Server Upgrade

> sudo apt upgrade

### Update & Upgrade Combination

> sudo apt update && sudo apt upgrade -y

-y will allow auto install upgrade

### User

#### Adduser

Adding a user

> sudo adduser **newuser**

Granting a User Sudo Privileges

> groups **newuser**

> sudo usermod -aG sudo **newuser**

### Reboot

> sudo reboot

## Ubuntu Server Command Line ( Advance )

### Swap File And Server Performance

### Remote Desktop ( xRDP )

### Edit File

> cd *to file directories*

> sudo nano *filename**

### Making New File

> sudo touch **filename**

### Making New Folder

> sudo mkdir **foldername**

### Delete File

> sudo rm **filename**


## Ubuntu Server Networking

### Firewall

### Ping


## Application

### Virtual Manager

> sudo apt install virt-manager

> sudo reboot

### Server Performance Monitoring

> sudo install htop

> sudo htop