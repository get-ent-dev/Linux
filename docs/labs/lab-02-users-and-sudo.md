# Lab 02 — Users and sudo

**Goal:** Create users and verify privilege separation.  
**Time:** 25–35 minutes  
**Requires:** [Module 04](../modules/04-users-and-permissions.md)

## Tasks

1. Create two users:

```bash
sudo adduser adminlab
sudo adduser guestlab
```

2. Grant sudo only to `adminlab`:

```bash
sudo usermod -aG sudo adminlab
groups adminlab
groups guestlab
```

3. Test as `adminlab`:

```bash
su - adminlab
sudo whoami          # expect: root
exit
```

4. Test as `guestlab`:

```bash
su - guestlab
sudo whoami          # should fail / ask and deny
exit
```

5. Change `guestlab`’s password as an administrator:

```bash
sudo passwd guestlab
```

6. Document results in `~/linux-course/lab02-notes.txt`.

## Success checklist

- [ ] Both users exist (`id adminlab`, `id guestlab`)
- [ ] `adminlab` is in group `sudo`
- [ ] `guestlab` is not in `sudo`
- [ ] Password reset for `guestlab` works

## Cleanup (optional)

```bash
sudo deluser --remove-home guestlab
# keep adminlab if you will reuse it
```
