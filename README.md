# ICT257: Red Hat System Administration

Course material and notes for
[ICT257 Red Hat System Administration](https://www.suss.edu.sg/courses/detail/ict257),
at the Singapore University of Social Sciences.

## Contents

| Path | What's in it |
| --- | --- |
| [`objectives.md`](objectives.md) | RHCSA (EX200) exam objectives, with stable IDs |
| [`coverage.md`](coverage.md) | Which course material covers each objective |
| [`lessons.md`](lessons.md) | Twelve weeks of teaching, then catch-up, revision, and the exam |
| [`resources.md`](resources.md) | Free Red Hat resources for preparing beyond the courseware |
| [`exam-day.md`](exam-day.md) | What the exam environment is like on the day |

I'll add more as the semester goes on.

## Getting the material

    git clone https://github.com/eugeneteo/ict257.git
    cd ict257

Run `git pull` now and then. I fix links and update the exam-day notes as
things change, and you want those.

Keep your own notes in `my-notes/`. Git ignores that folder, so nothing you
write there gets committed, and `git pull` will never touch it.

Don't edit the files listed above. If you do, `git pull` stops working and
tells you your local changes would be overwritten.

Each semester starts with a tag. To read the material as it stood at the start
of yours:

    git checkout 2026-s2

`git switch main` brings you back to the current version.
