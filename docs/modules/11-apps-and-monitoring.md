# Module 11 — Applications and Monitoring

**Time:** 30 minutes  
**Prerequisites:** Ubuntu with sudo  
**Assessment:** [Quiz 03](../quizzes/quiz-03-server-ops.md)

## Learning objectives

- Install packages beyond the base system
- Monitor CPU, memory, and processes with `htop`
- Know what `virt-manager` is for (optional desktop/VM host use)

![Applications](https://github.com/user-attachments/assets/784a3784-ba54-4a78-a7f1-4cd708e7327c)

## Install and run htop

`htop` is an interactive process viewer (clearer than `top` for beginners).

```bash
sudo apt update
sudo apt install htop -y
htop
```

![htop](https://github.com/user-attachments/assets/1a0f05d1-e195-4ce7-bdd9-4886e8671f83)

Inside `htop`:

| Key | Action |
| --- | --- |
| <kbd>F3</kbd> / `/` | Search |
| <kbd>F6</kbd> | Sort by column |
| <kbd>F9</kbd> | Kill/signal a process (careful) |
| <kbd>q</kbd> | Quit |

Also useful:

```bash
uptime
free -h
df -h
ps aux --sort=-%mem | head
```

## Optional — Virtual Machine Manager

On a desktop Ubuntu (or a server with GUI) you can manage KVM VMs with:

```bash
sudo apt install virt-manager -y
sudo reboot
```

Then launch **Virtual Machine Manager** from the app menu (GUI session required). This is **not** required for the core course path.

![virt / monitoring related](https://github.com/user-attachments/assets/8d8d2825-08c4-4848-bc19-2d15f0ab0b27)

## Other handy packages (optional)

```bash
sudo apt install curl wget tree net-tools -y
curl -I https://ubuntu.com
tree -L 2 ~
```

## Try it

```bash
sudo apt install htop -y
htop
# observe CPU and memory, then press q
free -h
df -h
```

## Checkpoint

You can install a package with `apt` and interpret basic resource usage in `htop`.

## Next

- [Quiz 03 — Server ops](../quizzes/quiz-03-server-ops.md)
- [Module 12 — Capstone](12-capstone.md)
