# Practice questions

The idea of a regular hands-on practice question came from the RHCSA Practice
series that Tudor Raduta ran as Community Manager in the Red Hat Learning
Community. That community closed on 31 March 2026,<sup>[1][rhlc]</sup> so the
original posts can no longer be linked to. The credit is his. The questions
below are mine, written for this module, and so are any mistakes in them.

Attempt these on your Red Hat Academy lab machine, not on anything you care
about. Each one is a single task of the kind the exam sets, and each names the
objective it belongs to so you can look up what is being asked in
[`objectives.md`](objectives.md).

No answers are given. The point is to reach a result on your own, which is what
the exam grades. Check your work with the questions at the end of each task.

Reboot the machine when you think you have finished. Anything that does not
come back is not finished. See [`pairings.md`](pairings.md) for the commands
most often forgotten.

## 1. Two streams, two files

**Objective: RHCSA-1.2, input and output redirection.**

You are auditing a server for packages whose files have been modified since
installation. Running `rpm -Va` as an ordinary user produces two kinds of
output at once. Verification results go to standard output. Complaints about
files the user cannot read go to standard error, and there are a lot of them.

Capture the verification results in `/tmp/modified.txt` and the complaints in
`/tmp/denied.txt`, using one command line and running it once.

Then produce a third file, `/tmp/audit.txt`, holding both streams interleaved
in the order they were produced.

To check:

- Does `/tmp/denied.txt` contain only error text, with no verification results?
- Does `/tmp/modified.txt` stay empty if you run the command as `root`, and why
  would that be?
- What is the difference between `2>&1 >file` and `>file 2>&1`, and which one
  did you need?

## 2. A volume group with nothing left to give

**Objective: RHCSA-6.4, extend existing logical volumes. Also RHCSA-5.2 and
RHCSA-5.3.**

A logical volume named `lv_archive` in volume group `vg_data` is mounted at
`/srv/archive` and formatted `ext4`. It is 4 GiB and nearly full. You need it
at 9 GiB.

The complication is that `vg_data` has no free extents. A second unused disk is
attached to the machine.

Grow the volume to 9 GiB without unmounting it and without losing the contents.

To check:

- Does `df -h /srv/archive` report the new size, or only `lvs`? If they
  disagree, what step is missing?
- Does the mount survive a reboot?
- Which command would you have needed instead of `resize2fs` had the filesystem
  been XFS, and what can you not do to an XFS filesystem that you can do to
  ext4?

## 3. Home directories that arrive when asked for

**Objective: RHCSA-6.3, configure autofs. Also RHCSA-6.2.**

An NFS server at `filer.example.com` exports `/exports/people`. Under that
export each user has a directory named after their account, so
`/exports/people/asha`, `/exports/people/ben` and so on, and more accounts are
added regularly.

Configure the client so that a user typing `cd /people/asha` finds their
directory mounted, without you having written that user's name anywhere in the
configuration. It must keep working for accounts created after you finish.

To check:

- Does `ls /people` show anything before you enter a directory? Should it?
- Add a new directory on the server. Does it appear on the client without any
  change to the client?
- Does it still work after a reboot?
- Why would an `/etc/fstab` entry be a poor fit for this?

## References

[rhlc]: https://access.redhat.com/community/learn

1. Red Hat, ["Red Hat Training & Certification"][rhlc], on the Red Hat Customer
   Portal, which records the closure of the Red Hat Learning Community.
   Retrieved 2026-07-30.
