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

## Tagging a semester

Tag at the start of a semester, not the end. What a student wants is the state
the material was in when their semester began.

Do the source checks above first and commit them. Then:

    git switch main
    git tag -a 2026-s2 -m "ICT257, 2026 semester 2"
    git push origin 2026-s2

Three things that fail quietly:

- `git push` on its own doesn't push tags. Name the tag, or it never leaves
  this machine.
- Use `-a`. An annotated tag records who made it, when, and why, as a real
  object. A bare `git tag 2026-s2` records none of that.
- Don't move a tag once students have cloned it. If the name is wrong, add the
  right one and leave the wrong one where it is.

## Licence

CC BY-SA 4.0. I considered GPL-3.0 and rejected it: its operative terms are
about source code, object code, compiling, and linking, and none of that fits a
repository of prose. CC BY-SA carries the same copyleft intent and is written
for written work.

The `README.md` notice carves out Red Hat's material. The 62 objective rows,
the blockquote about configurations persisting after reboot, and the page titles
in the footnotes are quoted, not mine, so they can't be sublicensed under my
licence. If more quoted material lands here, the carve-out has to keep pace.

## One branch, and when to break that rule

Everything lives on `main`. There are no semester branches, because there's
nothing semester-specific to put in one. `lessons.md` runs on week numbers, not
dates, so the same material serves every cohort.

That holds only while the repository stays generic. Dated announcements,
deadlines, and anything naming a cohort belong in the LMS. This is a public
repository, which settles it: that material has no business here anyway. The
moment it lands in a tracked file, one branch stops being enough.

Break the rule only if Red Hat forces a disruptive change mid-semester, such as
renumbering courseware while a cohort is halfway through it:

    git switch -c 2026-s2-fixes 2026-s2

Corrections only, and delete it after week 15.

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

The guards protect me and nobody else. `core.hooksPath` lives in `.git/config`,
which doesn't survive a clone, so a student who clones this gets `.githooks/` as
files that git never runs. That's fine, because students aren't pushing
anything. It's why the README tells them about `my-notes/` and says nothing
about hooks: `.gitignore` is what actually keeps their notes out of a commit,
and `.gitignore` does travel.

Since this repository is public, that matters more than it would otherwise.
Notes committed here are notes published.
