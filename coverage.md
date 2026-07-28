# RHCSA objective coverage

I map every RHCSA (EX200) objective from [`objectives.md`](objectives.md) to
the course material and the teaching week that cover it.

The RH124 and RH134 courseware is **not** part of this repository. I cite only
section numbers, and they refer to version 10.0 of both courses.

- **Objective** is the stable ID from [`objectives.md`](objectives.md), and
  **Summary** restates it in short.
- **RH124** and **RH134** are section numbers in Red Hat System Administration I
  and II (version 10.0). `11.03` means chapter 11, section 03. A dash means that
  course does not teach the objective, and the other course usually does.
- **Week** is the week that teaches the objective, as scheduled in
  [`lessons.md`](lessons.md). More than one week means I teach it across all
  of them.
- Section numbers are per-course and the two courses reuse them, so always read
  a number together with its course. See
  [Notes on the mapping](#notes-on-the-mapping).

## 1. Understand and use essential tools

| Objective | Summary | RH124 | RH134 | Week |
| --- | --- | --- | --- | --- |
| RHCSA-1.1 | Shell prompt and command syntax | 02.01, 02.03, 02.05 | — | 1 |
| RHCSA-1.2 | Input/output redirection | 09.01 | — | 3 |
| RHCSA-1.3 | `grep` and regular expressions | — | 02.01 | 7 |
| RHCSA-1.4 | Remote access using SSH | 19.01 | — | 6 |
| RHCSA-1.5 | Log in and switch users | 10.03 | 12.03 | 3, 10 |
| RHCSA-1.6 | `tar`, `gzip`, `bzip2` | — | 07.01 | 9 |
| RHCSA-1.7 | Create and edit text files | 08.01 | — | 3 |
| RHCSA-1.8 | Create, delete, copy, move files | 06.01, 06.03, 07.01, 07.05, 14.05 | — | 2, 5 |
| RHCSA-1.9 | Hard and soft links | 07.03 | — | 2 |
| RHCSA-1.10 | Standard ugo/rwx permissions | 11.01, 11.03 | — | 4 |
| RHCSA-1.11 | System documentation | 03.01 | — | 2 |

## 2. Manage software

| Objective | Summary | RH124 | RH134 | Week |
| --- | --- | --- | --- | --- |
| RHCSA-2.1 | Configure RPM repository access | 12.05 | — | 4 |
| RHCSA-2.2 | Install and remove RPM packages | 12.01, 12.03 | — | 4 |
| RHCSA-2.3 | Configure Flatpak repository access | 13.01 | — | 4 |
| RHCSA-2.4 | Install and remove Flatpak packages | 13.03 | — | 4 |

## 3. Create simple shell scripts

| Objective | Summary | RH124 | RH134 | Week |
| --- | --- | --- | --- | --- |
| RHCSA-3.1 | Conditional execution | — | 01.05 | 7 |
| RHCSA-3.2 | Looping constructs | — | 01.05 | 7 |
| RHCSA-3.3 | Script inputs (`$1`, `$2`) | — | 01.01, 01.03 | 7 |
| RHCSA-3.4 | Process command output in a script | — | 01.03 | 7 |

## 4. Operate running systems

| Objective | Summary | RH124 | RH134 | Week |
| --- | --- | --- | --- | --- |
| RHCSA-4.1 | Boot, reboot, shut down normally | — | 12.03 | 10 |
| RHCSA-4.2 | Boot into different targets manually | — | 12.03 | 10 |
| RHCSA-4.3 | Interrupt the boot process | — | 12.01, 12.05, 13.01 | 10, 11 |
| RHCSA-4.4 | Identify heavy processes and kill them | 15.01, 15.03, 15.05, 15.07 | — | 5 |
| RHCSA-4.5 | Adjust process scheduling | — | 09.03 | 9 |
| RHCSA-4.6 | Manage tuning profiles | — | 09.01 | 9 |
| RHCSA-4.7 | Locate and interpret logs and journals | — | 05.01, 05.03, 05.05 | 8 |
| RHCSA-4.8 | Preserve system journals | — | 05.07 | 8 |
| RHCSA-4.9 | Start, stop, check network services | 16.01, 16.03 | — | 5 |
| RHCSA-4.10 | Securely transfer files | — | 08.01, 08.03 | 9 |

## 5. Configure local storage

| Objective | Summary | RH124 | RH134 | Week |
| --- | --- | --- | --- | --- |
| RHCSA-5.1 | Partitions on GPT disks | — | 10.01 | 10 |
| RHCSA-5.2 | Create and remove physical volumes | — | 11.01, 11.05 | 10 |
| RHCSA-5.3 | Assign physical volumes to volume groups | — | 11.01 | 10 |
| RHCSA-5.4 | Create and delete logical volumes | — | 11.01 | 10 |
| RHCSA-5.5 | Mount at boot by UUID or label | 14.01 | 10.01 | 5, 10 |
| RHCSA-5.6 | Add partitions, volumes, swap non-destructively | — | 10.03, 11.01 | 10 |

## 6. Create and configure file systems

| Objective | Summary | RH124 | RH134 | Week |
| --- | --- | --- | --- | --- |
| RHCSA-6.1 | VFAT, ext4, XFS file systems | 14.01, 14.03 | 10.01, 12.05 | 5, 10 |
| RHCSA-6.2 | NFS network file systems | — | 15.01 | 11 |
| RHCSA-6.3 | Configure autofs | — | 15.03 | 11 |
| RHCSA-6.4 | Extend existing logical volumes | — | 11.03 | 10 |
| RHCSA-6.5 | Diagnose file permission problems | 11.01, 11.03, 11.05 | — | 4 |

## 7. Deploy, configure, and maintain systems

| Objective | Summary | RH124 | RH134 | Week |
| --- | --- | --- | --- | --- |
| RHCSA-7.1 | `at`, `cron`, systemd timer units | — | 03.01, 03.03, 04.01, 04.03, 04.05 | 7, 8 |
| RHCSA-7.2 | Services, and enabling them at boot | 16.01, 16.03 | — | 5 |
| RHCSA-7.3 | Boot into a specific target automatically | — | 12.03 | 10 |
| RHCSA-7.4 | Configure time service clients | — | 05.09 | 8 |
| RHCSA-7.5 | Install and update from CDN, repo, local file | 04.01, 12.03, 12.05 | — | 2, 4 |
| RHCSA-7.6 | Modify the system bootloader | — | 12.01 | 10 |

## 8. Manage basic networking

| Objective | Summary | RH124 | RH134 | Week |
| --- | --- | --- | --- | --- |
| RHCSA-8.1 | IPv4 and IPv6 addresses | 17.01, 17.03, 18.01, 18.03 | — | 6 |
| RHCSA-8.2 | Hostname resolution | 18.05 | — | 6 |
| RHCSA-8.3 | Network services automatic at boot | 16.01, 16.03 | — | 5 |
| RHCSA-8.4 | Restrict access with `firewalld` | — | 14.01 | 11 |

## 9. Manage users and groups

| Objective | Summary | RH124 | RH134 | Week |
| --- | --- | --- | --- | --- |
| RHCSA-9.1 | Local user accounts | 10.01, 10.05 | — | 3 |
| RHCSA-9.2 | Passwords and password aging | 10.09 | — | 3 |
| RHCSA-9.3 | Local groups and memberships | 10.07 | — | 3 |
| RHCSA-9.4 | Configure privileged access | 10.03 | — | 3 |

## 10. Manage security

| Objective | Summary | RH124 | RH134 | Week |
| --- | --- | --- | --- | --- |
| RHCSA-10.1 | Firewall settings with `firewall-cmd` | — | 14.01 | 11 |
| RHCSA-10.2 | Default file permissions | 11.05 | — | 4 |
| RHCSA-10.3 | Key-based authentication for SSH | 19.03 | — | 6 |
| RHCSA-10.4 | SELinux enforcing and permissive modes | — | 06.01, 06.07 | 9 |
| RHCSA-10.5 | SELinux file and process contexts | — | 06.01, 06.03, 06.07 | 9 |
| RHCSA-10.6 | Restore default file contexts | — | 06.03, 06.07 | 9 |
| RHCSA-10.7 | SELinux port labels | — | 14.03 | 11 |
| RHCSA-10.8 | SELinux Boolean settings | — | 06.05 | 9 |

## Exam practice

Each course closes with a comprehensive review chapter: cumulative labs you work
through unaided. I cite them here, unlike ordinary chapter labs, because they
draw on the whole course, not just the section above them.

The objectives listed are those each lab's stated outcomes exercise. They show
what a lab practises. They do not mean the lab covers those objectives in full.

### RH124

| Section | Summary | Objectives exercised |
| --- | --- | --- |
| 20.01 | Chapter introduction and review guidance | — |
| 20.02 | Manage files, redirect command output, edit text files | RHCSA-1.2, RHCSA-1.7, RHCSA-1.8 |
| 20.03 | Manage users and groups, set permissions, handle CPU-heavy processes | RHCSA-1.10, RHCSA-4.4, RHCSA-9.1, RHCSA-9.3 |
| 20.04 | Secure SSH access, configure repositories, manage packages | RHCSA-1.4, RHCSA-2.1, RHCSA-2.2, RHCSA-10.3 |
| 20.05 | Configure and test networking, set hostnames and name resolution | RHCSA-8.1, RHCSA-8.2 |
| 20.06 | Mount a file system and find files by name, permissions, and size | RHCSA-1.8, RHCSA-6.1 |

### RH134

| Section | Summary | Objectives exercised |
| --- | --- | --- |
| 19.01 | Chapter introduction and review guidance | — |
| 19.02 | Diagnose boot problems, set the default boot target, schedule recurring jobs | RHCSA-4.3, RHCSA-7.1, RHCSA-7.3 |
| 19.03 | Create logical volumes and swap, mount NFS persistently, clear temporary files | RHCSA-5.4, RHCSA-5.6, RHCSA-6.2, RHCSA-7.1 |
| 19.04 | Key-based SSH, firewall settings, SELinux modes, Booleans, and troubleshooting | RHCSA-10.1, RHCSA-10.3, RHCSA-10.4, RHCSA-10.8 |
| 19.05 | Build a container image, push it to a registry, run a detached container | — |

RH134 19.05 exercises no objective, for the same reason RH134 chapters 16 to 18
are absent from the matrix: nothing in
[`objectives.md`](objectives.md) covers containers. Do it after the other four
review labs.

## Adjacent mappings

I map eight sections as close matches, not exact ones. Some teach a
fundamental the objectives assume without ever naming it; others sit between
two objectives without matching either exactly.

| Section | Mapped under |
| --- | --- |
| RH124 06.01 | RHCSA-1.8 |
| RH124 14.05 | RHCSA-1.8 |
| RH124 15.01 | RHCSA-4.4 |
| RH124 15.03 | RHCSA-4.4 |
| RH134 01.01 | RHCSA-3.3 |
| RH134 04.03 | RHCSA-7.1 |
| RH134 06.07 | RHCSA-10.4, RHCSA-10.5, RHCSA-10.6 |
| RH134 12.05 | RHCSA-4.3, RHCSA-6.1 |

These sections support an objective. None of them covers one on its own.

## Course material without an objective

Material that exists in the courses but that no objective calls for. I account
for every teaching section in both courses, either in the matrix above or in
the tables below.

| Course | Teaching sections | Mapped above | Exam practice | Not mapped |
| --- | --- | --- | --- | --- |
| RH124 | 47 | 41 | 1 | 5 |
| RH134 | 49 | 36 | 1 | 12 |

I count only the two chapter introductions as teaching sections. The nine
review labs fall outside that count, because I leave labs out of it throughout.

### No corresponding objective

| Section | Summary |
| --- | --- |
| RH124 01.01 | What Linux, open source, and RHEL are |
| RH124 05.01 | AI-assisted troubleshooting with the command-line assistant |
| RH134 16.01 | Installing RHEL interactively in package mode |
| RH134 16.03 | Automating installation with Kickstart |
| RH134 17.01 | Container concepts and underlying technology |
| RH134 17.03 | Running container images with Podman |
| RH134 17.05 | Managing and building container images |
| RH134 18.01 | Image mode compared with package-mode installation |
| RH134 18.03 | Building bootable container images for image mode |
| RH134 18.05 | Installing RHEL using image mode |
| RH134 18.07 | Day-2 management of image-mode systems |

No objective in [`objectives.md`](objectives.md) mentions installation,
Kickstart, containers, or image mode, so no section of RH134 chapters 16, 17,
or 18 appears in the matrix above. I still teach them, in weeks 11 and 12,
after every chapter that does carry an objective. See
[`lessons.md`](lessons.md#sequencing-notes).

### Course administration

| Section | Summary |
| --- | --- |
| RH124 00.01, RH134 00.01 | Course goals and intended audience |
| RH124 00.02, RH134 00.02 | Classroom environment orientation |
| RH124 00.03, RH134 00.03 | How the lab activity types work |

## Notes on the mapping

RH124 16.01 and RH134 16.01 are unrelated sections. Read every section number
together with its course.

I cite only teaching sections. Guided exercises, quizzes, labs, and chapter
summaries reinforce the section they sit under, so I do not list them
separately. The one exception is the comprehensive review chapter that closes
each course, whose labs are cumulative and appear under
[Exam practice](#exam-practice).

I wrote each **Summary** cell for this file. In the matrix it paraphrases
[`objectives.md`](objectives.md). Further down it paraphrases what a section
says it teaches, not its title.

## Maintaining this file

When the objectives change, I update [`objectives.md`](objectives.md) first,
then add or retire rows here. I keep the **Week** cells in step with
[`lessons.md`](lessons.md). An objective with sections but no week is material
I am not teaching.

Red Hat renumbers sections between course versions. If the courseware moves off
10.0, I recheck every section number here against the new release, not just
the rows whose objectives changed.
