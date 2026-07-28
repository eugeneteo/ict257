# ICT257 lesson plan

Twelve weeks of teaching, one three-hour session each, covering the RHCSA
(EX200) objectives in [`objectives.md`](objectives.md) using the Red Hat course
material mapped in [`coverage.md`](coverage.md). Week 13 is catch-up, week 14 is
revision, and you sit the exam in week 15. See
[Week 15: the exam](#week-15-the-exam).

The RH124 and RH134 courseware is **not** part of this repository. Only section
numbers are cited here, so you will need your own copy of the material.

## The schedule

**In class** lists the sections taught in the session, and you read them
beforehand. **Important practice** lists the chapter-end labs and quizzes to
work through afterwards. `11.03` means chapter 11, section 03, and the two
courses reuse section numbers, so always read a number together with its course.
Focus lines are written for this unit rather than taken from the courseware.


### Weeks 1 to 6: Red Hat System Administration I

| Week | Focus | In class | Important practice | Objectives |
| --- | --- | --- | --- | --- |
| 1 | Getting oriented, the command-line assistant, and the shell | RH124 00.02, 00.03, 01.01, 02.01, 02.03, 02.05, 05.01 | RH124 01.02, 02.02, 02.06, 02.07 | RHCSA-1.1 |
| 2 | Manual pages, registering systems, the file-system hierarchy, and working with files | RH124 03.01, 04.01, 06.01, 06.03, 07.01, 07.03, 07.05 | RH124 03.03, 04.02, 06.02, 06.04, 07.06, 07.07 | RHCSA-1.8, RHCSA-1.9, RHCSA-1.11, RHCSA-7.5 |
| 3 | Editing text, redirecting output, users, and groups | RH124 08.01, 09.01, 10.01, 10.03, 10.05, 10.07, 10.09 | RH124 09.03, 10.02, 10.11 | RHCSA-1.2, RHCSA-1.5, RHCSA-1.7, RHCSA-9.1, RHCSA-9.2, RHCSA-9.3, RHCSA-9.4 |
| 4 | File permissions, RPM packages, and Flatpak applications | RH124 11.01, 11.03, 11.05, 12.01, 12.03, 12.05, 13.01, 13.03 | RH124 11.02, 11.07, 12.07, 13.05 | RHCSA-1.10, RHCSA-2.1, RHCSA-2.2, RHCSA-2.3, RHCSA-2.4, RHCSA-6.5, RHCSA-7.5, RHCSA-10.2 |
| 5 | File systems, locating files, processes, and system services | RH124 14.01, 14.03, 14.05, 15.01, 15.03, 15.05, 15.07, 16.01, 16.03 | RH124 14.02, 14.07, 15.02, 15.09, 16.05 | RHCSA-1.8, RHCSA-4.4, RHCSA-4.9, RHCSA-5.5, RHCSA-6.1, RHCSA-7.2, RHCSA-8.3 |
| 6 | Network addressing and configuration, name resolution, and secure remote access | RH124 17.01, 17.03, 18.01, 18.03, 18.05, 19.01, 19.03 | RH124 17.02, 18.07, 19.05 | RHCSA-1.4, RHCSA-8.1, RHCSA-8.2, RHCSA-10.3 |

### Weeks 7 to 12: Red Hat System Administration II

| Week | Focus | In class | Important practice | Objectives |
| --- | --- | --- | --- | --- |
| 7 | Shell scripts, regular expressions, and scheduled jobs | RH134 01.01, 01.03, 01.05, 02.01, 03.01, 03.03 | RH134 01.07, 02.03, 03.05 | RHCSA-1.3, RHCSA-3.1, RHCSA-3.2, RHCSA-3.3, RHCSA-3.4, RHCSA-7.1 |
| 8 | Recurring jobs, logs, journals, and keeping time | RH134 04.01, 04.03, 04.05, 05.01, 05.03, 05.05, 05.07, 05.09 | RH134 04.07, 05.02, 05.11 | RHCSA-4.7, RHCSA-4.8, RHCSA-7.1, RHCSA-7.4 |
| 9 | SELinux, archives, secure file transfer, and tuning profiles | RH134 06.01, 06.03, 06.05, 06.07, 07.01, 08.01, 08.03, 09.01, 09.03 | RH134 06.09, 08.05, 09.05 | RHCSA-1.6, RHCSA-4.5, RHCSA-4.6, RHCSA-4.10, RHCSA-10.4, RHCSA-10.5, RHCSA-10.6, RHCSA-10.8 |
| 10 | Partitions, swap, logical volumes, and booting | RH134 10.01, 10.03, 11.01, 11.03, 11.05, 12.01, 12.03, 12.05 | RH134 10.05, 11.06, 11.07, 12.07 | RHCSA-1.5, RHCSA-4.1, RHCSA-4.2, RHCSA-4.3, RHCSA-5.1, RHCSA-5.2, RHCSA-5.3, RHCSA-5.4, RHCSA-5.5, RHCSA-5.6, RHCSA-6.1, RHCSA-6.4, RHCSA-7.3, RHCSA-7.6 |
| 11 | Boot troubleshooting, firewalls, network file systems, and installation | RH134 13.01, 14.01, 14.03, 15.01, 15.03, 16.01, 16.03 | RH134 14.05, 15.05, 16.05 | RHCSA-4.3, RHCSA-6.2, RHCSA-6.3, RHCSA-8.4, RHCSA-10.1, RHCSA-10.7 |
| 12 | Containers and image mode | RH134 17.01, 17.03, 17.05, 18.01, 18.03, 18.05, 18.07 | RH134 17.02, 17.07, 18.02 | — |

### Week 13: catch-up

No new chapters. Sessions run over, and this is where the overflow goes.

If nothing has slipped, the session is yours. Bring the guided exercises you did
not finish, the labs that did not work, and anything you want demonstrated a
second time.

If more has slipped than one session can absorb, work through what is left
yourself. Chapters are taught in order and the ones carrying objectives come
first, so anything that falls off the end is likely to be RH134 16 to 18, which
no objective covers.

### Week 14: revision

No new chapters. The session works back through
[`objectives.md`](objectives.md) and [`coverage.md`](coverage.md) objective by
objective, so you can see what each one asks of you and which week taught it.
Bring the objectives you are least sure of.

Both comprehensive review chapters are open to you by now. If week 12 slipped,
RH134 19.05 is the one review lab that may have to wait, because it rests on the
container material.

## Week 15: the exam

There is no session in week 15. You sit the RHCSA (EX200) exam.

Revise with the comprehensive review, then the chapter labs. See
[Important practice outside class](#important-practice-outside-class). The labs
from weeks 9 to 11 deserve the most attention: SELinux, storage, booting,
firewalls and network file systems are the hardest material in the unit and the
least practised, because they are taught last.

Two points from [`objectives.md`](objectives.md#exam-format) shape how to
revise. The exam is performance-based, so configurations must survive a reboot:
practise the persistent form of a task, not the one that works until you
restart. And it is closed book apart from the documentation shipped with the
product, so practise finding answers in `man` pages and `/usr/share/doc` rather
than online.

## How the sessions work

This unit is flipped. In a conventional class the instructor presents the
material and you practise afterwards on your own. Here it is the other way
round. You meet the material by reading it first, and the session goes on what
is better with an instructor in the room: seeing commands run on a real system,
asking questions, and getting through the exercises with help to hand.

So read the sections listed under **In class** before each session, between 32
and 50 pages a week.

| Part | Time | What happens |
| --- | --- | --- |
| Recap and administrative matters | 15 min | Questions carried over from last week |
| Teaching and demonstration | 90 to 110 min | Main points of each section, shown on a live system |
| Guided exercises | 10 min each | You work through the exercises in the session |
| Wrap-up | 10 min | Next week's pre-reading and the practice to work through |

Guided exercises are the only exercises done in class, and they are where most
questions surface. There are 72 of them across the twelve teaching weeks.

Arrive without having read and you can still follow the session, because the
teaching covers the main points of every section rather than assuming them. What
you lose is the guided exercises. Ten minutes is enough to work through an
exercise you half recognise, and not enough to meet the idea for the first time.

From week 1 you have the command-line assistant (RH124 05.01), so you have a way
to ask questions and troubleshoot between sessions.

## Important practice outside class

Everything the sessions do not cover is yours to work through.

| Material | Amount | What to do with it |
| --- | --- | --- |
| The section text itself | 90 sections, 486 pages | Read it before the session. This is the pre-reading the flipped format depends on |
| Chapter-end labs | 22 labs, 134 pages | Work through them during revision. They ask for a result without leading you to it |
| Chapter quizzes | 22 quizzes, 99 pages | Use them to check understanding after a chapter |
| Chapter summaries | 37 summaries, 37 pages | Use them for quick revision |
| Comprehensive review | 12 sections, 9 of them labs, 49 pages | Save for exam preparation, as below |
| Course administration sections | 4 sections, 8 pages | Nothing. They orient you to a self-paced Red Hat course, which is not how this unit runs |

None of this is marked, and none of it is optional in any sense that matters.
The chapter labs and the comprehensive review are the only material that asks
you to reach a result unaided, which is exactly what the exam asks of you.
Attend every session and skip them, and you have watched the unit rather than
done it.

The comprehensive review matters most. Each course closes with one, and its labs
draw on the whole course rather than the chapter above them, which makes them
the closest thing in the courseware to exam conditions. No session covers them,
so the table below says only when you have been taught enough to attempt them.
See [Exam practice](coverage.md#exam-practice) for what each lab exercises.

| Taught enough by | Material |
| --- | --- |
| Week 6 | RH124 20.02 to 20.06, five labs covering Red Hat System Administration I |
| Week 11 | RH134 19.02 to 19.04, three labs covering Red Hat System Administration II |
| Week 12 | RH134 19.05, one lab on containers |

RH134 19.05 rests on the container material taught in week 12, and it matches no
current objective, so it is the one review lab you can skip when preparing for
the exam.

## Sequencing notes

Chapters are taught in course order, RH124 first and then RH134, with one
exception. RH124 05 is brought forward into week 1, so that you have the
command-line assistant from the start of the unit and can use it when you get
stuck in your own time.

Teaching in course order means two pairings are given up. Tuning profiles and
scheduling priority (RH134 09) are taught in week 11 rather than beside
processes (RH124 15) in week 6, so objective 4 on running systems is met in
pieces across the unit. And SSH (RH124 19) is taught in week 7, four weeks
before secure file transfer (RH134 08), although both rest on the same service.
Recap at the start of those later sessions is where the connection gets made.

RH124 01.01 in week 1 is covered briefly. It sets context rather than teaching a
skill, and no objective corresponds to it.

RH134 chapters 16 to 18 are taught last, in weeks 11 and 12, because no
objective corresponds to them. Installation, Kickstart, containers and image
mode are worth knowing, but every chapter the exam asks for comes first.

RH124 00.01 and RH134 00.01 to 00.03 are not scheduled. They orient you to the
courseware and the lab environment for a self-paced Red Hat course, which is not
how this unit runs. RH124 00.02 and 00.03 are kept in week 1 because you need to
know how the lab environment and the exercise types work.

## Maintaining this file

Keep the **Week** column in [`coverage.md`](coverage.md) in step with the
schedule above. If a week moves, both files change together.

If the objectives change, update [`objectives.md`](objectives.md) first, then
[`coverage.md`](coverage.md), then this file. The schedule follows the mapping
rather than the other way round.
