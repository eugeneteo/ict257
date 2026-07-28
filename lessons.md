# ICT257 lesson plan

Fourteen weeks, one three-hour session each, covering the RHCSA (EX200)
objectives in [`objectives.md`](objectives.md) using the Red Hat course material
mapped in [`coverage.md`](coverage.md).

## How to read this

- **Week** is the teaching week. [`coverage.md`](coverage.md) records the same
  numbers against each objective, so you can look up the schedule from either
  direction.
- **In class** lists the section numbers taught in the session. `11.03` means
  chapter 11, section 03. Section numbers are per-course and the two courses
  reuse them, so always read a number together with its course.
- **Optional practice** lists the chapter-end labs and quizzes that go with the
  session. They are not taught and not marked.
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

This unit is flipped out of necessity. It has 42 contact hours, and the two
courses are nominally about 64 hours of instructor-led training between them.
Reading the material aloud in class would use up the time that demonstrations
and exercises need.

What this asks of students each week is to read the sections listed under **In
class** before the session. That comes to about 30 pages a week.

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
| Wrap-up | 10 min | Flag next week's pre-reading and the optional practice |

Guided exercises are the only exercises done in class. They are short, they need
a working system, and they are where most questions surface. There are 65 across
the fourteen weeks.

From week 1 students have the command-line assistant (RH124 05.01), so they have
a way to ask questions and troubleshoot between sessions.

## What is not covered in class

Class time covers the teaching sections listed under **In class**, and the
guided exercises that go with them. Everything else in the courseware is left
for students to work through in their own revision.

