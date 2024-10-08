# Ubuntu-Server-Training

## Ubuntu Server Setup

## Secure Shell ( SSH )

### Port 22 - SSH

Using **Putty** or **Linux Terminal**

> ssh **username**@**ip address**

Enter password

### Change sudo password

> sudo passwd

Enter **new password**

## Ubuntu Server Command Line ( Basic )

### Ubuntu Server Update

Must update and upgrade server every login to make sure security update

> sudo apt update

### Ubuntu Server Upgrade

> sudo apt upgrade

### Update & Upgrade Combination

> sudo apt update && sudo apt upgrade -y

**-y** will allow auto install upgrade and mean **Yes**

### User

#### Adduser

Adding a user

> sudo adduser **newuser**

Enter **password for newuser**

Granting a User **Sudo Privileges**

> groups **newuser**

> sudo usermod -aG sudo **newuser**

Enter newuser

> sudo su **newuser**

### Reboot

> sudo reboot

## Ubuntu Server Command Line ( Advance )

### Swap File And Server Performance

**Whaat is SwapFile?**

Swap is a portion of hard drive storage that has been set aside for the operating system to temporarily store data that it can no longer hold in RAM. This lets you increase the amount of information that your server can keep in its working memory, with some caveats. The swap space on the hard drive will be used mainly when there is no longer sufficient space in RAM to hold in-use application data.

The information written to disk will be significantly slower than information kept in RAM, but the operating system will prefer to keep running application data in memory and use swap for the older data. Overall, having swap space as a fallback for when your system’s RAM is depleted can be a good safety net against out-of-memory exceptions on systems with non-SSD storage available.

#### SwapFile Command

##### Step 1 – Checking the System for Swap Information

Before we begin, we can check if the system already has some swap space available. It is possible to have multiple swap files or swap partitions, but generally one should be enough.

We can see if the system has any configured swap by typing:

> sudo swapon --show

If you don’t get back any output, this means your system does not have swap space available currently.

You can verify that there is no active swap using the free utility:

> free -h

As you can see in the Swap row of the output, no swap is active on the system.

##### Step 2 – Checking Available Space on the Hard Drive Partition

Before we create our swap file, we’ll check our current disk usage to make sure we have enough space. Do this by entering:

> df -h

The device with / in the Mounted on column is our disk in this case. We have plenty of space available in this example (only 1.4G used). Your usage will probably be different.

Although there are many opinions about the appropriate size of a swap space, it really depends on your personal preferences and your application requirements. Generally, an amount equal to or double the amount of RAM on your system is a good starting point. Another good rule of thumb is that anything over 4G of swap is probably unnecessary if you are just using it as a RAM fallback.

##### Step 3 – Creating a Swap File

Now that we know our available hard drive space, we can create a swap file on our filesystem. We will allocate a file of the size that we want called swapfile in our root (/) directory.

The best way of creating a swap file is with the fallocate program. This command instantly creates a file of the specified size.

Since the server in our example has 1G of RAM, we will create a 1G file in this guide. Adjust this to meet the needs of your own server:

> sudo fallocate -l 1G /swapfile

We can verify that the correct amount of space was reserved by typing:

> ls -lh /swapfile

Our file has been created with the correct amount of space set aside.

##### Step 4 – Enabling the Swap File

Now that we have a file of the correct size available, we need to actually turn this into swap space.

First, we need to lock down the permissions of the file so that only users with root privileges can read the contents. This prevents normal users from being able to access the file, which would have significant security implications.

Make the file only accessible to root by typing:

> sudo chmod 600 /swapfile

Verify the permissions change by typing:

> ls -lh /swapfile

As you can see, only the root user has the read and write flags enabled.

We can now mark the file as swap space by typing:

> sudo mkswap /swapfile

After marking the file, we can enable the swap file, allowing our system to start using it:

> sudo swapon /swapfile

Verify that the swap is available by typing:

> sudo swapon --show

We can check the output of the free utility again to corroborate our findings:

> free -h

Our swap has been set up successfully and our operating system will begin to use it as necessary.

##### Step 5 – Making the Swap File Permanent

Our recent changes have enabled the swap file for the current session. However, if we reboot, the server will not retain the swap settings automatically. We can change this by adding the swap file to our /etc/fstab file.

Back up the /etc/fstab file in case anything goes wrong:

> sudo cp /etc/fstab /etc/fstab.bak

Add the swap file information to the end of your /etc/fstab file by typing:

> echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab

Next we’ll review some settings we can update to tune our swap space

##### Step 6 – Tuning your Swap Settings

There are a few options that you can configure that will have an impact on your system’s performance when dealing with swap.

###### Adjusting the Swappiness Property

The **swappiness** parameter configures how often your system swaps data out of RAM to the swap space. This is a value between 0 and 100 that represents a percentage.

With values close to zero, the kernel will not swap data to the disk unless absolutely necessary. Remember, interactions with the swap file are “expensive” in that they take a lot longer than interactions with RAM and they can cause a significant reduction in performance. Telling the system not to rely on the swap much will generally make your system faster.

Values that are closer to 100 will try to put more data into swap in an effort to keep more RAM space free. Depending on your applications’ memory profile or what you are using your server for, this might be better in some cases.

We can see the current swappiness value by typing:

> cat /proc/sys/vm/swappiness

For a Desktop, a swappiness setting of 60 is not a bad value. For a server, you might want to move it closer to 0.

We can set the swappiness to a different value by using the sysctl command.

For instance, to set the swappiness to 10, we could type:

> sudo sysctl vm.swappiness=10

This setting will persist until the next reboot. We can set this value automatically at restart by adding the line to our /etc/sysctl.conf file

> sudo nano /etc/sysctl.conf

At the bottom, you can add:

**vm.swappiness=10**

Save and close the file when you are finished.

##### Adjusting the Cache Pressure Setting

Another related value that you might want to modify is the **vfs_cache_pressure**. This setting configures how much the system will choose to cache inode and dentry information over other data.

Basically, this is access data about the filesystem. This is generally very costly to look up and very frequently requested, so it’s an excellent thing for your system to cache. You can see the current value by querying the **proc** filesystem again:

> cat /proc/sys/vm/vfs_cache_pressure

As it is currently configured, our system removes inode information from the cache too quickly. We can set this to a more conservative setting like 50 by typing:

> sudo sysctl vm.vfs_cache_pressure=50

Again, this is only valid for our current session. We can change that by adding it to our configuration file like we did with our swappiness setting:

> sudo nano /etc/sysctl.conf

At the bottom, add the line that specifies your new value:

**vm.vfs_cache_pressure=50**

Save and close the file when you are finished.

### Remote Desktop ( xRDP )

### Edit File

> cd **to file directories**

> sudo nano **filename**

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