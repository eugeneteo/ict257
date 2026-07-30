# Additional practice questions

The first three of these follow questions from the RHCSA Practice series that
Tudor Raduta ran in the [Red Hat Learning Community][rhlc]. It closed on 31
March 2026,<sup>[1][rhlc]</sup> so the posts can no longer be linked to. The
credit is his. Any mistakes are mine.

I used Claude Opus 5 to draft the rest, then checked every command, path and
machine name in them against the courseware.

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

Then produce a third file, `/tmp/audit.txt`, holding both streams together.

To check:

- Does `/tmp/denied.txt` contain only error text, with no matches?
- Would `/tmp/denied.txt` still have anything in it if you ran the command as
  `root`, and why?
- There is more than one way to send both streams to one file. Which did you
  use, and what does `2>&1 >file` do differently from `>file 2>&1`?

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
- A new team is added on `serverb` tomorrow. What would have to be true for it
  to appear under `/teams` without you touching `servera` at all?
- Reboot `servera`. Does it still mount on demand?
- There were two kinds of map you could have used. Which did you choose, and
  what would the other one have looked like?
- Why would an `/etc/fstab` entry be a poor fit for this?

## 4. A port that SELinux has not heard of

**Objective: RHCSA-10.7, manage SELinux port labels. Also RHCSA-10.1.**

A web application on `servera` listens on 82/TCP, and the security team wants
that port back. The application has to move and keep working.

Prepare with `lab start netsecurity-ports`, then `ssh student@servera`.

That gives you Apache installed, configured for 82/TCP and refusing to start.

Move the application to a TCP port above 1024 that SELinux has no label for at
all. Which port is your decision, and checking is part of the task. A `curl`
from `workstation` must then reach the application on the new port. Nothing must
answer on 82/TCP. All of it must survive a reboot.

To check:

- Which file held the port number, and how did you find it?
- What did `semanage port -l` tell you about your chosen port before you changed
  anything? What would you have done if that port had already been labelled for
  another service?
- Start the service before you relabel the port. Which command explains the
  failure, and what does SELinux call a refusal of that kind?
- With the label corrected, `curl` from `workstation` still failed. What was
  left to do?
- Reboot `servera`. Does `curl` from `workstation` still get an answer?
- The firewall already decides what reaches the machine. Why does SELinux label
  ports as well?

## 5. A directory two people share

**Objective: RHCSA-10.2, manage default file permissions. Also RHCSA-1.10.**

Two operators hand work over to each other at the end of a shift. Each has to
read what the other left, and neither should be able to remove it.

Prepare with `lab start perms-default`, then `ssh student@servera`.

That gives you the `operator1` and `operator2` users, both in the `operators`
group, with `redhat` as their password.

Make `/srv/handover` a place where the two of them work. Whoever creates a file
there, the `operators` group must own it. Neither operator may delete or rename
a file that the other one owns. Nobody outside the group may look inside. All of
it must still be true after a reboot.

To check:

- As `operator1`, create a file there. Which group owns it, and what made that
  happen?
- As `operator2`, try to delete that file. What stops you, and which permission
  is doing the stopping?
- Can the `student` user look inside without `sudo`? Can `root`, and why?
- The umask for these users is not the RHEL default. What is it, and what
  permissions would a new file have carried under `0022`?
- Why is `/tmp` a poor home for a directory like this one?

## 6. A directory that empties itself

**Objective: RHCSA-7.1, schedule tasks with systemd timer units.**

A scanner drops files into a directory on `servera` and nothing ever removes
them. Every few months the disk fills.

Prepare with `lab start systasks-tempfiles`, then `ssh student@servera`.

That gives you a plain `servera`, with the vendor configuration under
`/usr/lib/tmpfiles.d` as it was shipped.

Arrange for `/var/spool/scans` to exist after every boot, owned by the `student`
user and group, with `0750` permissions. Files in it that have gone untouched
for three days must disappear without anyone asking. A package update must not
undo your work.

To check:

