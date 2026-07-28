# RHCSA objective coverage

Maps every RHCSA (EX200) objective from [`objectives.md`](objectives.md) to the
Red Hat course material that teaches it, so gaps in course coverage are visible
at a glance.

## How to read this

- **Objective** — the stable ID from [`objectives.md`](objectives.md).
- **RH124** / **RH134** — section numbers in Red Hat System Administration I and
  II (RHEL 10). `11.03` means chapter 11, section 03.
- **Week** — the ICT257 week that teaches the objective. `—` until the weekly
  notes exist.
- `—` in any column means nothing covers it yet.

Only teaching sections are cited. Guided exercises, quizzes, labs, and chapter
summaries reinforce the section they sit under and are not listed separately.

The RH124 and RH134 courseware is **not** part of this repository. Only section
numbers are cited here, so you will need your own copy of the material to follow
the references.

## 1. Understand and use essential tools

| Objective | Summary | RH124 | RH134 | Week |
| --- | --- | --- | --- | --- |
| RHCSA-1.1 | Shell prompt and command syntax | 02.01, 02.03, 02.05 | — | — |
| RHCSA-1.2 | Input/output redirection | 09.01 | — | — |
| RHCSA-1.3 | `grep` and regular expressions | — | 02.01 | — |
| RHCSA-1.4 | Remote access using SSH | 19.01 | — | — |
| RHCSA-1.5 | Log in and switch users | 10.03 | 12.03 | — |
| RHCSA-1.6 | `tar`, `gzip`, `bzip2` | — | 07.01 | — |
| RHCSA-1.7 | Create and edit text files | 08.01 | — | — |
| RHCSA-1.8 | Create, delete, copy, move files | 06.03, 07.01, 07.05, 14.05 | — | — |
| RHCSA-1.9 | Hard and soft links | 07.03 | — | — |
| RHCSA-1.10 | Standard ugo/rwx permissions | 11.01, 11.03 | — | — |
| RHCSA-1.11 | System documentation | 03.01 | — | — |

## 2. Manage software

| Objective | Summary | RH124 | RH134 | Week |
| --- | --- | --- | --- | --- |
| RHCSA-2.1 | Configure RPM repository access | 12.05 | — | — |
| RHCSA-2.2 | Install and remove RPM packages | 12.01, 12.03 | — | — |
| RHCSA-2.3 | Configure Flatpak repository access | 13.01 | — | — |
| RHCSA-2.4 | Install and remove Flatpak packages | 13.03 | — | — |

## 3. Create simple shell scripts

| Objective | Summary | RH124 | RH134 | Week |
| --- | --- | --- | --- | --- |
| RHCSA-3.1 | Conditional execution | — | 01.05 | — |
| RHCSA-3.2 | Looping constructs | — | 01.05 | — |
| RHCSA-3.3 | Script inputs (`$1`, `$2`) | — | 01.03 | — |
| RHCSA-3.4 | Process command output in a script | — | 01.03 | — |

## 4. Operate running systems

| Objective | Summary | RH124 | RH134 | Week |
| --- | --- | --- | --- | --- |
| RHCSA-4.1 | Boot, reboot, shut down normally | — | 12.03 | — |
| RHCSA-4.2 | Boot into different targets manually | — | 12.03 | — |
| RHCSA-4.3 | Interrupt the boot process | — | 12.01, 12.05, 13.01 | — |
| RHCSA-4.4 | Identify heavy processes and kill them | 15.01, 15.05, 15.07 | — | — |
| RHCSA-4.5 | Adjust process scheduling | — | 09.03 | — |
| RHCSA-4.6 | Manage tuning profiles | — | 09.01 | — |
| RHCSA-4.7 | Locate and interpret logs and journals | — | 05.01, 05.03, 05.05 | — |
| RHCSA-4.8 | Preserve system journals | — | 05.07 | — |
| RHCSA-4.9 | Start, stop, check network services | 16.01, 16.03 | — | — |
| RHCSA-4.10 | Securely transfer files | — | 08.01, 08.03 | — |

## 5. Configure local storage

| Objective | Summary | RH124 | RH134 | Week |
| --- | --- | --- | --- | --- |
| RHCSA-5.1 | Partitions on GPT disks | — | 10.01 | — |
| RHCSA-5.2 | Create and remove physical volumes | — | 11.01, 11.05 | — |
| RHCSA-5.3 | Assign physical volumes to volume groups | — | 11.01 | — |
| RHCSA-5.4 | Create and delete logical volumes | — | 11.01 | — |
| RHCSA-5.5 | Mount at boot by UUID or label | 14.01 | 10.01 | — |
| RHCSA-5.6 | Add partitions, volumes, swap non-destructively | — | 10.03, 11.01 | — |

## 6. Create and configure file systems

| Objective | Summary | RH124 | RH134 | Week |
| --- | --- | --- | --- | --- |
| RHCSA-6.1 | VFAT, ext4, XFS file systems | 14.01, 14.03 | 10.01, 12.05 | — |
| RHCSA-6.2 | NFS network file systems | — | 15.01 | — |
| RHCSA-6.3 | Configure autofs | — | 15.03 | — |
| RHCSA-6.4 | Extend existing logical volumes | — | 11.03 | — |
| RHCSA-6.5 | Diagnose file permission problems | 11.01, 11.03, 11.05 | — | — |

## 7. Deploy, configure, and maintain systems

