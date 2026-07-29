# RHCSA exam objectives (EX200)

Study points for the **Red Hat Certified System Administrator (RHCSA)** exam,
EX200. This exam is based on **Red Hat Enterprise Linux 10**.

I quote the objectives from Red Hat's published exam page:
<https://www.redhat.com/en/services/training/ex200-red-hat-certified-system-administrator-rhcsa-exam>
(retrieved 2026-07-28).

I give each objective a stable ID (`RHCSA-<category>.<n>`). Week notes, labs,
and the coverage matrix point at the ID, not the wording, so a cross-reference
still works after a rewording or a reordering. I never reuse or renumber an ID.

You should be able to do everything below without help.

See [`coverage.md`](coverage.md) for which course material teaches each
objective.

## 1. Understand and use essential tools

| ID | Objective |
| --- | --- |
| RHCSA-1.1 | Access a shell prompt and issue commands with correct syntax |
| RHCSA-1.2 | Use input-output redirection (`>`, `>>`, `\|`, `2>`, etc.) |
| RHCSA-1.3 | Use `grep` and regular expressions to analyze text |
| RHCSA-1.4 | Access remote systems using SSH |
| RHCSA-1.5 | Log in and switch users in multi-user targets |
| RHCSA-1.6 | Archive, compress, unpack, and uncompress files using `tar`, `gzip`, and `bzip2` |
| RHCSA-1.7 | Create and edit text files |
| RHCSA-1.8 | Create, delete, copy, and move files and directories |
| RHCSA-1.9 | Create hard and soft links |
| RHCSA-1.10 | List, set, and change standard ugo/rwx permissions |
| RHCSA-1.11 | Locate, read, and use system documentation including `man`, `info`, and files in `/usr/share/doc` |

## 2. Manage software

| ID | Objective |
| --- | --- |
| RHCSA-2.1 | Configure access to RPM repositories |
| RHCSA-2.2 | Install and remove RPM software packages |
| RHCSA-2.3 | Configure access to Flatpak repositories |
| RHCSA-2.4 | Install and remove Flatpak software packages |

## 3. Create simple shell scripts

| ID | Objective |
| --- | --- |
| RHCSA-3.1 | Conditionally execute code (use of: `if`, `test`, `[]`, etc.) |
| RHCSA-3.2 | Use looping constructs (`for`, etc.) to process file, command line input |
| RHCSA-3.3 | Process script inputs (`$1`, `$2`, etc.) |
| RHCSA-3.4 | Processing output of shell commands within a script |

## 4. Operate running systems

| ID | Objective |
| --- | --- |
| RHCSA-4.1 | Boot, reboot, and shut down a system normally |
| RHCSA-4.2 | Boot systems into different targets manually |
| RHCSA-4.3 | Interrupt the boot process in order to gain access to a system |
| RHCSA-4.4 | Identify CPU/memory intensive processes and kill processes |
| RHCSA-4.5 | Adjust process scheduling |
| RHCSA-4.6 | Manage tuning profiles |
| RHCSA-4.7 | Locate and interpret system log files and journals |
| RHCSA-4.8 | Preserve system journals |
| RHCSA-4.9 | Start, stop, and check the status of network services |
| RHCSA-4.10 | Securely transfer files between systems |

## 5. Configure local storage

| ID | Objective |
| --- | --- |
| RHCSA-5.1 | List, create, and delete partitions on GPT disks |
| RHCSA-5.2 | Create and remove physical volumes |
| RHCSA-5.3 | Assign physical volumes to volume groups |
| RHCSA-5.4 | Create and delete logical volumes |
| RHCSA-5.5 | Configure systems to mount file systems at boot by universally unique ID (UUID) or label |
| RHCSA-5.6 | Add new partitions and logical volumes, and swap to a system non-destructively |

## 6. Create and configure file systems