- Which file did you create, and why not edit one under `/usr/lib/tmpfiles.d`?
- Which timer unit does the removing, and when is it next due to fire?
- How did you satisfy yourself that the removal works, without waiting three
  days?
- Delete the directory and reboot. Does it come back, and what puts it there?
- The `d` and `D` types differ. Which one did you need, and what would the other
  one have done here?

## 7. A volume group with room left in it

**Objective: RHCSA-5.4, create and delete logical volumes. Also RHCSA-5.2.**

An application on `servera` needs storage now and will ask for more of it later.
The spare disk is not to be carved into partitions.

Prepare with `lab start lvm-create`, then `ssh student@servera`.

That gives you `servera` with an empty 5 GiB disk at `/dev/sdb`.

Build LVM storage on that disk without creating a single partition on it. Name
the volume group `vg_vault` and the logical volume `lv_vault`. Give the logical
volume half of the space in the group, with an XFS file system on `/vault`.
Leave the rest of the group unallocated, and have `/vault` mounted after a
reboot.

To check:

- How large is the volume group, and how many extents are still free? Which
  command told you?
- Does `lsblk` show a partition table on `/dev/sdb`? Should it?
- Compare `lvs` and `df -h /vault`. Which figure is the size of the block
  device, and which is the space you can actually use?
- Did you size the volume in mebibytes or in extents? What would the other one
  have been?
- Reboot. Is `/vault` mounted, and what in `/etc/fstab` made that happen?
- If the disk were wanted for something else, what would you have to undo, and
  in what order?

## 8. A short name for a long login

**Objective: RHCSA-10.3, key-based authentication for SSH. Also RHCSA-1.4.**

The `operator1` user copies files to `serverb` several times a day. Typing a
user name, a host name and a password every time is tiresome, and the password
is the weakest part of it.

Prepare with `lab start ssh-keyauth`, then `ssh student@servera`.

That gives you the `operator1` user on both `servera` and `serverb`, with
`redhat` as the password.

Working as `operator1` on `servera`, arrange that `ssh backup` on its own opens
a session as `operator1` on `serverb`. Authentication must use a key pair that
is kept somewhere other than the default file name and is protected by a
passphrase. Within one shell session you should be asked for that passphrase
once, however many times you connect.

To check:

- Which file gives the `backup` name its meaning, and what did you put in it?
- Log out of `servera` and back in. Are you asked for the passphrase again, and
  why?
- Which file on `serverb` changed, and what does it hold now?
- Compare the permissions on the private key and on the public key. Why do they
  differ?
- Somebody takes a copy of your private key file. What else do they need before
  they can use it?

## 9. A page on a disk of its own

**Objective: RHCSA-5.1, partitions on GPT disks. Also RHCSA-5.5, 10.6, 10.1.**

The module timetable is published as a web page on `servera`. It is kept on a
disk of its own, so that the disk can be handed to somebody else at the end of
the semester with the pages still on it.

Prepare with `lab start storage-partitions`, then `ssh student@servera`.

That gives you `servera` with an unused 5 GiB disk at `/dev/sdb`.

Start with the storage. Put a GPT label on `/dev/sdb` and cut one partition of
about 1 GiB from it, named `timetable`. Give that partition an XFS file system
and mount it on `/timetable`. The mount must come back on its own after a
reboot, and the entry in `/etc/fstab` must not name the device. Name the file
system the way Red Hat recommends.

Then the service. Install the Apache web server if it is not already there, and
serve pages from `/timetable` instead of the directory Apache ships with. Put
one line of your own text in `/timetable/index.html`. Apache must start on its
own after a reboot as well.

Then make it reachable. A `curl http://servera` run on `workstation` must
return your line and nothing else. SELinux must be in enforcing mode the whole
time, and turning it off or turning it down does not count as a fix. Whatever
labelling you do has to belong to the policy, so that relabelling `/timetable`
afterwards leaves the page being served.

Finish by rebooting `servera`. Then run the `curl` from `workstation` again
without touching `servera` first.

