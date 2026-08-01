# Maintaining this repository

My notes for keeping these files current. Students do not need this file: the
student-facing files carry no upkeep instructions, so the rules live here.

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
renumber one that is already in use, so that older cross-references keep
working.

That is why `coverage.md`, `lessons.md` and any week notes point at the ID, not
the wording. A cross-reference then survives Red Hat rewording or reordering an
objective.

## Checking sources each semester

Red Hat revises the objectives between RHEL major versions and moves training
pages between course versions.

At the start of each semester, re-check:

- The three sources referenced at the end of [`objectives.md`](objectives.md).
- Every link in [`resources.md`](resources.md), whose slugs change more often.
- [`exam-day.md`](exam-day.md). It describes software, so it can go stale
  faster than anything else here. Buttons move and menus get renamed.

Record the new dates in each file.

## Images

Images are blocked from this repository. `.gitignore` refuses five extensions
and `.githooks/excluded-paths` refuses them again, so a forced `git add` still
fails at the commit. That guard exists because screenshots of somebody else's
forum posts nearly went in.

One exception is carved out in `.githooks/allowed-paths`, for `images/*.png`.
That directory holds charts generated from the repository's own files by a
script I keep with my local notes. Run it to rebuild them after changing
`coverage.md`, `lessons.md`, `objectives.md` or `practice.md`.

Nothing else belongs in `images/`. Do not use the exception for screenshots of
somebody else's work.

Each chart is rendered light and dark, and embedded with a `picture` element so
GitHub picks the right one. After rebuilding them, check the `alt` text in
`README.md`. Write it as the finding, not the file name.

## How citations work

A citation is a `<sup>` tag wrapping a reference-style link, so the reader sees
a superscript number that goes straight to the source:

```markdown
...published exam page.<sup>[1][ex200]</sup>
```

Each URL is defined once at the foot of the file, under `## References`. It is
used in the numbered entry that carries the title and the retrieval date, and
again in every superscript that cites it. `objectives.md` cites one page five
times this way. The same label can also link a name in running text, as
`practice.md` does with the Red Hat Learning Community.

```markdown
[ex200]: https://www.redhat.com/en/services/training/ex200-...

1. Red Hat, ["Red Hat Certified System Administrator exam | EX200"][ex200].
   Retrieved 2026-07-28.
```

Nothing renumbers the markers for me. Adding a source in the middle means
renumbering every one after it, so check that each number still matches its
entry.

The `<sup>` tag renders a superscript numeral. Put it after the full stop.

Verify a change by posting the file to `https://api.github.com/markdown` with
mode `markdown`, and read the HTML back. Use that mode and not `gfm`. Both
render tables, but `gfm` is the mode for comments, and it turns every wrapped
line into a `<br>`. Files in a repository reflow normally, so `gfm` will show
you line breaks that are not really there and send you chasing them.

## Tagging a semester

Tag at the start of a semester, not the end. What a student wants is the state
the material was in when their semester began.

The schedule in `lessons.md` is the reason this matters. I fine-tune it as I
teach, to match what actually happens in the room, so it drifts through the
semester by design. The tag holds what students were told in week 1, and `main`
holds what turned out to be true. Prefer changing weeks not yet taught. Do not
rewrite a week after it has been taught.

Do the source checks above first and commit them. Then:

    git switch main
    git tag -a 2026-s2 -m "ICT257, 2026 semester 2"
    git push origin 2026-s2

Watch for failures that Git does not report clearly:

- `git push` on its own does not push tags. Name the tag, or it never leaves
  this machine.
- Use `-a`. An annotated tag records who made it, when and why, as a real
  object. A bare `git tag 2026-s2` records none of that.
- Do not move a tag once students have cloned it. If the name is wrong, add the
  right one and leave the wrong one where it is.

## Licence

CC BY-SA 4.0.

The `README.md` notice carves out Red Hat's material, and that carve-out has to
keep pace if more of it lands here.

Handle the public exam page and the licensed courseware differently:

- **The exam page is public.** The 62 objective rows, the reboot blockquote
  and the page titles in the references all come from it. They are quoted word
  for word and cited with a retrieval date, so they cannot go under my
  licence.
- **The courseware is not.** These files use section numbers and summaries I
  wrote myself. They must not reproduce courseware wording.

Keep week notes to my own teaching advice and references. Do not reproduce a
chapter.

## One branch, and when to break that rule

Everything lives on `main`. There are no semester branches, because there is
nothing semester-specific to put in one. `lessons.md` runs on week numbers, not
dates, so the same material serves every cohort.

That holds only while the repository stays generic. Dated announcements,
deadlines and anything naming a cohort belong in the LMS because this
repository is public. The moment that material lands in a tracked file, one
branch stops being enough.

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

I requested each Red Hat link in [`resources.md`](resources.md) and checked
its title against the page.

One link on that page is left out on purpose. Red Hat's hybrid cloud learning
hub sits there, so it looks like an obvious inclusion, but it carries
OpenShift, Kubernetes and AI material and nothing for the RHCSA. Leave it out.

Red Hat's "Introducing Red Hat Enterprise Linux 10" playlist is left out for
the same reason, and for a second one. Nineteen videos, none of them a task
walkthrough, and six of them about Lightspeed. `objectives.md` warns that the
command line assistant is absent from the exam, so putting a playlist that
sells it in front of students would argue against our own warning. Leave it
out, and do not name it in a student file either. Naming a resource in order
to warn students off it gives it attention it has not earned.

If an automated check is blocked by the RHEL documentation or SUSS module
page, check the same link in a browser before changing it.

The `learning.oreilly.com` links answer 403 for a different reason. They sit
behind institutional sign-in, so a script never gets past the login. The SUSS
Library page that explains the access does answer 200. The details for both
titles come from the publisher: Sander van Vugt, Pearson IT Certification, a
cert guide and a video series. Nothing outside the subscription can confirm the
chapter and lesson URLs, so check those from a signed-in browser each semester.

Check the running time of the video series at the same time. `resources.md`
says about 15 hours. No public page states a duration for that ISBN, and the
nearest third-party figures for comparable bundles run lower, so the number
cannot be confirmed from outside the subscription. It is the one claim on that
page that rests on nothing a reader can check.

## Where prose sits around a table in resources.md

Prose that frames a section goes before its table. Prose that comments on an
entry goes after, because it refers back to one.

The test is whether the sentence parses on its own. "The SUSS Library gives you
O'Reilly for Higher Education" does, so it opens the section. "Take it early.
It shows you where you are" does not, because "it" is the skills assessment in
the row above.

Some sections open with the table. Those are the ones with nothing to frame.
Adding a sentence to them for the sake of symmetry would mean writing filler.

## Local files

A verification script kept with my local notes checks `practice.md` and
`hints.md`. Run it after editing either one. It enforces the width and style
rules, refuses any wording taken from the courseware, and refuses a command, an
option or a shell prompt reaching `hints.md`, which must point a student at the
material without working for them.

Anything I do not want committed or pushed goes in the two ignored directories
named in `.gitignore`. The `.githooks/` pre-commit and pre-push guards refuse
them even if I force-add them.

The guards protect me and nobody else. `core.hooksPath` lives in `.git/config`,
which does not survive a clone, so a student who clones this gets `.githooks/`
as files that git never runs. That is fine, because students are not pushing
anything. It is why the README tells them about `my-notes/` and says nothing
about hooks: `.gitignore` is what actually keeps their notes out of a commit,
and `.gitignore` does travel.

Since this repository is public, that matters more than it would otherwise.
Notes committed here are notes published.