| Material | Amount | What students should do with it |
| --- | --- | --- |
| The section text itself | 81 sections, 423 pages | Read it before the session. This is the pre-reading the flipped format depends on |
| Chapter-end labs | 21 labs, 129 pages | Work through them during revision. They ask for a result without leading you to it |
| Chapter quizzes | 19 quizzes, 85 pages | Use them to check understanding after a chapter |
| Chapter summaries | 34 summaries, 34 pages | Use them for quick revision |
| Comprehensive review | 12 sections, 9 of them labs, 49 pages | Save for exam preparation. See [Optional practice](#optional-practice) |
| RH134 chapters 16 to 18 | 23 sections, 114 pages | Nothing. No objective corresponds to them, and they are not examinable |
| Course administration sections | 4 sections, 8 pages | Nothing. They orient students to a self-paced Red Hat course, which is not how this unit runs |

RH124 01.01 is covered briefly in week 1. It sets context rather than teaching a
skill, and no objective corresponds to it.

None of this is marked. It is listed so that students can see exactly what the
course contains and what they are responsible for covering themselves. The
chapter labs and the comprehensive review matter most, because they are the only
material that asks a student to reach a result unaided, which is what the exam
asks of them.

## Why the schedule looks like this

The unit has 42 contact hours. Red Hat System Administration I and II are
nominally about 64 hours of instructor-led training between them, so the
material runs to roughly one and a half times the time available. Three things
close the gap:

1. **Objectives come first.** RH134 chapters 16 to 18 are not taught. They cover
   installation, Kickstart, containers and image mode, and no RHCSA objective
   corresponds to them. See
   [`coverage.md`](coverage.md#course-material-without-an-objective).
2. **Reading moves out of the session.** See
   [How the flipped format works](#how-the-flipped-format-works).
3. **Only guided exercises are done in class.** See
   [What is not covered in class](#what-is-not-covered-in-class).

Weeks were balanced by the length of the sections they contain, which is a rough
proxy for effort rather than a measurement of it. The load works out at about 61
courseware pages a week across a range of 48 to 76. Every week was checked
against the three-hour budget: the heaviest is week 10, with eight guided
exercises taking 80 minutes and leaving 100 minutes to teach.

## The schedule

### Weeks 1 to 8: Red Hat System Administration I

| Week | Focus | In class | Optional practice | Objectives |
| --- | --- | --- | --- | --- |
| 1 | Getting oriented, the command-line assistant, and the shell | RH124 00.02, 00.03, 01.01, 05.01, 02.01, 02.03, 02.05 | RH124 01.02, 02.02, 02.06, 02.07 | RHCSA-1.1 |
| 2 | Manual pages, the file-system hierarchy, and working with files | RH124 03.01, 06.01, 06.03, 07.01, 07.03, 07.05 | RH124 03.03, 06.02, 06.04, 07.06, 07.07 | RHCSA-1.8, RHCSA-1.9, RHCSA-1.11 |
| 3 | Editing text, redirecting output, and file permissions | RH124 08.01, 09.01, 11.01, 11.03, 11.05 | RH124 09.03, 11.02, 11.07 | RHCSA-1.2, RHCSA-1.7, RHCSA-1.10, RHCSA-6.5, RHCSA-10.2 |
| 4 | Users, groups, and privileged access | RH124 10.01, 10.03, 10.05, 10.07, 10.09 | RH124 10.02, 10.11 | RHCSA-1.5, RHCSA-9.1, RHCSA-9.2, RHCSA-9.3, RHCSA-9.4 |
| 5 | Registering systems, repositories, and RPM packages | RH124 04.01, 12.01, 12.03, 12.05 | RH124 04.02, 12.07 | RHCSA-2.1, RHCSA-2.2, RHCSA-7.5 |
| 6 | Flatpak applications, file systems, and locating files | RH124 13.01, 13.03, 14.01, 14.03, 14.05 | RH124 13.05, 14.02, 14.07 | RHCSA-1.8, RHCSA-2.3, RHCSA-2.4, RHCSA-5.5, RHCSA-6.1 |
| 7 | Processes, tuning profiles, and scheduling priority | RH124 15.01, 15.03, 15.05, 15.07, RH134 09.01, 09.03 | RH124 15.02, 15.09, RH134 09.05 | RHCSA-4.4, RHCSA-4.5, RHCSA-4.6 |
| 8 | System services and networking | RH124 16.01, 16.03, 17.01, 17.03, 18.01, 18.03, 18.05 | RH124 16.05, 17.02, 18.07 | RHCSA-4.9, RHCSA-7.2, RHCSA-8.1, RHCSA-8.2, RHCSA-8.3 |

### Weeks 9 to 14: Red Hat System Administration II

| Week | Focus | In class | Optional practice | Objectives |
| --- | --- | --- | --- | --- |
| 9 | Remote access, transferring files, archives, and matching text | RH124 19.01, 19.03, RH134 07.01, 08.01, 08.03, 02.01 | RH124 19.05, RH134 08.05, 02.03 | RHCSA-1.3, RHCSA-1.4, RHCSA-1.6, RHCSA-4.10, RHCSA-10.3 |
| 10 | Shell scripts and scheduled work | RH134 01.01, 01.03, 01.05, 03.01, 03.03, 04.01, 04.03, 04.05 | RH134 01.07, 03.05, 04.07 | RHCSA-3.1, RHCSA-3.2, RHCSA-3.3, RHCSA-3.4, RHCSA-7.1 |
| 11 | Logs, journals, and keeping time | RH134 05.01, 05.03, 05.05, 05.07, 05.09 | RH134 05.02, 05.11 | RHCSA-4.7, RHCSA-4.8, RHCSA-7.4 |
| 12 | SELinux and firewalls | RH134 06.01, 06.03, 06.05, 06.07, 14.01, 14.03 | RH134 06.09, 14.05 | RHCSA-8.4, RHCSA-10.1, RHCSA-10.4, RHCSA-10.5, RHCSA-10.6, RHCSA-10.7, RHCSA-10.8 |
| 13 | Partitions, swap, and logical volumes | RH134 10.01, 10.03, 11.01, 11.03, 11.05 | RH134 10.05, 11.06, 11.07 | RHCSA-5.1, RHCSA-5.2, RHCSA-5.3, RHCSA-5.4, RHCSA-5.5, RHCSA-5.6, RHCSA-6.1, RHCSA-6.4 |
| 14 | Booting, recovering root access, and network file systems | RH134 12.01, 12.03, 12.05, 13.01, 15.01, 15.03 | RH134 12.07, 15.05 | RHCSA-1.5, RHCSA-4.1, RHCSA-4.2, RHCSA-4.3, RHCSA-6.1, RHCSA-6.2, RHCSA-6.3, RHCSA-7.3, RHCSA-7.6 |

All 62 objectives are taught in one of these weeks. Four objectives appear in two
weeks, because the two courses each teach part of them.

## Sequencing notes

Two chapters are taught out of course order, and one week is a deliberate mix:

- **RH134 09 moves forward to week 7**, so tuning profiles and process
  scheduling are taught alongside RH124 15 on processes. Students meet the
  whole of objective 4 on running processes at once.
- **RH124 19 moves back to week 9**, so SSH sits next to secure file transfer in
  RH134 08. Both rest on the same service, and key-based authentication is
  easier to motivate when transfer follows immediately.
- **Week 9 is a consolidation week.** Regular expressions (RH134 02) have no
  natural neighbour in the schedule, so they are taught here.

RH124 01.01 in week 1 is covered briefly. It sets context rather than teaching a
skill, and no objective corresponds to it.

RH124 00.01 and RH134 00.01 to 00.03 are not scheduled. They orient students to
the courseware and the lab environment for a self-paced Red Hat course, which is
not how this unit runs. RH124 00.02 and 00.03 are kept in week 1 because
students need to know how the lab environment and the exercise types work.

## Optional practice

Each course closes with a chapter of cumulative labs. Unlike a chapter lab,
these draw on the whole course rather than the chapter above them, which makes
them the closest thing in the courseware to exam conditions. See
[Exam practice](coverage.md#exam-practice) for what each lab exercises.

| Ready after | Material |
| --- | --- |
| Week 8 | RH124 20.02 to 20.06, five labs covering Red Hat System Administration I |
| Week 14 | RH134 19.02 to 19.05, four labs covering Red Hat System Administration II |

RH134 19.05 covers containers, which are not taught in this unit and match no
current objective.

## Maintaining this file

Keep the **Week** column in [`coverage.md`](coverage.md) in step with the
schedule above. If a week moves, both files change together.

If the objectives change, update [`objectives.md`](objectives.md) first, then
[`coverage.md`](coverage.md), then this file. The schedule follows the mapping
rather than the other way round.
