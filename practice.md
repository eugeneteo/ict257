# Additional practice questions

These questions follow three from the RHCSA Practice series that Tudor Raduta
ran in the [Red Hat Learning Community][rhlc]. It closed on 31 March
2026,<sup>[1][rhlc]</sup> so the posts can no longer be linked to. The credit is
his. Any mistakes are mine.

They run in the Red Hat Academy lab, on top of the guided exercises and not in
place of them. Each question names the `lab start` command that prepares its
machine, so run that on `workstation` first. The lab is disposable, so reset it
if you break something.

No answers are given, and no walkthrough. The exam gives you neither. Check your
work with the questions at the end of each task, then reboot. Anything that does
not come back is not finished. See [`pairings.md`](pairings.md) for the commands
most often forgotten.

## 1. Two streams, two files

**Objective: RHCSA-1.2, input and output redirection.**

Runs on any machine and needs no `lab start`.

You are looking for large files that a user has left lying around. As the
`student` user, `find /var -size +1M` produces two kinds of output at once.
Matches go to standard output. Complaints about directories the user cannot
read go to standard error, and there are a lot of them.

Capture the matches in `/tmp/large.txt` and the complaints in
`/tmp/denied.txt`, using one command line and running it once.

Then produce a third file, `/tmp/audit.txt`, holding both streams interleaved
in the order they were produced.

To check:

- Does `/tmp/denied.txt` contain only error text, with no matches?
- Would `/tmp/denied.txt` still have anything in it if you ran the command as
  `root`, and why?
- What is the difference between `2>&1 >file` and `>file 2>&1`, and which one
  did you need?

## 2. Grow a volume that is already in use

**Objective: RHCSA-6.4, extend existing logical volumes.**

A nightly job writes to `/data` and will not start unless it has room. Nothing
already there can be deleted.

Prepare with `lab start lvm-extend`, then `ssh student@servera`.

That gives you the volume group `vg_servera`, the logical volume `lv_servera`
mounted on `/data`, and the disk `/dev/sdb`.

Give `/data` at least 500 MiB of free space, without unmounting it and without
losing what is on it. How much bigger the volume has to be is for you to work
out.

Then make sure `/data` is still mounted after a reboot, whether or not it was
before.

To check:

- Does `df -h /data` report at least 500 MiB available?
- Do `lvs` and `df -h /data` agree? If they do not, which step is missing?
- Reboot. Is `/data` mounted, and is it still the larger size?
- The filesystem here is XFS. Which command did you need, and which one would
  you have needed for ext4?
- How much free space did the volume group have when you started, and what did
  you have to do about it?

## 3. A share that mounts itself

**Objective: RHCSA-6.3, configure autofs. Also RHCSA-6.2.**

`serverb` keeps a directory for each team, and new teams appear without warning.
Nobody should have to mount anything by hand.

Prepare with `lab start nfsclient-autofs`, then `ssh student@servera`.

That gives you `serverb` exporting `/shares`, which holds `west` and `south`.

Make everything under that export reachable under `/teams`, so that
`/teams/west` and `/teams/south` both work. Nothing should be mounted until
someone goes looking for it. A team added on `serverb` later must work with no
further change to `servera`, and the arrangement must survive a reboot.

To check:

- Before you touch anything, does `mount` list the export? What does it list
  after you enter one of the directories?
- Which package did you have to install before any of this worked?
- Add a directory to `/shares` on `serverb`. Does it appear under `/teams` with
  no change made to `servera`?
- Reboot `servera`. Does it still mount on demand?
- There were two kinds of map you could have used. Which did you choose, and
  what would the other one have looked like?
- Why would an `/etc/fstab` entry be a poor fit for this?

## References

[rhlc]: https://access.redhat.com/community/learn

1. Red Hat, ["Red Hat Training & Certification"][rhlc], on the Red Hat Customer
   Portal, which records the closure of the Red Hat Learning Community.
   Retrieved 2026-07-30.
