# Module 1 – Background & Introduction to Linux

[← Back to Course Home](../README.md) | [Next Module: Environment Setup →](02-environment-setup.md)

---

## Learning Objectives

By the end of this module you will be able to:

- Explain what Linux is and describe its key characteristics
- Summarise the history of Linux from Unix to the modern kernel
- Identify the most popular Linux distributions and their use cases
- Choose the right distribution for a given scenario
- List the main reasons organisations and developers use Linux

**Estimated time:** 30 minutes

---

## 1.1 What is Linux?

Linux is a **free, open-source operating system kernel** first released by Linus Torvalds in 1991. Unlike Windows or macOS, which are commercial products, Linux is developed collaboratively by thousands of contributors worldwide and its source code is freely available for anyone to inspect, modify, and distribute.

A **kernel** is the core of an operating system — it manages hardware resources (CPU, RAM, disk, network) and provides services to user programs. Linux distributions package the kernel together with system utilities, package managers, and sometimes a desktop environment to form a complete operating system.

### Key Characteristics

| Characteristic | Description |
| :--- | :--- |
| **Open Source** | Source code is publicly available under the GNU GPL licence |
| **Multi-user** | Multiple users can work on the same system simultaneously |
| **Multi-tasking** | Many processes run concurrently |
| **Portable** | Runs on x86, ARM, RISC-V, mainframes, and embedded devices |
| **Stable & Secure** | Long uptimes; permission model limits damage from exploits |
| **Free** | Most distributions cost nothing to download and use |

> **Watch:** [What is Linux? (YouTube)](https://www.youtube.com/watch?v=zA3vmx0GaO8)

---

## 1.2 A Brief History of Linux

| Year | Milestone |
| :--- | :--- |
| 1969 | AT&T Bell Labs develops **Unix** |
| 1983 | Richard Stallman starts the **GNU Project** to create free Unix tools |
| 1991 | Linus Torvalds releases Linux kernel **0.01** as a personal project |
| 1992 | Linux licensed under **GPL**; combined with GNU tools to make a full OS |
| 1993 | **Slackware** and **Debian** — among the first distributions — are released |
| 1994 | Linux kernel **1.0** released |
| 2004 | **Ubuntu** released, focusing on ease of use |
| 2008 | Linux powers the first **Android** device |
| 2011 | Linux runs on over **90% of the world's top 500 supercomputers** |
| Today | Powers servers, cloud infrastructure, smartphones, IoT, and desktops |

> **Watch:** [Brief History of Linux (YouTube)](https://www.youtube.com/watch?v=rrB13utjYV4)

---

## 1.3 What is a Linux Distribution?

A **Linux distribution** (or **distro**) is a complete operating system built around the Linux kernel. Different distributions make different choices about:

- **Package manager** (apt, yum/dnf, pacman)
- **Desktop environment** (GNOME, KDE, Xfce, none for servers)
- **Release model** (fixed releases vs rolling releases)
- **Target audience** (servers, desktops, embedded systems, security research)

> **Watch:** [What is a Linux Distribution? (YouTube)](https://www.youtube.com/watch?v=VKNMI6cYOFk)

---

## 1.4 Major Linux Distributions

### Enterprise / Server

| Distribution | Based On | Notes |
| :--- | :--- | :--- |
| **RHEL** (Red Hat Enterprise Linux) | Independent | Paid; industry standard for enterprises |
| **AlmaLinux** | RHEL source | Free, binary-compatible RHEL rebuild |
| **Rocky Linux** | RHEL source | Free, binary-compatible RHEL rebuild |
| **CentOS Stream** | RHEL upstream | Tracks ahead of RHEL; no longer a rebuild |
| **Ubuntu Server** | Debian | Very popular; long-term support releases |
| **Debian** | Independent | Extremely stable; powers many servers |
| **SLES** (SUSE Linux Enterprise) | Independent | Paid; popular in Europe |
| **OpenSUSE** | SLES | Free; enterprise-quality community edition |

### Desktop / General Use

| Distribution | Notes |
| :--- | :--- |
| **Ubuntu** (Desktop) | Most popular beginner-friendly distro |
| **Linux Mint** | Based on Ubuntu; very Windows-like feel |
| **Pop!_OS** | Ubuntu-based; excellent hardware support |
| **Fedora** | Community edition sponsored by Red Hat; leading-edge packages |
| **Arch Linux** | Rolling release; for advanced users who want full control |
| **Kali Linux** | Debian-based; pre-loaded security and penetration testing tools |

> **Watch:** [Reasons Linux is Used (YouTube)](https://www.youtube.com/watch?v=mAFMJ1LnQu8)

---

## 1.5 Why Use Linux?

### For Individuals
- **Cost** — free to download and use
- **Privacy** — no telemetry or forced updates
- **Performance** — runs well on older hardware
- **Learning** — understanding Linux builds valuable technical skills

### For Businesses & Developers
- **Servers** — the majority of web servers run Linux (Apache, Nginx)
- **Cloud** — AWS, Azure, and Google Cloud all offer Linux VMs; Linux dominates cloud workloads
- **DevOps & Containers** — Docker and Kubernetes run natively on Linux
- **Automation** — powerful shell scripting and cron jobs
- **Security** — strong permission model, frequent security updates, open source means auditable code
- **Cost** — no per-seat licensing fees for most distributions

---

## 1.6 Choosing the Right Distribution

Use this decision tree as a guide:

```
Are you setting up a server?
├── Yes → Ubuntu Server 22.04 LTS  (this course)
│         or AlmaLinux 9 / Rocky Linux 9 (RHEL-compatible)
└── No → Desktop use?
          ├── Beginner → Ubuntu Desktop or Linux Mint
          ├── Privacy/Control → Arch Linux or Fedora
          └── Security Testing → Kali Linux
```

> **This course uses Ubuntu Server 22.04 LTS** because it is the most widely used beginner-friendly server distribution with excellent community support.

---

## 1.7 Module Summary

- Linux is an open-source OS kernel created in 1991 by Linus Torvalds
- A distribution bundles the kernel with tools, a package manager, and optional GUI
- RHEL, Ubuntu Server, and Debian dominate the enterprise server world
- Linux is used because it is free, stable, secure, and highly automatable
- For this course we use **Ubuntu Server 22.04 LTS**

---

## Knowledge Check

Answer these questions before moving on:

1. Who created the Linux kernel and in what year?
2. What is the difference between a kernel and a distribution?
3. Name three enterprise-grade Linux distributions.
4. What package manager does Ubuntu use?
5. Name one reason a business would choose Linux for its servers.

*(Answers: 1. Linus Torvalds, 1991 | 2. The kernel manages hardware; a distro packages the kernel with tools and a GUI | 3. RHEL, Ubuntu Server, AlmaLinux | 4. apt | 5. Cost, stability, security, cloud support — any valid reason)*

---

[← Back to Course Home](../README.md) | [Next Module: Environment Setup →](02-environment-setup.md)
