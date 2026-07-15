# Lab 01 — Users, Groups & Permissions

**Prerequisites:** [User Management](../README.md#user-management) and
[Understanding Permissions](../README.md#understanding-permissions).
**Estimated commands:** ~15. **Environment:** a VM or WSL where you have `sudo`.

## Objectives

- Create a user and a group.
- Grant and verify `sudo` access.
- Read and change file permissions and ownership.

## Tasks

1. Show who you currently are and your groups.
2. Create a new user named `devuser` (with a home directory).
3. Create a group named `project`.
4. Add `devuser` to both the `project` group and the `sudo` group **without** removing their other
   groups.
5. Verify `devuser`'s group membership.
6. As your normal user, create a file `report.txt` and a directory `shared/`.
7. Set `report.txt` so that the **owner** can read/write, the **group** can read, and **others**
   have no access.
8. Change the group ownership of `shared/` (and everything inside it) to `project`.
9. Make a script file `run.sh` executable and confirm the `x` bit is set.

## Verify Your Work

- [ ] `groups devuser` lists both `project` and `sudo`.
- [ ] `ls -l report.txt` shows `-rw-r-----`.
- [ ] `ls -ld shared` shows the group as `project`.
- [ ] `ls -l run.sh` shows an `x` in the permission string.

<details>
<summary><b>Hints / Solution</b></summary>

```bash
# 1
whoami; id

# 2
sudo adduser devuser

# 3
sudo groupadd project

# 4
sudo usermod -aG project devuser
sudo usermod -aG sudo devuser

# 5
groups devuser

# 6
touch report.txt
mkdir shared

# 7  (owner rw, group r, others none = 640)
chmod 640 report.txt

# 8
sudo chown -R :project shared

# 9
touch run.sh
chmod +x run.sh
ls -l run.sh
```

**Cleanup (optional):**
```bash
sudo deluser --remove-home devuser
sudo groupdel project
rm -r report.txt shared run.sh
```

</details>
