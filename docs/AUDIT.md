# Content Audit — Linux for Beginners

Audit performed against the repository state on the `get-ent-dev` branch (single truncated `README.md`) and the prior fuller revision (`b35aa2b`, ~782 lines).

## Executive summary

The repo claimed to be a complete Linux beginners course, but it was **not a completed learning module**. Content had been partially rewritten and then cut off mid-section. The older notes were a useful command dump, not a teachable course.

| Area | Before | Severity |
| --- | --- | --- |
| Completeness | README ended mid-password section | Critical |
| Syllabus delivery | Quiz, Files, Advanced CLI, Summary, Bonus listed but empty | Critical |
| Pedagogy | No objectives, prerequisites, or success criteria | High |
| Practice | No labs or hands-on checklists | High |
| Assessment | Quiz placeholders with no questions | High |
| Accuracy | Broken commands (`sudo allow 443`, `sudo install htop`, `sudo su user`) | High |
| Structure | One monolithic README; hard to navigate | Medium |
| Coverage gaps | WSL, VirtualBox, directory tree, Alma/RHEL only named | Medium |
| Navigation | TOC numbering/spacing broken; anchors incomplete | Low |

## What existed (valuable)

- Ubuntu Server install walkthrough with screenshots
- User / sudo / SSH basics
- Swap file tuning guide (detailed and largely correct)
- xRDP + Xfce remote desktop guide
- UFW firewall command list
- Ping and light monitoring notes (`htop`, `virt-manager`)
- External video links for Linux intro topics

## What was missing for a learning module

1. **Learning path** — ordered modules with time estimates and dependencies
2. **Learning objectives** per lesson (what you can do after finishing)
3. **Filled syllabus items** — directory structure, WSL, VirtualBox, file ops, advanced CLI
4. **Labs** — guided practice with expected outcomes
5. **Quizzes** — questions + answer keys
6. **Cheatsheets** — quick reference separated from teaching prose
7. **How to use this repo** — environment options and progress tracking
8. **Error fixes** — incorrect or unsafe command examples
9. **Capstone** — end-of-course project tying skills together
10. **References** organized by topic (not a bare link dump)

## Accuracy fixes applied in this rebuild

| Issue | Fix |
| --- | --- |
| `sudo allow 443` | `sudo ufw allow 443` |
| `sudo install htop` | `sudo apt install htop` |
| `sudo su user` (misleading) | Documented `su -`, `sudo -i`, and `sudo -u user` correctly |
| Root vs user `passwd` guidance | Clarified `passwd`, `passwd user`, and `sudo passwd user` |
| Empty “Quiz 1 / Review / Summary / Bonus” | Implemented as real modules, labs, quizzes, and a capstone |
| Truncated password section | Restored and expanded in Module 04 |

## Target structure after rebuild

```text
README.md                          Course hub
docs/
  00-getting-started.md            How to take the course
  AUDIT.md                         This audit
  modules/                         Lessons 01–11 + capstone
  labs/                            Hands-on practice
  quizzes/                         Assessments + answer keys
  cheatsheets/                     Quick command reference
scripts/                           Optional helper scripts
```

## Definition of “completed learning module”

This rebuild treats the course as complete when a learner can:

1. Choose an install path (WSL, VM, or bare-metal Ubuntu Server)
2. Navigate the filesystem and manage files/permissions
3. Create users, use `sudo`, and secure SSH access
4. Maintain a server (`apt`, reboot, swap, monitoring)
5. Configure UFW and verify connectivity
6. Optionally enable graphical remote access with xRDP
7. Pass the module quizzes and finish the capstone lab
