# Free Red Hat resources for the RHCSA

Everything here is published by Red Hat and costs nothing to use. None of it is
required for the unit, and none of it replaces the work in
[`lessons.md`](lessons.md). It is here for when you want more than the courseware
gives you.

Each entry gives the page title as Red Hat publishes it. See
[How these links were checked](#how-these-links-were-checked) for how that was
confirmed, and [What is not here](#what-is-not-here) for what was left out.

## Know what the exam asks

These describe the exam. They do not teach it.

| Page | What it is |
| --- | --- |
| [Red Hat Certified System Administrator exam \| EX200](https://www.redhat.com/en/services/training/ex200-red-hat-certified-system-administrator-rhcsa-exam) | The exam page: objectives, audience, and format. This is the page [`objectives.md`](objectives.md) quotes |
| [Red Hat Certified System Administrator](https://www.redhat.com/en/services/certification/rhcsa) | The certification itself, and what holding it means |
| [Why you should get certified by Red Hat](https://www.redhat.com/en/services/training-and-certification/why-get-certified) | How Red Hat describes performance-based testing |

You do not need these to know the objectives.
[`objectives.md`](objectives.md) already lists all 62 with stable IDs, and
[`coverage.md`](coverage.md) maps each one to the material that teaches it.

## Check where you stand

| Page | What it is |
| --- | --- |
| [Red Hat Skills Assessment](https://www.redhat.com/en/services/skills-assessment) | Red Hat offers this at no cost on the EX200 page, as a way to find the right course |

Take it early. It tells you where you are while there is still time to act on
the answer.

## Reference while you work

| Page | What it is |
| --- | --- |
| [Red Hat Enterprise Linux 10 product documentation](https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/10) | The official RHEL 10 documentation set, free to read without an account |

This is worth more than it looks. The same documentation ships with the product,
and product documentation is what you are allowed during the exam. Practising
with it is practising RHCSA-1.11, and it is the habit that replaces searching
online. See [Exam format](objectives.md#exam-format) for what you may and may
not use.

## Get a system to practise on

The exam is performance-based, so reading is not enough. You need a machine you
can break and rebuild.

| Page | What it is |
| --- | --- |
| [Red Hat Enterprise Linux \| Product trial](https://www.redhat.com/en/technologies/linux-platforms/enterprise-linux/try-it) | Red Hat's trial of RHEL itself |
| [Red Hat Learning Subscription \| Product Trial](https://www.redhat.com/en/services/training/learning-subscription/trial) | Red Hat's catalogue lists this trial as costing nothing |

Both are trials, so they run for a limited time and the terms are Red Hat's to
change. Check the current terms on the page before you rely on either. Start a
trial when you have time to use it, not in week 1.

Run RHEL in a virtual machine, and snapshot before each exercise. Being able to
break something and roll back is the reason to have your own system, not a
shared one.

## What is not here

Red Hat's courses are commercial products, so RH124, RH134, RH199, the Learning
Subscription itself, and Red Hat Academy are all left out. Your access to the
courseware is arranged through the unit. This page is only for what you can
reach on your own at no cost.

Red Hat's hybrid cloud learning hub is linked from the exam page, so it looked
like an obvious inclusion. It carries OpenShift, Kubernetes and AI material and
nothing for the RHCSA, so it is out.

Red Hat's developer site offers RHEL downloads, and a no-cost developer
subscription is the usual way people build a home lab. It is not listed here
because I could not confirm the current terms from the page itself, and this
page does not call something free without checking. If you find it, read the
terms yourself.

## How these links were checked

Checked on 2026-07-29. Every title above is the page's own title as published,
not a description written here.

Most of these links were taken from the markup of the EX200 exam page, so they
are Red Hat's own choices about what is relevant, not mine. Each was then
requested individually, and every page on `www.redhat.com` returned HTTP 200.

The documentation link sits on `docs.redhat.com`, which refuses scripted
requests and answers 403. That is bot protection and not a broken link: the page
returns normally in a browser, and it was confirmed through a second fetcher. If
you check that link with a script and see 403, that is why.

## Maintaining this file

Red Hat moves training pages between course versions, and slugs change. I
re-check every link here at the start of each semester, at the same time as the
sources in [`objectives.md`](objectives.md), and record the new date above.
