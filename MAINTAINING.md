# Maintaining this repository

My notes for keeping these files current. Students don't need this file: the
five study files carry no upkeep instructions, so the rules live here.

## The order of changes

Change the files in this order:

1. [`objectives.md`](objectives.md), because everything else points at it.
2. [`coverage.md`](coverage.md), adding or retiring rows to match.
3. [`lessons.md`](lessons.md), moving weeks if the mapping moved.

The schedule follows the mapping. If a week moves, update `coverage.md` and
`lessons.md` together, so the **Week** cells still match the schedule.

An objective with sections but no week is material I'm not teaching. Chase it
down.

## Objective IDs

IDs are stable. Add new ones and retire old ones. Never reuse an ID, and never
renumber one that's already in use, so that older cross-references keep
working.

That's why `coverage.md`, `lessons.md`, and any week notes point at the ID, not
the wording. A cross-reference then survives Red Hat rewording or reordering an
objective.

## Checking sources each semester

Red Hat revises the objectives between RHEL major versions and moves training
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

## How I verified the resource links

I didn't guess the links in [`resources.md`](resources.md). I took most from
the markup of the EX200 exam page, so they're Red Hat's own view of what's
relevant. I requested each one, and every title is the page's own title
element, not a description I wrote.

Every page on `www.redhat.com` returned HTTP 200.

The RHEL documentation link sits on `docs.redhat.com`, which refuses scripted
requests and answers 403. That's bot protection and not a broken link. The page
loads normally in a browser, and I confirmed it through a second fetcher. If a
link checker reports 403 on that host, that's why, and there's nothing to fix.

The SUSS course page linked from `README.md` behaves the same way. It sits
behind Cloudflare, so it answers 403 to a script while loading normally in a
browser.

The same applies to `developers.redhat.com`, whose terms I couldn't confirm
from the page. That no longer matters: `resources.md` doesn't cover building a
system to practise on, because students use the Red Hat Academy lab the
university provides. If that changes, check the terms before calling anything
free.

## Local files

Anything I don't want committed or pushed goes in `.private/` or `my-notes/`.
Both are gitignored, and the `.githooks/` pre-commit and pre-push guards refuse
them even if I force-add them.

This note used to sit in `README.md`. I moved it here because `.private/` is my
own scratch space today, and the README should hold nothing a student can't
use. When I work out the branching that lets students clone the repository and
keep their own notes, this belongs back in the README, rewritten for them.
