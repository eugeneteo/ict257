# Additional practice questions

The following questions are inspired by the RHCSA Practice series that Tudor
Raduta ran in the [Red Hat Learning Community][rhlc]. It closed on 31 March
2026,<sup>[1][rhlc]</sup> so I cannot link the posts any more. I used Claude
Opus 5 to create these practice questions in a similar format, if you want more
opportunities to practise for the exam.

They run in the Red Hat Academy lab, on top of the guided exercises and not in
place of them. Each question names the `lab start` command that prepares its
machine, so run that on `workstation` first. The lab is disposable, so reset it
if you break something.

No answers are given, and no walkthrough. The exam gives you neither. Check your
work with the questions at the end of each task, then reboot. Anything that does
not come back is not finished. See [`pairings.md`](pairings.md) for the commands
most often forgotten.

## Contents

| # | Question | Objectives | Prepare with |
| --- | --- | --- | --- |
| 1 | [Two streams, two files](#1-two-streams-two-files) | RHCSA-1.2 | nothing |
| 2 | [Grow a volume and retire what it sat on](#2-grow-a-volume-and-retire-what-it-sat-on) | RHCSA-6.4, 5.2, 5.3 | `lab start lvm-extend` |
| 3 | [A share that waits to be asked](#3-a-share-that-waits-to-be-asked) | RHCSA-6.2, 6.3 | `lab start nfsclient-autofs` |
| 4 | [A port lent and then given back](#4-a-port-lent-and-then-given-back) | RHCSA-10.7, 10.1 | `lab start netsecurity-ports` |
| 5 | [A default that follows everybody](#5-a-default-that-follows-everybody) | RHCSA-10.2, 1.10 | `lab start perms-default` |
| 6 | [A job of your own on a clock](#6-a-job-of-your-own-on-a-clock) | RHCSA-7.1, 7.2 | `lab start systasks-timers` |
| 7 | [A volume group with room left in it](#7-a-volume-group-with-room-left-in-it) | RHCSA-5.4, 5.2 | `lab start lvm-create` |
| 8 | [Short names for long logins](#8-short-names-for-long-logins) | RHCSA-10.3, 1.4 | `lab start ssh-keyauth` |
| 9 | [A page on a disk of its own](#9-a-page-on-a-disk-of-its-own) | RHCSA-5.1, 5.5, 10.6, 10.1 | `lab start storage-partitions` |
| 10 | [One narrow permission, and one account closed](#10-one-narrow-permission-and-one-account-closed) | RHCSA-9.4, 9.1, 9.2, 9.3 | `lab start users-password` |

Every objective is listed in [`objectives.md`](objectives.md).

## 1. Two streams, two files

**Objective: RHCSA-1.2, input and output redirection.**

Runs on any Linux machine and needs no `lab start`.

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

## 2. Grow a volume and retire what it sat on

**Objective: RHCSA-6.4, extend logical volumes. Also RHCSA-5.2 and 5.3.**

A nightly job writes to `/data` and will not start unless it has room. The two
small partitions the volume group sits on are being taken back. Nothing already
on `/data` can be deleted and the job may not be stopped.

Prepare with `lab start lvm-extend`, then `ssh student@servera`.

That gives you the volume group `vg_servera`, the logical volume `lv_servera`
mounted on `/data`, and the disk `/dev/sdb`.

Give `/data` at least 500 MiB of free space, without unmounting it and without
losing what is on it. How much bigger the volume has to be is for you to work
out.

Then bring `vg_servera` down to one physical volume, the new one. The two it
started on must hold no data, must no longer belong to the volume group and
must carry no LVM label. `/data` stays mounted throughout.

Then make sure `/data` is still mounted after a reboot, whether or not it was
before.

To check:

- Does `df -h /data` report at least 500 MiB available?
- How much free space did the volume group have when you started, and what did
  you have to do about it?
- Do `lvs` and `df -h /data` agree? If they do not, which step is missing?
- Which command moved the data off a physical volume, and what does the course
  say about running it while the file system is mounted?
- Three commands retire a physical volume. Name them, and say what order they
  have to run in.
- Which command shows which physical volumes `vg_servera` now uses, and how
  many does it report?
- The filesystem here is XFS. Which command did you need, and which one would
  you have needed for ext4?
- Reboot. Is `/data` mounted, and is it still the larger size?

## 3. A share that waits to be asked

**Objective: RHCSA-6.2, mount network file systems with NFS. Also RHCSA-6.3.**

A reporting job on `servera` reads from `serverb` twice a week. Between those
runs the mount earns nothing and holds up every boot.

Prepare with `lab start nfsclient-autofs`, then `ssh student@servera`.

That gives you `serverb` exporting `/shares`, which holds `west` and `south`.

Mount `serverb:/shares/west` on `/reports`, and have that happen only when
somebody enters `/reports`. Nothing must be mounted before that. Do all of it
from `/etc/fstab`. Do not install `autofs` and do not write a map file. It must
behave the same way after a reboot.

To check:

- Which option in your `/etc/fstab` line makes the mount wait? What reads that
  line and builds a unit from it, and what is the unit called?
- Run `mount` before you enter `/reports` and again afterwards. What changed?
- Which two commands did you run after saving `/etc/fstab`, and what does each
  one do?
- Reboot `servera`. Is anything from `serverb` mounted before you look? Enter
  `/reports` again. Does it come back?
- The automounter would also have done this. Write out the master map entry and
  the map file entry that would have replaced your `/etc/fstab` line.
- A plain `/etc/fstab` entry mounts at boot and stays mounted. Name two things
  that go wrong with that when the export sits on the far side of a network.

## 4. A port lent and then given back

**Objective: RHCSA-10.7, manage SELinux port labels. Also RHCSA-10.1.**

A web application on `servera` is being trialled for a week on a port borrowed
from another team. When the week ends the machine has to look untouched.

Prepare with `lab start netsecurity-ports`, then `ssh student@servera`.

That gives you Apache installed, configured for 82/TCP and refusing to start.

Start with the trial. Move the application to a TCP port above 1024 that
`semanage port -l` does not list at all. Which port is your decision, and
checking is part of the task. A `curl` from `workstation` must reach the
application on the new port, nothing must answer on 82/TCP, and the service
must come back on its own after a reboot. When this part is done,
`semanage port -l -C` must list your port and nothing else.

Then the week ends and it all comes off. Apache must be stopped and must stay
stopped after a reboot. The firewall must hold no port that you opened, and the
policy must hold no port label that you added. Reboot `servera` and show that
all three are true.

To check:

- Which file held the port number, and how did you find it?
- What did `semanage port -l` tell you about your chosen port before you changed
  anything? What would you have done if that port had already been labelled for
  another service?
- Start the service before you relabel the port. Which command explains the
  failure, and what does SELinux call a refusal of that kind?
- With the label corrected, `curl` from `workstation` still failed. What was
  left to do?
- Which option of `semanage port` took the label away again, and which option
  showed you that nothing of yours was left behind?
- Which two `firewall-cmd` commands closed the port, and what would have been
  left behind had you run only the first one?
- Reboot `servera`. Is Apache stopped, is the port closed and is the label gone?

## 5. A default that follows everybody

**Objective: RHCSA-10.2, manage default file permissions. Also RHCSA-1.10.**

Every account on `servera` is to create files the same way from now on. The
owner reads and writes, the group reads, and nobody else gets anything.

Prepare with `lab start perms-default`, then `ssh student@servera`.

That gives you the `operator1` and `operator2` users, both in the `operators`
group, with `redhat` as their password.

Arrange that every login on `servera` starts with a umask of `0027`. Put the
setting in one place that covers all accounts, and use neither `/etc/bashrc`
nor a home directory. Then find the value that `operator1` and
`operator2` carry now and take it away, so that the new default reaches them
too. All of it must still hold after a reboot.

Then show what it does. As `operator1`, create one file and one directory, and
account for the permissions on each.

To check:

- Which file did you create, and which directory holds it? Why is that a better
  place than `/etc/bashrc`?
- What did `umask` print for `operator1` before you started, and where was that
  value set? Which command found it?
- Your new file is `0640` and your new directory is `0750`. Show the arithmetic
  for both, and say why the two do not match.
- What would that file have come out as under the RHEL default of `0022`?
- Log out and back in, then reboot. Does `umask` still print `0027`?
- Can `operator2` read the new file? Look at the group that owns it, and say
  which group `operator1` was in when the file was made.
- An account created next term never has its home directory touched by you.
  Does it get `0027`, and what makes that happen?

## 6. A job of your own on a clock

**Objective: RHCSA-7.1, schedule tasks with systemd timers. Also RHCSA-7.2.**

A colleague wants to know how fast `/` is filling on `servera`. Nobody is going
to sit and watch it.

Prepare with `lab start systasks-timers`, then `ssh student@servera`.

That gives you a plain `servera` and nothing else.

Write a unit pair of your own, `diskwatch.service` and `diskwatch.timer`, and
put both where a package update cannot reach them. The service must run one
command as `root` and then exit, appending the date and the free space on `/`
to `/var/log/diskwatch.log`. The timer must fire it every ten minutes, must be
waiting now and must be waiting again after a reboot.

To check:

- Which directory holds your two files, and which directory would have been the
  wrong one? What happens to a file left in the wrong one?
- Which section of the timer file carries the schedule, and which key did you
  set in it?
- Which command did you run after writing the files, and what does systemd do
  if you forget it?
- Which command reports when the timer is next due and which unit it triggers?
- Wait ten minutes. Has `/var/log/diskwatch.log` grown? Which command shows
  what the service recorded the last time it ran?
- Reboot `servera`. Is the timer waiting again, and which command made that
  happen?
- You enabled one of the two units and left the other alone. Which one, and
  what would happen if you enabled the other as well?

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

## 8. Short names for long logins

**Objective: RHCSA-10.3, key-based authentication for SSH. Also RHCSA-1.4.**

The `operator1` user on `servera` reaches `serverb` many times a day, under two
different accounts there. The full command is long and the password is the
weakest part of it.

Prepare with `lab start ssh-keyauth`, then `ssh student@servera`.

That gives you the `operator1` user on `servera` and on `serverb`, with
`redhat` as the password. The `student` user on `serverb` has `student`.

Working as `operator1` on `servera`, arrange two short names. `ssh backup` on
its own must open a session as `operator1` on `serverb`. `ssh audit` on its own
must open a session as `student` on `serverb`. Each name uses a key pair of its
own, kept under a file name that `ssh` would not have found by itself. Neither
name may ask for a password.

Then tighten the client. Make `ssh` refuse to connect to any host whose key it
does not already hold, and never add one on your behalf.

To check:

- Which file carries the two names, and which three keywords did you write
  under each?
- Run `ssh -v backup`. Which line names the key that was offered, and which
  line says how you were authenticated?
- Which file on `serverb` changed for each name, and whose home directory is it
  in?
- Compare the permissions on a private key and on its public half. Why do they
  differ?
- Move one private key file aside and connect again with `ssh -v`. Which method
  does the client fall back to, and which line shows it? Put the file back.
- Which setting did you choose for host key checking, and what would the other
  three have done? Which file holds it, and which file does that one override?
- You set that last, not first. What would have gone wrong had you set it
  before the two names worked?
- Neither private key has a passphrase on it. Somebody takes a copy of one of
  the files. What does that get them, and what does the course say you could
  have done about it?

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

## 10. One narrow permission, and one account closed

**Objective: RHCSA-9.4, configure privileged access. Also RHCSA-9.1 to 9.3.**

Two people cover the relief rota on `servera` this term. One starts today and
needs to restart the time service, and nothing more than that. The other
finishes today and must lose every way in, while the work already filed stays
where it is.

Prepare with `lab start users-password`, then `ssh student@servera`.

That gives you `servera` with the `operator1` user on it, whose password is
`redhat`.

Start with the accounts. Create the `helpdesk` group and two users, `relief1`
and `relief2`, both of them in `helpdesk` as a supplementary group, each with a
password of your choosing. The `operator1` user joins `helpdesk` as well and
must keep every group it already belongs to.

Then the ageing, on `relief1` only. The first time it logs in it has to choose a
new password, and you should watch that happen. Should it ever let its password
expire, the account must lock itself seven days later, without anybody
intervening.

Then the privilege, and no more of it than the job needs. Every member of
`helpdesk` must be able to restart the `chronyd` service as `root` through
`sudo`. Through `sudo` they must be able to do nothing else at all. Put the rule
in a file of its own under `/etc/sudoers.d` and leave `/etc/sudoers` alone.
Prove both halves as `relief1`: restart `chronyd`, then try to stop `sshd`.

Then the leaver. First give `relief2` a way in from `workstation` with an SSH
key, so that you can see for yourself what each step of the shutdown does. Then
close `relief2` the way the course recommends for somebody who has gone, so that
no login as `relief2` succeeds from `workstation` or on `servera`, by key or by
password. Do not delete the account and do not touch its files. Finish by
rebooting `servera` and trying the `sudo` rule and both logins once more.

To check:

- Which command reports the ageing settings for `relief1`, and which of its
  lines carry the two things you set?
- What did you see the first time `relief1` logged in, and which command made
  that happen?
- Look at `id operator1`. Is `helpdesk` there, and is everything else still
  there? Which option of `usermod` adds a group and which one replaces the
  list?
- Which file holds your `sudo` rule? Take the line apart. What does each part
  say about who may run what, and as whom?
- As `relief1`, run `sudo systemctl stop sshd`. Were you refused? Which part of
  your rule decided that?
- Your rule names a command by its full path. Which command gave you that path?
- Lock the password of `relief2` and stop there. Can you still get in from
  `workstation` with the key? What does the course say about locking on its own,
  and what does it recommend instead for somebody who has left?
- Which file records both the lock and the expiry for `relief2`, and in what
  units is the expiry held?
- Deleting the account would also have stopped the logins. Why is that the wrong
  answer here?
- Reboot `servera`. Which of the things you set needed a further command to
  survive the reboot, and why?

## References

[rhlc]: https://access.redhat.com/community/learn

1. Red Hat, ["Red Hat Training & Certification"][rhlc], on the Red Hat Customer
   Portal, which records the closure of the Red Hat Learning Community.
   Retrieved 2026-07-30.
