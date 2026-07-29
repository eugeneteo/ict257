# Maintaining this repository

My notes for keeping these files current. Students do not need this file: the
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

## How citations work

A citation is a `<sup>` tag wrapping a reference-style link, so the reader sees
a superscript number that goes straight to the source:

```markdown
...published exam page.<sup>[1][ex200]</sup>
```

Each URL is defined once at the foot of the file, under `## References`, and
used twice: in the superscript and in the numbered entry that carries the title
and the retrieval date.

```markdown
[ex200]: https://www.redhat.com/en/services/training/ex200-...

1. Red Hat, ["Red Hat Certified System Administrator exam | EX200"][ex200].
   Retrieved 2026-07-28.
```

Nothing renumbers the markers for me. Adding a source in the middle means
renumbering every one after it, so check that each number still matches its
entry.

Marker placement goes after the punctuation, and the source is misleading about
this. In the raw file `page.[1][ex200]` looks like a bracketed citation sitting
after the period, which would be wrong. Those brackets are link syntax and
never reach the page. What renders is a bare superscript numeral.

That decides the rule. Bracketed numbers on the line go before the full stop.
Superscript numerals go after it. This is a superscript, so it goes after.
Resist correcting it back.

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
holds what turned out to be true. Prefer changing weeks not yet taught.
Rewriting a week students have already sat through helps nobody.

Do the source checks above first and commit them. Then:

    git switch main
    git tag -a 2026-s2 -m "ICT257, 2026 semester 2"
    git push origin 2026-s2

Three things that fail quietly:

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

There are two kinds, handled differently, and the difference is the whole reason
this is safe to publish:

- **The exam page is public.** The 62 objective rows, the reboot blockquote
  and the page titles in the references all come from it. They are quoted word
  for word and cited with a retrieval date, so they cannot go under my
  licence.
- **The courseware is not.** Nothing from RH124 or RH134 appears here. Only
  section numbers, and summaries I wrote myself.

Hold that line in the week notes, because that is where it would slip. A note on
chapter 11 can say what to watch for, what to read next and where students trip
up. It cannot reproduce the chapter.

## One branch, and when to break that rule

Everything lives on `main`. There are no semester branches, because there is
nothing semester-specific to put in one. `lessons.md` runs on week numbers, not
dates, so the same material serves every cohort.

That holds only while the repository stays generic. Dated announcements,
deadlines and anything naming a cohort belong in the LMS. This is a public
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

I did not guess the links in [`resources.md`](resources.md). I took most from
the markup of the EX200 exam page, so they are Red Hat's own view of what is
relevant. I requested each one, and every title is the page's own title
element, not a description I wrote.

Some links answer 403 to a script while loading fine in a browser: the RHEL
documentation on `docs.redhat.com`, and the SUSS course page in `README.md`.
That is bot protection. A link checker will flag them, and there is nothing to
fix.

The `learning.oreilly.com` links answer 403 for a different reason. They sit
behind institutional sign-in, so a script never gets past the login. The SUSS
Library page that explains the access does answer 200. The details for both
titles come from the publisher: Sander van Vugt, Pearson IT Certification, a
cert guide and a video course. Nothing outside the subscription can confirm the
chapter and lesson URLs, so check those from a signed-in browser each semester.

## Local files

Anything I do not want committed or pushed goes in `.private/` or `my-notes/`.
Both are gitignored, and the `.githooks/` pre-commit and pre-push guards refuse
them even if I force-add them.

The guards protect me and nobody else. `core.hooksPath` lives in `.git/config`,
which does not survive a clone, so a student who clones this gets `.githooks/`
as files that git never runs. That is fine, because students are not pushing
anything. It is why the README tells them about `my-notes/` and says nothing
about hooks: `.gitignore` is what actually keeps their notes out of a commit,
and `.gitignore` does travel.

Since this repository is public, that matters more than it would otherwise.
Notes committed here are notes published.
