# Additional resources for the RHCSA exam

The first sections use Red Hat pages. The practice exams come through the SUSS
Library. None of it is required for ICT257, and none of it replaces the work
in [`lessons.md`](lessons.md).

## Know what the exam asks

These describe the exam. Familiarise yourself with the exam environment by
reviewing [`exam-day.md`](exam-day.md).

| Page | What it is |
| --- | --- |
| [Red Hat Certified System Administrator exam \| EX200](https://www.redhat.com/en/services/training/ex200-red-hat-certified-system-administrator-rhcsa-exam) | The exam page: objectives, audience and format. This is the page [`objectives.md`](objectives.md) quotes |
| [Red Hat Certified System Administrator](https://www.redhat.com/en/services/certification/rhcsa) | The certification itself, and what holding it means |
| [Why you should get certified by Red Hat](https://www.redhat.com/en/services/training-and-certification/why-get-certified) | How Red Hat describes performance-based testing |

[`objectives.md`](objectives.md) already lists all 62 exam objectives with
stable IDs, and [`coverage.md`](coverage.md) maps each one to the material
that teaches it.

## Check where you stand

| Page | What it is |
| --- | --- |
| [Red Hat Skills Assessment](https://www.redhat.com/en/services/skills-assessment) | Red Hat offers this at no cost on the EX200 page, as a way to find the right course |

Take it early. It shows you where you are while there is still time to act.

## Prepare the way Red Hat advises

| Page | What it is |
| --- | --- |
| [Top 8 tips for passing a Red Hat Certification exam][cert-tips] | Randy Russell, Director of Certification at Red Hat. Under five minutes |

Watch it before you plan your revision. You are ready when you can complete the
labs unassisted and with no notes open. That is what
[`practice.md`](practice.md) is for, and [`hints.md`](hints.md) is there for
when you stall. He also says the exam leaves the manual pages and the product
documentation in place, so knowing where to look beats memorising
syntax.<sup>[1][cert-tips]</sup> That is RHCSA-1.11. Practise the lookup on the
machine you are working on, because the manual pages are there in the
examination and this page is not. He tells you to read the exam objectives
and map them onto your training. [`objectives.md`](objectives.md) and
[`coverage.md`](coverage.md) have that mapping done for you. His last tips cover
rest, reserving time to check your work and moving on from a task that stalls
you. Read those beside [`exam-day.md`](exam-day.md).

One tip has gone stale. He points self-study learners at the Red Hat Learning
Community, which closed on 31 March 2026.<sup>[2][rhlc]</sup> Ignore that one
and prepare with the people in your own cohort.

## Reference while you work

| Page | What it is |
| --- | --- |
| [Red Hat Enterprise Linux 10 product documentation](https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/10) | The official RHEL 10 documentation set, free to read without an account |
| [Red Hat Enterprise Linux 10 cheat sheet][rhel10-cheat-sheet] | A one-page reference. Its essential commands section is the part that serves this module |

Use this set while you study. Red Hat says documentation that ships with the
product is available for most exams, but does not promise it for the RHCSA.
Practising with official documentation supports RHCSA-1.11. See
[Exam format](objectives.md#exam-format).

The cheat sheet is worth having for its command section alone. Keep that part
by the keyboard while you practise. Its other sections cover image builder, the
web console, bootc containers and RHEL under the Windows Subsystem for
Linux.<sup>[3][rhel10-cheat-sheet]</sup> The RHCSA tests none of that, and none
of it belongs in your revision. Read those sections for interest in RHEL beyond
the exam. Downloading the PDF sends you to a Red Hat login, so it needs a free
Red Hat Developer account.

## Practise with exam questions

The SUSS Library gives you O'Reilly for Higher Education. Sign in with your
student account, then open the titles below. Neither is published by Red Hat
and neither is part of the courseware. Both are by the same author.

Use all of these exam practices to test yourself, but **focus on learning
using the RH124 and RH134 official courseware from Red Hat Academy**. Working
from several explanations of the same thing will confuse you more than it
helps.

| Page | What it is |
| --- | --- |
| [O'Reilly for Higher Education through SUSS Library](https://libanswers.suss.edu.sg/faq/272677) | How to sign in with your student account |

### Four practice exams in the cert guide

| Page | What it is |
| --- | --- |
| [Red Hat RHCSA 10 Cert Guide: EX200](https://learning.oreilly.com/library/view/red-hat-rhcsa/9780135576625/) | Sander van Vugt, Pearson IT Certification. Written for EX200 on RHEL 10 |
| [Part V: RHCSA Practice Exams](https://learning.oreilly.com/library/view/red-hat-rhcsa/9780135576625/part05.xhtml) | Practice exams A and B |
| [RHCSA Practice Exam C](https://learning.oreilly.com/library/view/red-hat-rhcsa/9780135576625/exam03.xhtml) | The third practice exam |
| [RHCSA Practice Exam D](https://learning.oreilly.com/library/view/red-hat-rhcsa/9780135576625/exam04.xhtml) | The fourth practice exam |

### A sample exam on video, with the solutions worked through

| Page | What it is |
| --- | --- |
| [Red Hat RHCSA RHEL 10 with Exam Labs](https://learning.oreilly.com/course/red-hat-rhcsa/9780135493137/) | Sander van Vugt, Pearson IT Certification. A video series, about 15 hours |

The publisher says the final part contains a sample exam, followed by its
grading and solutions. Find that part from the contents after you
sign in.

Whichever you choose, sit it timed and closed book, and do it after the
comprehensive review labs. See
[Week 14: revision](lessons.md#week-14-revision).

## References

[cert-tips]: https://youtu.be/CJ7ST_BekFI
[rhlc]: https://access.redhat.com/community/learn
[rhel10-cheat-sheet]: https://developers.redhat.com/cheat-sheets/red-hat-enterprise-linux-10-cheat-sheet

1. Red Hat, ["Top 8 tips for passing a Red Hat Certification exam"][cert-tips],
   on Red Hat's YouTube channel. Randy Russell, Director of Certification at
   Red Hat. Retrieved 2026-08-01.

2. Red Hat, ["Red Hat Training & Certification"][rhlc], on the Red Hat Customer
   Portal, which records the closure of the Red Hat Learning Community.
   Retrieved 2026-08-01.

3. Red Hat, ["Red Hat Enterprise Linux 10 cheat sheet | Red Hat
   Developer"][rhel10-cheat-sheet]. Retrieved 2026-08-01.