To check:

- Which command shows the partitioning scheme on `/dev/sdb`, and which part of
  its output would have looked different had you used MBR?
- Which command gave you the value you put in the first field of `/etc/fstab`,
  and why does Red Hat prefer that value to `/dev/sdb1`?
- With Apache running and the firewall open, but before you do anything about
  SELinux, what does the `curl` on `workstation` return? Which file on
  `servera` names the file that was refused, and which command explains it?
- Compare `ls -Zd /timetable` with `ls -Zd /var/www/html`. Do the two agree?
  Which field of the context has to match before Apache may read the files,
  and what is that field called?
- `chcon` would also have made the page appear. Relabel `/timetable` from the
  policy afterwards. Which of the two approaches is still standing, and why?
- What did the firewall have to be told, and how do you tell its runtime
  configuration apart from its permanent one?
- Name everything that had to be made persistent before the reboot, and name
  the command that made each one persistent.
- What does `getenforce` report now? Somebody suggests putting SELinux in
  permissive mode to save time. What would that have hidden?

## 10. Two markers, one of them leaving

**Objective: RHCSA-9.2, adjust password ageing. Also RHCSA-9.1, 9.3 and 9.4.**

Two people mark coursework on `servera` this semester. One starts today and
runs a marking script that nobody sits and watches. The other finishes today
and must lose every way in, while the work already submitted stays where it is.

Prepare with `lab start users-password`, then `ssh student@servera`.

That gives you `servera` with the `operator1` user on it, whose password is
`redhat`.

Start with the accounts. Create the `markers` group and two users, `marker1`
and `marker2`, both of them in `markers` as a supplementary group, each with a
password of your choosing. Create an `oncall` group as well and put `marker1`
in that too, without disturbing anything it already has. The `operator1` user
joins `markers` and must keep every group it already belongs to.

Then the ageing, on `marker1` only. The first time it logs in it has to choose
a new password, and you should watch that happen. After that its password must
last no more than 45 days, with 10 days of warning before it expires. The
account itself must stop working 90 days from today, whatever the password
does.

Then the privilege. The marking script runs unattended as `marker1`, so every
member of `markers` must be able to run any command as `root` through `sudo`
without being asked for a password. Put the rule in a file of its own and leave
`/etc/sudoers` alone. The course names one condition for granting a rule like
that, so meet it as well, for both markers, from `workstation`. Then log in
from `workstation` as `marker1` with no password at all and run something
through `sudo` that a plain user could not.

Then the leaver. Shut `marker2` the way the course recommends for somebody who
has left, so that no login as `marker2` succeeds from `workstation` or on
`servera`, by key or by password. Do not delete the account and do not touch
its files. Finish by rebooting `servera` and trying both logins once more.

To check:

- Which command reports the ageing settings for `marker1`, and which of its
  lines carry the three things you set?
- What did you see the first time `marker1` logged in, and which command made
  that happen?
- Look at `id marker1` and `id operator1`. Is `markers` still there on both of
  them? Which option of `usermod` adds a group and which one replaces the
  list?
- Which file holds your `sudo` rule? Take the line apart. What does each part
  say about who may run what, as whom, and about the password prompt?
- The course gives one condition for granting a rule like that. What is the
  condition, what is the reasoning behind it, and how did you satisfy it?
- Lock the password of `marker2` and stop there. Can you still get in from
  `workstation` with the key? What does the course say about locking on its
  own, and what does it recommend instead for somebody who has left?
- Which file records both the lock and the expiry for `marker2`, and in what
  units is the expiry held?
- Deleting the account would also have stopped the logins. Why is that the
  wrong answer here?
- Reboot `servera`. Which of the things you set needed a further command to
  survive the reboot, and why?

## References

[rhlc]: https://access.redhat.com/community/learn

1. Red Hat, ["Red Hat Training & Certification"][rhlc], on the Red Hat Customer
   Portal, which records the closure of the Red Hat Learning Community.
   Retrieved 2026-07-30.
