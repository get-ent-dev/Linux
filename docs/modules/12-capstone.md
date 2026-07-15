# Module 12 — Capstone Project

**Time:** 90–120 minutes  
**Prerequisites:** Modules 01–11 (Module 09 optional)  
**Lab checklist:** [Lab 05 — Capstone](../labs/lab-05-capstone.md)

## Goal

Build a small **Ubuntu Server lab host** that demonstrates the full beginner skill set: install, users, SSH, updates, files, swap, firewall, and monitoring.

## Scenario

You are setting up a personal lab server named `linux-lab` for future courses. It must be reachable over SSH, reasonably maintained, and documented.

## Deliverables

1. Fresh Ubuntu Server (VM recommended)
2. Non-root admin user with sudo
3. Extra practice user **without** sudo
4. OpenSSH enabled; you can log in remotely
5. System updated (`apt update && apt upgrade`)
6. Swap file configured and persistent
7. UFW enabled with SSH allowed (and HTTP optional)
8. `htop` installed
9. A `~/SERVER_NOTES.md` file you wrote summarizing IPs, users, and open ports
10. (Optional) xRDP working on a private network

## Success criteria

| Criterion | Passes when |
| --- | --- |
| Identity | `hostnamectl` shows a sensible hostname |
| Access | SSH login works for your admin user |
| Privilege | Admin can `sudo whoami` → `root`; practice user cannot |
| Persistence | After reboot: swap active, UFW active, SSH works |
| Hygiene | `~/SERVER_NOTES.md` exists and is accurate |
| Monitoring | `htop` launches |

## Suggested order

1. Install / first boot (Module 03)
2. Hostname + updates (Modules 06)
3. Users (Module 04)
4. SSH verify (Module 05)
5. Swap (Module 08)
6. UFW (Module 10) — allow SSH first
7. htop (Module 11)
8. Document + reboot test
9. Optional xRDP (Module 09)

## Stretch goals

- SSH key login for the admin user
- UFW rule allowing SSH only from your host IP
- A backup of `/etc/fstab` and `/etc/ssh/sshd_config`
- Static IP on a bridged adapter

## After you finish

- Re-take quizzes you scored below 70%
- Keep the VM as your playground for the next course
- Browse references in the [README](../../README.md#references)

## Next

Open the step-by-step checklist → [Lab 05 — Capstone](../labs/lab-05-capstone.md)
