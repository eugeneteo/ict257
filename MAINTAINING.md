# Maintaining this repository

Notes for whoever keeps these files current. Nothing here is study material, and
students don't need to read it. The four study files hold no upkeep
instructions, so this is the only place these rules live.

## The order of changes

Change the files in this order:

1. [`objectives.md`](objectives.md), because everything else points at it.
2. [`coverage.md`](coverage.md), adding or retiring rows to match.
3. [`lessons.md`](lessons.md), moving weeks if the mapping moved.

The schedule follows the mapping. The mapping doesn't follow the schedule. If a
week moves, `coverage.md` and `lessons.md` change together, because the **Week**
cells in one have to agree with the schedule in the other.

An objective with sections but no week is material nobody is teaching. Notice
it, don't leave it.

## Objective IDs

IDs are stable. Add new ones and retire old ones. Never reuse an ID, and never
renumber one that's already in use, so that older cross-references keep
working.

This is why `coverage.md`, `lessons.md` and any week notes point at the ID
instead of the wording. A cross-reference survives Red Hat rewording or
reordering an objective.

## Checking sources each semester

Red Hat revises the objectives between RHEL major versions, and moves training
pages between course versions.

At the start of each semester, re-check:

- The three sources footnoted at the end of [`objectives.md`](objectives.md).
- Every link in [`resources.md`](resources.md), whose slugs change more often.
- [`exam-day.md`](exam-day.md). It describes software, so it can go stale
  faster than anything else here. Buttons move and menus get renamed.

Record the new dates in each file.

## When the courseware version changes

`coverage.md` and `lessons.md` cite RH124 and RH134 section numbers, currently
version 10.0 of both courses. Red Hat renumbers sections between course
versions. If the courseware moves off 10.0, recheck every section number against
the new release, not only the rows whose objectives changed.

## How the resource links were verified

The links in [`resources.md`](resources.md) weren't guessed. Most were taken
from the markup of the EX200 exam page, so they are Red Hat's own view of what
is relevant. Each was then requested individually, and every title recorded is
the page's own title element, not a description written for the file.

Every page on `www.redhat.com` returned HTTP 200.

The RHEL documentation link sits on `docs.redhat.com`, which refuses scripted
requests and answers 403. That's bot protection and not a broken link. The page
returns normally in a browser, and it was confirmed through a second fetcher. If
a link checker reports 403 on that host, that's why, and it isn't a fault to
fix.

The same host behaviour applies to `developers.redhat.com`, whose terms could
not be confirmed from the page. It's moot now: `resources.md` no longer covers
building a system to practise on, because students practise in the Red Hat
Academy lab environment the university provides. If that ever changes, the terms
still need checking before the page calls anything free.
