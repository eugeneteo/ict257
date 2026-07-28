# ICT257 lesson plan

Fourteen weeks of teaching, one three-hour session each, covering the RHCSA
(EX200) objectives in [`objectives.md`](objectives.md) using the Red Hat course
material mapped in [`coverage.md`](coverage.md). The exam is sat in week 15,
which has no session. See [Week 15: the exam](#week-15-the-exam).

## How to read this

- **Week** is the teaching week. [`coverage.md`](coverage.md) records the same
  numbers against each objective, so you can look up the schedule from either
  direction.
- **In class** lists the section numbers taught in the session. `11.03` means
  chapter 11, section 03. Section numbers are per-course and the two courses
  reuse them, so always read a number together with its course.
- **Important practice** lists the chapter-end labs and quizzes that go with the
  session. They are not taught in class and they are not marked, but you are
  strongly encouraged to work through them.
- **Objectives** lists the IDs the week covers.
- Focus lines are written for this unit. They are not courseware section titles.

The RH124 and RH134 courseware is **not** part of this repository. Only section
numbers are cited here, so you will need your own copy of the material.

## How the flipped format works

In a conventional class the instructor presents the material and students
practise afterwards on their own. A flipped class swaps the two around. Students
meet the material first by reading it, and the session is spent on the things
that are better with an instructor in the room: seeing commands run on a real
system, asking questions, and getting through the exercises with help to hand.

What this asks of students each week is to read the sections listed under **In
class** before the session. That comes to between 25 and 42 pages a week, apart
from week 14 at 63 pages.

To be plain about it: a student who arrives without having read can still follow
the session, because the teaching covers the main points of every section rather
than assuming them. What they lose is the guided exercises. Ten minutes is
enough to work through an exercise you half recognise, and not enough to meet
the idea for the first time.

## Session format

Each session runs to three hours:

| Part | Time | What happens |
| --- | --- | --- |
| Recap | 15 min | Questions carried over from last week |
| Teaching and demonstration | 90 to 110 min | Main points of each section, shown on a live system |
| Guided exercises | 10 min each | Students work through the exercises in the session |
| Wrap-up | 10 min | Flag next week's pre-reading and the practice to work through |

Guided exercises are the only exercises done in class. They are short, they need
a working system, and they are where most questions surface. There are 72 of
them across the fourteen weeks.

From week 1 students have the command-line assistant (RH124 05.01), so they have
a way to ask questions and troubleshoot between sessions.

## What is not covered in class

Class time covers the teaching sections listed under **In class**, and the
guided exercises that go with them. Everything else in the courseware is left
for students to work through in their own revision.

| Material | Amount | What students should do with it |
| --- | --- | --- |
| The section text itself | 90 sections, 486 pages | Read it before the session. This is the pre-reading the flipped format depends on |
| Chapter-end labs | 22 labs, 134 pages | Work through them during revision. They ask for a result without leading you to it |
| Chapter quizzes | 22 quizzes, 99 pages | Use them to check understanding after a chapter |
| Chapter summaries | 37 summaries, 37 pages | Use them for quick revision |
| Comprehensive review | 12 sections, 9 of them labs, 49 pages | Save for exam preparation. See [Important practice](#important-practice) |
| Course administration sections | 4 sections, 8 pages | Nothing. They orient students to a self-paced Red Hat course, which is not how this unit runs |

RH124 01.01 is covered briefly in week 1. It sets context rather than teaching a
skill, and no objective corresponds to it.

None of this is marked, but the chapter labs and the comprehensive review are
not optional in any sense that matters. They are the only material that asks a
student to reach a result unaided, which is exactly what the exam asks of them.
Work through them. A student who attends every session and skips the labs has
watched the unit rather than done it.

## The schedule

### Weeks 1 to 7: Red Hat System Administration I

| Week | Focus | In class | Important practice | Objectives |
| --- | --- | --- | --- | --- |
| 1 | Getting oriented, the command-line assistant, and the shell | RH124 00.02, 00.03, 01.01, 02.01, 02.03, 02.05, 05.01 | RH124 01.02, 02.02, 02.06, 02.07 | RHCSA-1.1 |
| 2 | Manual pages, registering systems, the file-system hierarchy, and working with files | RH124 03.01, 04.01, 06.01, 06.03, 07.01, 07.03, 07.05 | RH124 03.03, 04.02, 06.02, 06.04, 07.06, 07.07 | RHCSA-1.8, RHCSA-1.9, RHCSA-1.11, RHCSA-7.5 |
| 3 | Editing text, redirecting output, users, and groups | RH124 08.01, 09.01, 10.01, 10.03, 10.05, 10.07, 10.09 | RH124 09.03, 10.02, 10.11 | RHCSA-1.2, RHCSA-1.5, RHCSA-1.7, RHCSA-9.1, RHCSA-9.2, RHCSA-9.3, RHCSA-9.4 |
| 4 | File permissions and RPM packages | RH124 11.01, 11.03, 11.05, 12.01, 12.03, 12.05 | RH124 11.02, 11.07, 12.07 | RHCSA-1.10, RHCSA-2.1, RHCSA-2.2, RHCSA-6.5, RHCSA-7.5, RHCSA-10.2 |
| 5 | Flatpak applications, file systems, and locating files | RH124 13.01, 13.03, 14.01, 14.03, 14.05 | RH124 13.05, 14.02, 14.07 | RHCSA-1.8, RHCSA-2.3, RHCSA-2.4, RHCSA-5.5, RHCSA-6.1 |
| 6 | Processes, system services, and network addressing | RH124 15.01, 15.03, 15.05, 15.07, 16.01, 16.03, 17.01, 17.03 | RH124 15.02, 15.09, 16.05, 17.02 | RHCSA-4.4, RHCSA-4.9, RHCSA-7.2, RHCSA-8.1, RHCSA-8.3 |
| 7 | Network configuration, name resolution, and secure remote access | RH124 18.01, 18.03, 18.05, 19.01, 19.03 | RH124 18.07, 19.05 | RHCSA-1.4, RHCSA-8.1, RHCSA-8.2, RHCSA-10.3 |

### Weeks 8 to 14: Red Hat System Administration II

| Week | Focus | In class | Important practice | Objectives |
| --- | --- | --- | --- | --- |
| 8 | Shell scripts, regular expressions, and scheduled jobs | RH134 01.01, 01.03, 01.05, 02.01, 03.01, 03.03 | RH134 01.07, 02.03, 03.05 | RHCSA-1.3, RHCSA-3.1, RHCSA-3.2, RHCSA-3.3, RHCSA-3.4, RHCSA-7.1 |
| 9 | Recurring jobs, logs, journals, and keeping time | RH134 04.01, 04.03, 04.05, 05.01, 05.03, 05.05, 05.07, 05.09 | RH134 04.07, 05.02, 05.11 | RHCSA-4.7, RHCSA-4.8, RHCSA-7.1, RHCSA-7.4 |
| 10 | SELinux, archives, and secure file transfer | RH134 06.01, 06.03, 06.05, 06.07, 07.01, 08.01, 08.03 | RH134 06.09, 08.05 | RHCSA-1.6, RHCSA-4.10, RHCSA-10.4, RHCSA-10.5, RHCSA-10.6, RHCSA-10.8 |
| 11 | Tuning profiles, scheduling priority, partitions, and swap | RH134 09.01, 09.03, 10.01, 10.03 | RH134 09.05, 10.05 | RHCSA-4.5, RHCSA-4.6, RHCSA-5.1, RHCSA-5.5, RHCSA-5.6, RHCSA-6.1 |
| 12 | Logical volumes, booting, and recovering root access | RH134 11.01, 11.03, 11.05, 12.01, 12.03, 12.05 | RH134 11.06, 11.07, 12.07 | RHCSA-1.5, RHCSA-4.1, RHCSA-4.2, RHCSA-4.3, RHCSA-5.2, RHCSA-5.3, RHCSA-5.4, RHCSA-5.6, RHCSA-6.1, RHCSA-6.4, RHCSA-7.3, RHCSA-7.6 |
| 13 | Boot troubleshooting, firewalls, and network file systems | RH134 13.01, 14.01, 14.03, 15.01, 15.03 | RH134 14.05, 15.05 | RHCSA-4.3, RHCSA-6.2, RHCSA-6.3, RHCSA-8.4, RHCSA-10.1, RHCSA-10.7 |
| 14 | Installation, Kickstart, containers, and image mode | RH134 16.01, 16.03, 17.01, 17.03, 17.05, 18.01, 18.03, 18.05, 18.07 | RH134 16.05, 17.02, 17.07, 18.02 | — |

Week 14 is the tightest session in the schedule, and we may not get through all
three chapters. Work whatever is left over yourself. No RHCSA objective covers
installation, Kickstart, containers, or image mode, so nothing the exam asks for
is lost, but the material is worth knowing.

## Week 15: the exam

There is no session in week 15. Students sit the RHCSA (EX200) exam. Week 14
covers installation, containers and image mode, none of which is examinable, so
the schedule provides no class time for exam revision at all. That work falls
entirely to students.

The comprehensive review is what to revise with. Students work both chapters in
their own time, and no class time is set aside for them. They are the closest
thing in the courseware to the exam, because they ask for a result without
leading you to it. See [Important practice](#important-practice). The chapter labs
listed through the schedule are the next best thing, and the ones from weeks 11
to 13 deserve the most attention: storage, booting, firewalls and network file
systems are both the hardest material in the unit and the least practised,
because they are taught last.

[`objectives.md`](objectives.md#exam-format) records what the exam itself asks
for. Two points from it shape how students should revise. The exam is
performance-based, so configurations must survive a reboot, which means
practising the persistent form of a task rather than the one that works until
you restart. And it is closed book apart from the documentation shipped with the
product, so students should practise finding answers in `man` pages and
`/usr/share/doc` rather than online.

No exam date is recorded here, because candidates sit on different dates.

## Sequencing notes

Chapters are taught in course order, RH124 first and then RH134, with one
exception. RH124 05 is brought forward into week 1, so that students have the
command-line assistant available from the start of the unit and can use it when
they get stuck in their own time.

Teaching in course order means two pairings are given up. Tuning profiles and
scheduling priority (RH134 09) are taught in week 11 rather than beside
processes (RH124 15) in week 6, so objective 4 on running systems is met in
pieces across the unit. And SSH (RH124 19) is taught in week 7, four weeks
before secure file transfer (RH134 08), although both rest on the same service.
Recap at the start of those later sessions is where the connection gets made.

RH124 01.01 in week 1 is covered briefly. It sets context rather than teaching a
skill, and no objective corresponds to it.

RH134 chapters 16 to 18 are taught last, in week 14, because no objective
corresponds to them. Installation, Kickstart, containers and image mode are
worth knowing, but every chapter the exam asks for comes first.

RH124 00.01 and RH134 00.01 to 00.03 are not scheduled. They orient students to
the courseware and the lab environment for a self-paced Red Hat course, which is
not how this unit runs. RH124 00.02 and 00.03 are kept in week 1 because
students need to know how the lab environment and the exercise types work.

## Important practice

Each course closes with a chapter of cumulative labs. Unlike a chapter lab,
these draw on the whole course rather than the chapter above them, which makes
them the closest thing in the courseware to exam conditions. They matter more
than anything else you do outside class, so work through them. No session covers
them, so they are done in your own time, and the weeks below say only when you
have been taught enough to attempt them. See
[Exam practice](coverage.md#exam-practice) for what each lab exercises.

| Taught enough by | Material |
| --- | --- |
| Week 7 | RH124 20.02 to 20.06, five labs covering Red Hat System Administration I |
| Week 13 | RH134 19.02 to 19.04, three labs covering Red Hat System Administration II |
| Week 14 | RH134 19.05, one lab on containers |

RH134 19.05 rests on the container material taught in week 14, and it matches no
current objective, so it is the one review lab that can be skipped when
preparing for the exam.

Both chapters are available before the exam, so week 15 is when they matter
most. See [Week 15: the exam](#week-15-the-exam).

## Maintaining this file

Keep the **Week** column in [`coverage.md`](coverage.md) in step with the
schedule above. If a week moves, both files change together.

If the objectives change, update [`objectives.md`](objectives.md) first, then
[`coverage.md`](coverage.md), then this file. The schedule follows the mapping
rather than the other way round.