| Objective | Summary | RH124 | RH134 | Week |
| --- | --- | --- | --- | --- |
| RHCSA-7.1 | `at`, `cron`, systemd timer units | — | 03.01, 03.03, 04.01, 04.03, 04.05 | — |
| RHCSA-7.2 | Services, and enabling them at boot | 16.01, 16.03 | — | — |
| RHCSA-7.3 | Boot into a specific target automatically | — | 12.03 | — |
| RHCSA-7.4 | Configure time service clients | — | 05.09 | — |
| RHCSA-7.5 | Install and update from CDN, repo, local file | 04.01, 12.03, 12.05 | — | — |
| RHCSA-7.6 | Modify the system bootloader | — | 12.01 | — |

## 8. Manage basic networking

| Objective | Summary | RH124 | RH134 | Week |
| --- | --- | --- | --- | --- |
| RHCSA-8.1 | IPv4 and IPv6 addresses | 17.01, 17.03, 18.01, 18.03 | — | — |
| RHCSA-8.2 | Hostname resolution | 18.05 | — | — |
| RHCSA-8.3 | Network services automatic at boot | 16.01, 16.03 | — | — |
| RHCSA-8.4 | Restrict access with `firewalld` | — | 14.01 | — |

## 9. Manage users and groups

| Objective | Summary | RH124 | RH134 | Week |
| --- | --- | --- | --- | --- |
| RHCSA-9.1 | Local user accounts | 10.01, 10.05 | — | — |
| RHCSA-9.2 | Passwords and password aging | 10.09 | — | — |
| RHCSA-9.3 | Local groups and memberships | 10.07 | — | — |
| RHCSA-9.4 | Configure privileged access | 10.03 | — | — |

## 10. Manage security

| Objective | Summary | RH124 | RH134 | Week |
| --- | --- | --- | --- | --- |
| RHCSA-10.1 | Firewall settings with `firewall-cmd` | — | 14.01 | — |
| RHCSA-10.2 | Default file permissions | 11.05 | — | — |
| RHCSA-10.3 | Key-based authentication for SSH | 19.03 | — | — |
| RHCSA-10.4 | SELinux enforcing and permissive modes | — | 06.01, 06.07 | — |
| RHCSA-10.5 | SELinux file and process contexts | — | 06.01, 06.03, 06.07 | — |
| RHCSA-10.6 | Restore default file contexts | — | 06.03, 06.07 | — |
| RHCSA-10.7 | SELinux port labels | — | 14.03 | — |
| RHCSA-10.8 | SELinux Boolean settings | — | 06.05 | — |

## Gaps

Every one of the 62 objectives maps to at least one RH124 or RH134 section, so
there are no uncovered objectives in the source material. The remaining gap is
the **Week** column: no objective is scheduled yet, because the weekly notes do
not exist.

Points to watch when the schedule is built:

- **RHCSA-1.5** and **RHCSA-4.1**–**4.3** are split across both courses, so boot
  targets and user switching need to be taught together rather than in the order
  the courseware presents them.
- **RHCSA-3.1**–**3.4** rest on just two RH134 sections but carry four
  objectives. Scripting will need more practice time than its page count
  suggests.
- **RHCSA-6.5** is a troubleshooting objective assembled from the permissions
  sections rather than taught as its own topic; it needs a dedicated exercise.
- Five sections are mapped as adjacent rather than exact matches: RH124 14.05
  under RHCSA-1.8, RH124 15.01 under RHCSA-4.4, RH134 04.03 under RHCSA-7.1,
  RH134 06.07 under the SELinux objectives, and RH134 12.05 under RHCSA-4.3 and
  RHCSA-6.1. They teach skills the objectives rely on without naming, so treat
  them as supporting rather than sufficient on their own.

## Sections not mapped

Every teaching section in both courses is accounted for below. Guided
exercises, quizzes, labs, and chapter summaries are excluded throughout — they
reinforce the teaching section above them and were never separate mapping
candidates.

| Course | Teaching sections | Mapped above | Not mapped |
| --- | --- | --- | --- |
| RH124 | 47 | 39 | 8 |
| RH134 | 49 | 35 | 14 |

Descriptions below are written from each section's own stated objective, not
from its title.

### Out-of-scope topics

Subject matter with no corresponding RHCSA objective.

| Section | Topic |
| --- | --- |
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

RH134 chapters 16, 17, and 18 are out of scope in their entirety. No objective
in [`objectives.md`](objectives.md) mentions installation, Kickstart,
containers, or image mode.

### Supporting material

Background that the objectives assume but do not test directly.

| Section | Topic |
| --- | --- |
| RH124 01.01 | What Linux, open source, and RHEL are |
| RH124 06.01 | How the file-system hierarchy is organised |
| RH124 15.03 | Foreground and background job control |
| RH134 01.01 | Shell variables and exporting environment variables |

### Course administration

| Section | Topic |
| --- | --- |
| RH124 00.01, RH134 00.01 | Course goals and intended audience |
| RH124 00.02, RH134 00.02 | Classroom environment orientation |
| RH124 00.03, RH134 00.03 | How the lab activity types work |
| RH124 20.01, RH134 19.01 | End-of-course comprehensive review |

## Maintaining this file

When the objectives change, update [`objectives.md`](objectives.md) first, then
add or retire rows here. When a week is written, fill in its **Week** cells —
an objective with sections but no week is material that is not being taught.
