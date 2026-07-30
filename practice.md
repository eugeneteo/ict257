# Additional practice questions

These questions follow three from the RHCSA Practice series that Tudor Raduta
ran as Community Manager in the [Red Hat Learning Community][rhlc]. That
community closed on 31 March 2026,<sup>[1][rhlc]</sup> so the original posts can
no longer be linked to. The topics are his. I have written each one around the
lab you have, and so any mistakes in them are mine.

These run in the Red Hat Academy lab. Each question names the `lab start`
command that prepares its machine, so you do not have to build the starting
state yourself. Run that command on `workstation` first, then work on the
machine the question names.

The lab is disposable. If you break something, reset it and start again. That
is what it is for.

Two of these reuse the setup from a guided exercise you have already met. The
exercise walks you through the steps. These do not, and neither does the exam.
The questions here sit on top of the guided exercises and labs. They do not
replace them.

No answers are given. Check your work with the questions at the end of each
task, then reboot. Anything that does not come back is not finished. See
[`pairings.md`](pairings.md) for the commands most often forgotten.

## 1. Two streams, two files

**Objective: RHCSA-1.2, input and output redirection.** Runs on any machine and
needs no `lab start`.

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

Prepare with `lab start lvm-extend`, then `ssh student@servera`.

That gives you the volume group `vg_servera`, the logical volume `lv_servera`
mounted on `/data`, and the disk `/dev/sdb`.

Add 300 MiB to `lv_servera` and make the filesystem use the new space, without
unmounting `/data` and without losing what is on it.

Then make sure `/data` is still mounted after a reboot, whether or not it was
before.

To check:

- Do `lvs` and `df -h /data` agree? If they do not, which step is missing?
- Reboot. Is `/data` mounted, and is it still the larger size?
- The filesystem here is XFS. Which command did you need, and which one would
  you have needed for ext4? What can you do to an ext4 filesystem that you
  cannot do to XFS?

## 3. A share that mounts itself

**Objective: RHCSA-6.3, configure autofs. Also RHCSA-6.2.**

Prepare with `lab start nfsclient-autofs`, then `ssh student@servera`.

That gives you `serverb` exporting `/shares`, which holds `west` and `south`.

Configure `servera` so that a user typing `cd /remote/west` finds that export
mounted, and `cd /remote/south` finds the other one, without either name
appearing in your configuration. It must keep working for any directory added
to `/shares` later, and it must survive a reboot.

To check:

- Does `ls /remote` show anything before you enter a directory? Should it?
- Add a directory to `/shares` on `serverb`. Does it appear on `servera` with
  no change made to `servera`?
- Reboot `servera`. Does it still mount on demand?
- Why would an `/etc/fstab` entry be a poor fit for this?

## References

[rhlc]: https://access.redhat.com/community/learn

1. Red Hat, ["Red Hat Training & Certification"][rhlc], on the Red Hat Customer
   Portal, which records the closure of the Red Hat Learning Community.
   Retrieved 2026-07-30.
