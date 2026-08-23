# Streams and redirection in a pipeline

These examples supplement RH124 chapter 9, section 1 (piping and redirection). That is RHCSA-1.2.

## What you will learn

Every command has three streams: standard input (0), standard output (1), and standard error (2). Understanding how these streams work in pipelines helps you redirect output correctly and avoid common mistakes.

```
[student@workstation ~]$ cat file.txt | sort | uniq
```

Standard output of `cat` becomes standard input of `sort`. Standard output of
`sort` becomes standard input of `uniq`. Standard output of `uniq` has nothing
after it, so it arrives on your terminal.

Two things that example is worth knowing about before you rely on it.

The order is not arbitrary. `uniq` collapses repeated lines only when they sit
next to each other, so it removes nothing useful until the input is sorted.
That is the whole reason `sort` comes first.

And neither course teaches `uniq`. It appears nowhere in RH124 or RH134, and
`sort` turns up only in passing, in a pipeline in RH124 chapter 12 and as an
option to `ps`. So take the shape of this and not the tools. No exam task will
ask you for `uniq`, and if you go hunting for it in the courseware you will not
find it.

What carries over is the numbering. Stream 1 flows to the next command in a
pipeline, and it is the same stream 1 that `>` sends to a file. Stream 2 does
neither of those things unless you say so, which is the next section.

## Sending both streams to the same file

A command writes on two streams and redirection moves one of them. Hand `sed`
two file names, one that exists and one that does not, and it uses both. What
it manages to read comes back on standard output. What it cannot open is
reported on standard error.

```
[student@workstation ~]$ echo "kept line" > /tmp/keep.log
[student@workstation ~]$ sed -n p /tmp/keep.log /tmp/missing.log > /tmp/both
sed: can't read /tmp/missing.log: No such file or directory
```

Build the first file yourself and leave the second name unused, so this comes
out the same on every machine. The file caught the reading. The complaint came
to the screen, because `>` moves standard output alone. Add `2>&1` and the
second stream follows the first.

```
[student@workstation ~]$ sed -n p /tmp/keep.log /tmp/missing.log > /tmp/both 2>&1
[student@workstation ~]$
```

Nothing on the screen now. Read `2>&1` as "send stream 2 wherever stream 1 is
already going", and the order becomes the whole trick. RH124 09.01 shows the
reverse form, `2>&1 > file`, and it does not do the same job. There the errors
are pointed at the terminal, which is where standard output still is at that
moment, and only afterwards does standard output move to the file. That
section offers `&> file` as the shorthand that cannot be got the wrong way
round. A quiz question in RH124 09.03 turns on exactly this, so it is worth
ten minutes now.

Then look at what landed in the file.

```
[student@workstation ~]$ cat /tmp/both
sed: can't read /tmp/missing.log: No such file or directory
kept line
```

The order is wrong, and nothing is broken. `sed` took the names in the order
you gave them. It read `/tmp/keep.log` first and printed its line before it had
so much as looked at the second name. Yet in the file that line sits underneath
a complaint about a name reached after it.

This catches people out and neither course explains it. Standard error is
unbuffered, so the complaint is written the instant it happens. Standard output
behaves differently when it is a file instead of a terminal. It gathers what
you print in memory and hands it over in blocks. One short line comes nowhere
near filling a block, so it waited until `sed` exited, and by then the
complaint had been on the disk for a while.

Not every program does this. Plenty of them empty what is waiting on standard
output before they complain, and those keep the two in step. So the lesson is
not that errors always come first. It is that a merged file records no timing
at all, and you cannot recover the order of events by reading one.

Two things follow. Never read a merged log as a timeline. And if you are
hunting for which name caused an error, keep the streams apart with
`> results 2> errors` instead of merging them, which is what the challenges in
[`practice.md`](../practice.md) ask you to do.