| ID | Objective |
| --- | --- |
| RHCSA-6.1 | Create, mount, unmount, and use VFAT, ext4, and XFS file systems |
| RHCSA-6.2 | Mount and unmount network file systems using NFS |
| RHCSA-6.3 | Configure autofs |
| RHCSA-6.4 | Extend existing logical volumes |
| RHCSA-6.5 | Diagnose and correct file permission problems |

## 7. Deploy, configure, and maintain systems

| ID | Objective |
| --- | --- |
| RHCSA-7.1 | Schedule tasks using `at`, `cron` and systemd timer units |
| RHCSA-7.2 | Start and stop services and configure services to start automatically at boot |
| RHCSA-7.3 | Configure systems to boot into a specific target automatically |
| RHCSA-7.4 | Configure time service clients |
| RHCSA-7.5 | Install and update software packages from Red Hat Content Delivery Network, a remote repository, or from the local file system |
| RHCSA-7.6 | Modify the system bootloader |

## 8. Manage basic networking

| ID | Objective |
| --- | --- |
| RHCSA-8.1 | Configure IPv4 and IPv6 addresses |
| RHCSA-8.2 | Configure hostname resolution |
| RHCSA-8.3 | Configure network services to start automatically at boot |
| RHCSA-8.4 | Restrict network access using `firewalld` and `firewall-cmd` |

## 9. Manage users and groups

| ID | Objective |
| --- | --- |
| RHCSA-9.1 | Create, delete, and modify local user accounts |
| RHCSA-9.2 | Change passwords and adjust password aging for local user accounts |
| RHCSA-9.3 | Create, delete, and modify local groups and group memberships |
| RHCSA-9.4 | Configure privileged access |

## 10. Manage security

| ID | Objective |
| --- | --- |
| RHCSA-10.1 | Configure firewall settings using `firewall-cmd`/`firewalld` |
| RHCSA-10.2 | Manage default file permissions |
| RHCSA-10.3 | Configure key-based authentication for SSH |
| RHCSA-10.4 | Set enforcing and permissive modes for SELinux |
| RHCSA-10.5 | List and identify SELinux file and process context |
| RHCSA-10.6 | Restore default file contexts |
| RHCSA-10.7 | Manage SELinux port labels |
| RHCSA-10.8 | Use Boolean settings to modify system SELinux settings |

> As with all Red Hat performance-based exams, configurations must persist after
> reboot without intervention.

## Exam format

Every point below comes from the exam page cited above, except two:

- The point about multiple-choice questions comes from Red Hat's certification
  overview:
  <https://www.redhat.com/en/services/training-and-certification/why-get-certified>
- The points about the command-line assistant come from Red Hat's video "How the
  Command Line Assistant affects RHCSA and RHCE exams", on its Red Hat
  Enterprise Linux channel: <https://youtu.be/8UIi23AfQJM>

Both were retrieved on 2026-07-28. Timestamps below refer to the video.

- Hands-on and practical: you undertake real-world tasks on live systems. Red
  Hat validates skills "instead of memorization and multiple-choice questions",
  so the exam has none.
- Performance-based grading: **configurations must survive a reboot without
  manual intervention**.
- Closed book. You cannot bring notes, printed material, or electronic
  documentation, and you have no internet access during the exam.
- The documentation that ships with the product is available "for most exams",
  which means the man pages and `/usr/share/doc`. That is why RHCSA-1.11
  matters in practice.
- **No AI assistance.** The command-line assistant is not available, because it
  needs internet access and the exam does not allow it (0:15). Red Hat gives a
  second reason: the assistant could give you incorrect information and unfairly
  affect your result (0:32).

## Keeping this file current

Red Hat revises the objectives between RHEL major versions. I re-check all three
sources at the start of each semester and record the new retrieval dates
above. When the objectives change, I add new IDs and retire old ones. I never
renumber an ID that is already in use, so older cross-references keep working.

One point here has a known expiry. Red Hat plans to reconsider the command-line
assistant once it can run as a locally hosted model, so that every candidate
gets the same controlled experience (0:53). Check that each semester too.
