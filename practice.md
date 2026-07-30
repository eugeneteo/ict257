# Additional practice challenges

The following challenges are inspired by the RHCSA Practice series that Tudor
Raduta ran in the [Red Hat Learning Community][rhlc]. It closed on 31 March
2026,<sup>[1][rhlc]</sup> so I cannot link the posts any more. I used Claude
Opus 5 to write these in a similar format, so there is more to practise on. I
then used GPT-5.6 Sol to check that each one can be solved.

They run in the Red Hat Academy lab, on top of the guided exercises and not in
place of them. Each challenge names the `lab start` command that prepares its
machine, so run that on `workstation` first. The lab is disposable, so reset it
if you break something.

No answers are given, and no walkthrough. The exam gives you neither. Check your
work with the questions at the end of each task, then reboot. Anything that does
not come back is not finished. See [`pairings.md`](pairings.md) for the commands
most often forgotten.

If you attempt these, do consider blogging how you solved them. Let me know if
you enjoyed them.

## Contents

| # | Challenge | Objectives | Prepare with | Ready |
| --- | --- | --- | --- | --- |
| 1 | [Two streams, two files](#1-two-streams-two-files) | RHCSA-1.2 | nothing | week 3 |
| 2 | [One narrow permission, and one account closed](#2-one-narrow-permission-and-one-account-closed) | RHCSA-9.4, 9.1, 9.3, 9.2 | `lab start users-password` | week 3 |
| 3 | [A default that follows everybody](#3-a-default-that-follows-everybody) | RHCSA-10.2, 1.10 | `lab start perms-default` | week 4 |
| 4 | [Short names for long logins](#4-short-names-for-long-logins) | RHCSA-10.3, 1.4 | `lab start ssh-keyauth` | week 6 |
| 5 | [A job of your own on a clock](#5-a-job-of-your-own-on-a-clock) | RHCSA-7.1, 1.2 | `lab start scheduling-cron` | week 8 |
| 6 | [Grow a volume and retire what it sat on](#6-grow-a-volume-and-retire-what-it-sat-on) | RHCSA-6.4, 5.1, 5.2, 5.3 | `lab start lvm-extend` | week 10 |
| 7 | [A volume group with room left in it](#7-a-volume-group-with-room-left-in-it) | RHCSA-5.4, 5.2, 5.3, 5.6 | `lab start lvm-create` | week 10 |
| 8 | [A share that waits to be asked](#8-a-share-that-waits-to-be-asked) | RHCSA-6.2, 6.3 | `lab start nfsclient-autofs` | week 11 |
| 9 | [A port lent and then given back](#9-a-port-lent-and-then-given-back) | RHCSA-10.7, 10.1 | `lab start netsecurity-ports` | week 11 |
| 10 | [A page on a disk of its own](#10-a-page-on-a-disk-of-its-own) | RHCSA-5.1, 5.5, 10.6, 10.1 | `lab start storage-partitions` | week 11 |


Every objective is listed in [`objectives.md`](objectives.md).

## 1. Two streams, two files

**Objective: RHCSA-1.2, input and output redirection.**

Runs on any Linux machine and needs no `lab start`.

You are looking for large files that a user has left lying around. As the
`student` user, `find /var -size +1M` produces two kinds of output at once.
Matches go to standard output. Complaints about directories the user cannot
read go to standard error, and there are a lot of them.

Start with the split. Capture the matches in `/tmp/large.txt` and the
complaints in `/tmp/denied.txt`, using one command line and running it once.
Neither file may hold a line that belongs in the other.

Then the pair. Produce `/tmp/audit.txt`, holding both streams together. Run the
search once more and have the second run join the first inside that file. When
you have finished, `/tmp/audit.txt` carries two searches and `/tmp/large.txt`
still carries one.

Then the count. Report on the terminal how many lines the search produces in
all, with both streams counted together. One command line, no file written and
no arithmetic of your own. The operator that merged the two streams into
`/tmp/audit.txt` will not serve you here. Working out why is part of the task.

Then the quiet run. Save every match to `/tmp/final.txt` and put only the last
five matches on the terminal, in one command line. The complaints must reach
neither the file nor the screen.

Finish by counting the lines in each file you have kept, so that you can say
what every one of them holds.

To check:

- Does `/tmp/denied.txt` contain only error text, with no matches?
- Would `/tmp/denied.txt` still have anything in it if you ran the command as
  `root`, and why?
- There is more than one way to send both streams to one file. Which did you
  use, and what does `2>&1 >file` do differently from `>file 2>&1`?
- Which operator made the second search join the first inside `/tmp/audit.txt`?
  What would the plain overwriting form have cost you?
- The count puts both streams into a pipe. Why does the merging operator fail
  there, and which form works instead?
- Add the lines of `/tmp/large.txt` to the lines of `/tmp/denied.txt`. Does the
  total agree with the count you reported? Which command counted them?
- Somebody writes `find /var -size +1M > /tmp/large.txt | wc -l` and sees `0`.
  Why does nothing reach `wc`?
- In the quiet run, `tee` sits in the middle of the pipeline. What reaches the
  file, what reaches the screen and what would `tee` at the end have done?
- Where did the complaints go in the quiet run? What would you have written to
  keep them in a file and still keep them off the screen?
- Compare the line count of `/tmp/audit.txt` with `/tmp/large.txt` and
  `/tmp/denied.txt` added together. Which is larger, and why?

## 2. One narrow permission, and one account closed

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
`helpdesk` must be able to run `/usr/bin/systemctl restart chronyd` as `root`
through `sudo`. Through `sudo` they must be able to do nothing else at all. Put
the rule in a file of its own under `/etc/sudoers.d` and leave `/etc/sudoers`
alone. Prove both halves as `relief1`: restart `chronyd`, then try to stop
`sshd`.

Then the leaver. First log in as `relief2` with its password, so that you know
the account works. Lock its password and prove that password login now fails.
Explain why the course says that this step alone is incomplete. Then close the
account the way the course recommends for somebody who has gone. No login as
`relief2` may succeed. Do not delete the account and do not touch its files.
Finish by rebooting `servera` and trying the `sudo` rule and both logins again.

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
- Lock the password of `relief2` and stop there. Which kind of login have you
  blocked? Which kind can still work, according to the course?
- Which file records both the lock and the expiry for `relief2`, and in what
  units is the expiry held?
- Deleting the account would also have stopped the logins. Why is that the wrong
  answer here?
- Reboot `servera`. Which of the things you set needed a further command to
  survive the reboot, and why?

## 3. A default that follows everybody

**Objective: RHCSA-10.2, manage default file permissions. Also RHCSA-1.10.**

Every account on `servera` is to create files the same way from now on. The
owner reads and writes, the group reads, and nobody else gets anything. One
account handles material that nobody else may see, and it needs a tighter rule
of its own.

Prepare with `lab start perms-default`, then `ssh student@servera`.

That gives you the `operator1` and `operator2` users, both in the `operators`
group, with `redhat` as their password.

Start with the evidence. Log in as `operator1` from `workstation` and note what
`umask` prints. Leave one file behind in that home directory as a record of how
the account creates files today, and write down its permissions.

Then the default. Arrange that every login on `servera` starts with a umask of
`0027`. Put the setting in one place that covers all accounts, and use neither
`/etc/bashrc` nor a home directory. The lab has already given both operators a
different value. Put a final setting in each account's `.bashrc`, after any
earlier setting, so that `operator1` follows the new default. All of it must
still hold after a reboot.

Then show what it does. As `operator1`, create one file and one directory, and
account for the permissions on each.

Then the exception. A file that `operator2` creates must be readable and
writable by `operator2` alone, and a directory it creates must be closed to
everybody else as well. Put that where it reaches `operator2` and no other
account, and leave the arrangement for everybody else exactly as you built it.
Log in as each of the two users in turn from `workstation` and prove that they
now differ.

Finish with the file you left behind. It still has its birth permissions.
Bring it into line by hand. Then reboot and check both umask values again.

To check:

- Which file did you create, and which directory holds it? Why is that a better
  place than `/etc/bashrc`?
- What did `umask` print for `operator1` before you started? Why does the final
  line in `.bashrc` replace that value for later login shells?
- Your new file is `0640` and your new directory is `0750`. Show the arithmetic
  for both, and say why the two do not match.
- The file you left behind at the start still has its old permissions. Which
  command brought it into line, and why did the new default not reach it?
- Which value did you give `operator2`, and which file holds it? Two settings
  now apply to that account. Which one wins, and what makes it win?
- Log in as `operator2` from `workstation`, then reach the same account with
  `su - operator2` on `servera`. Does the tighter value arrive both ways? What
  does the course say the dash does?
- Can `operator2` read the file that `operator1` made? Look at the group that
  owns it, and say which group `operator1` was in when the file was made.
- Log out and back in, then reboot. Does `umask` print `0027` for `operator1`
  and your tighter value for `operator2`?
- An account created next term never has its home directory touched by you.
  Does it get `0027`, and what makes that happen?

## 4. Short names for long logins

**Objective: RHCSA-10.3, key-based authentication for SSH. Also RHCSA-1.4.**

The `operator1` user on `servera` reaches `serverb` many times a day, under two
different accounts there. The full command is long and the password is the
weakest part of it.

Prepare with `lab start ssh-keyauth`, then `ssh student@servera`.

That gives you the `operator1` user on `servera` and on `serverb`, with
`redhat` as the password. The `student` user on `serverb` has `student`.

Start with the names. Working as `operator1` on `servera`, arrange two short
names to type in place of a user name and a host name. `ssh backup` must open a
session as `operator1` on `serverb`. `ssh audit` must open one as `student` on
`serverb`. Each name uses its own key pair under a non-default file name.
Neither name may ask for a password.

Then record the identity of `serverb`. While the host is still trusted, obtain
the fingerprint of its ED25519 host key on `serverb` and keep the value.

Then the policy. Make `ssh` refuse any host whose key it does not already hold,
and never add one on behalf of `operator1`. Put that setting in the personal
client file. Put `accept-new` in the system-wide client file. Work out which
value wins.

Then remove `serverb` from the personal known-hosts file. Prove that both short
names now fail. Scan only the ED25519 host key into a separate file. Compare
its fingerprint with the value that you recorded before trusting it.

Finish by adding the verified key to the system-wide known-hosts file. Leave no
entry for `serverb` in the personal known-hosts file. Both short names must work
under strict checking, including after you log out and back in.

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
- Which two files carry the host key setting, and which one wins? Which lines of
  `ssh -v` name those files as they are read?
- Which command printed the trusted fingerprint on `serverb`? Which two
  commands collected the key and printed the fingerprint of that copy?
- Which command removed the personal host key? What did strict checking do on
  the next connection?
- Which file now trusts `serverb` for everybody, and why does the personal
  strict setting still allow the two connections?
- You set the strict value after the two names worked, not before. What would
  have failed had you set it first?

## 5. A job of your own on a clock

**Objective: RHCSA-7.1, schedule tasks with `at` and `cron`. Also RHCSA-1.2.**

A colleague wants to know how fast `/` is filling on `servera`. Nobody will
sit and watch it, and nobody will tidy up after it either.

Prepare with `lab start scheduling-cron`, then `ssh student@servera`.

That gives you `servera` with nothing of your own scheduled on it.

Start with the recurring job. Every ten minutes, `root` must append the date and
the free space on `/` to `/var/log/diskwatch/readings.log`. The job belongs to
the machine and not to any one person, so keep it out of a user's own crontab.
Put it in a file of its own, so that removing the job means removing one file.

Then the one-off. Somebody wants a single reading five minutes from now, and
only that once. Schedule it without disturbing the recurring job. Before it
runs, show that it is waiting, and be ready to say which command would throw it
away again.

Then the tidying. Make `systemd-tmpfiles` create `/var/log/diskwatch` and clean
its contents. A reading file that has gone seven days without access or change
must be removed. Put the rule where a package update cannot reach it. Do not
write a second recurring job to do the work.

Finish by proving all three work. Do not wait ten minutes or a week for the
recurring job and cleanup tests. Restore both intervals afterwards.

To check:

- Which file holds the recurring job, and which field does it carry that a
  user's own crontab does not?
- Read your schedule field aloud. Which five parts does it have, and what does
  each one say?
- Which command lists the one-off job, and which command would remove it? What
  happens to the queue once the job has run?
- Where does the output of a scheduled job go if you do not redirect it, and
  which setting names the person who receives it?
- Which file holds your cleanup rule, and which three fields of that line decide
  what is removed and when?
- Which command applies the cleanup rule now? Which timer would have applied it
  for you, and did you have to write that timer yourself?
- Prove the cleanup works without waiting seven days. What did you change to
  show it, and what did you change back?
- Reboot `servera`. Which of the three arrangements survive, and why does the
  one-off behave the way it does?
- Your recurring job runs as `root`. What would have been different had you put
  it in your own crontab instead?

## 6. Grow a volume and retire what it sat on

**Objective: RHCSA-6.4, extend logical volumes. Also RHCSA-5.1, 5.2 and 5.3.**

A nightly job writes to `/data` and will not start unless it has room. The two
small partitions the volume group sits on are being taken back. Nothing already
on `/data` can be deleted and the job may not be stopped.

Prepare with `lab start lvm-extend`, then `ssh student@servera`.

That gives you the volume group `vg_servera`, the logical volume `lv_servera`
mounted on `/data`, and the disk `/dev/sdb`.

Start with the survey. Record how many files `/data` holds, what `df` reports
about it and what the volume group has left. You need those numbers twice, once
to size the work and once to show at the end that nothing was lost.

Then the room. Add 1 GiB to the logical volume and its file system, without
unmounting it and without losing what is on it. Use one new physical volume of
at least 2 GiB on `/dev/sdb`. The result must give `/data` at least 500 MiB of
free space.

Then the retirement. Bring `vg_servera` down to one physical volume, the new
one. The two it started on must hold no data, must no longer belong to the
volume group and must carry no LVM label. `/data` stays mounted throughout.

Then the disk itself. Take the two retired partitions off `/dev/sdb`, so that
one partition is left and the space the other two held is free again. Nothing
under `/data` may be disturbed by that.

Then make sure `/data` is still mounted after a reboot, whether or not it was
before.

Finish by rebooting. Then, from `workstation` and without opening a session on
`servera`, show that `/data` is mounted at its new size and still holds every
file you counted.

To check:

- Does `df -h /data` report at least 500 MiB available?
- How much free space did the volume group have when you started, and what did
  you have to do about it?
- Why did the new physical volume need room for the whole enlarged logical
  volume? What does `pvmove` do when the destination is too small?
- Did `df -h /data` grow as well as the logical volume? If not, which step is
  missing?
- Which command moved the data off a physical volume, and what does the course
  say about running it while the file system is mounted?
- Three commands retire a physical volume. Name them, and say what order they
  have to run in.
- Which command shows which physical volumes `vg_servera` now uses, and how
  many does it report?
- Which command took the two partitions off the disk? What would it have cost
  you to run it before the three commands above?
- The filesystem here is XFS. Which command did you need, and which one would
  you have needed for ext4?
- Reboot. Is `/data` mounted, and is it still the larger size? Which command
  showed you that from `workstation` without a session on `servera`?

## 7. A volume group with room left in it

**Objective: RHCSA-5.4, logical volumes. Also RHCSA-5.2, 5.3 and 5.6.**

An application on `servera` needs storage now and will ask for more of it later.
The spare disk is not to be carved into partitions.

Prepare with `lab start lvm-create`, then `ssh student@servera`.

That gives you `servera` with an empty 5 GiB disk at `/dev/sdb`.

Start with the storage. Build LVM on that disk without creating a single
partition on it. Name the volume group `vg_vault` and the logical volume
`lv_vault`. Give the logical volume 2.5 GiB, with an XFS file system on
`/vault`. Leave the rest of the group unallocated, and have `/vault` mounted
after a reboot.

Then the swap. The same application wants more swap than the machine has. Take
another 512 MiB from the same volume group, make swap of it, and have it in use
after a reboot as well. Give the new swap a priority of `10`.

Then the retreat. The swap turns out to have been a mistake. Take it out of
use, give its space back to the volume group and leave nothing behind that
would fail at the next boot. `/vault` must come through all of it untouched.

Finish by rebooting, then check both what is still there and what is gone.

To check:

- How large is the volume group, and how many extents are still free? Which
  command told you?
- Does `lsblk` show a partition table on `/dev/sdb`? Should it?
- Compare `lvs` and `df -h /vault`. Which figure is the size of the block
  device, and which is the space you can actually use?
- Did you size the volume in gibibytes or in extents? What would the other one
  have been with the default extent size?
- Which command shows the swap in use, and which column shows that yours is the
  priority `10`? Which priority does the kernel use first?
- Which two lines did you add to `/etc/fstab`? One field differs in kind
  between them. Which, and why?
- In what order did you undo the swap? What would have happened had you removed
  the logical volume first?
- Reboot. Is `/vault` mounted, is the swap gone, and does anything complain on
  the way up?
- The volume group is still half empty. Name two things you could do with that
  space, and the command for each.

## 8. A share that waits to be asked

**Objective: RHCSA-6.2, mount network file systems with NFS. Also RHCSA-6.3.**

Two reporting jobs on `servera` read different exports from `serverb`. The
local names must describe the jobs, not copy the server's directory names.
Between runs the mounts must stay out of the way.

Prepare with `lab start nfsclient-autofs`, then `ssh student@servera`.

That gives you `serverb` exporting directories over NFS, with nothing from it
mounted on `servera`.

Start with one indirect map under `/feeds`. The local key `weekly` must open
`serverb:/shares/west`. The local key `monthly` must open
`serverb:/shares/south`. Write two explicit map entries. Do not use a wildcard,
and do not copy either server-side directory name into the local path.

Install and configure the automounter. Use a master map file under
`/etc/auto.master.d` and a separate map file. Mount both exports with
read/write access and synchronous transactions. Nothing from `serverb` may be
mounted before a key is accessed.

Then prove the two keys are independent. Access `/feeds/weekly` and show that
the west export appears while the south export does not. Access
`/feeds/monthly` and show that the second export then appears too.

Then reboot. Show that neither export is mounted before the first access, and
that each local key still reaches the correct server-side export.

Finish with the withdrawal. Remove only the `weekly` entry from the map and
restart the automounter. `/feeds/weekly` must no longer work.
`/feeds/monthly` must still mount the south export. Reboot once more and prove
both outcomes.

To check:

- Which file is the master map, and which file holds the two explicit keys?
- Why is this an indirect map? Which directory is the base mount point?
- Write out both map entries. Which field may use an arbitrary local name?
- Run `mount | grep serverb` before and after each access. What changes?
- Why would a wildcard entry be wrong for these local names?
- Which command installed the automounter, and which command enabled it now
  and for later boots?
- Reboot `servera`. Is either export mounted before access? Do both keys return?
- After removing `weekly`, why did you restart `autofs`? Which key still works?
- A plain `/etc/fstab` entry mounts at boot and stays mounted. Name two problems
  that causes when the server is across a network.

## 9. A port lent and then given back

**Objective: RHCSA-10.7, manage SELinux port labels. Also RHCSA-10.1.**

A web application on `servera` is being trialled on a port borrowed from
another team. The lender wants the port back sooner than agreed. When the trial
ends the machine has to look untouched.

Prepare with `lab start netsecurity-ports`, then `ssh student@servera`.

That gives you Apache installed, configured for 82/TCP and refusing to start.

Start with the trial. Move the application to a TCP port above 1024 that
`semanage port -l` does not list at all. Which port is your decision, and
checking is part of the task. A `curl` from `workstation` must reach the
application on the new port, nothing must answer on 82/TCP, and the service
must come back on its own after a reboot. When this part is done,
`semanage port -l -C` must list your port and nothing else.

Then prove it. Reboot `servera` and run the `curl` from `workstation` again,
without touching `servera` first.

Then the lender asks for the port back. Move the application to a second port,
chosen the same way, and hand the first one back in full. Nothing of the first
port may survive in the policy or in the firewall. Prove from `workstation`
that the second port answers and the first one does not. Again
`semanage port -l -C` must list one port and nothing else.

Then the trial ends and it all comes off. Restore Apache's original port
setting of 82/TCP. Apache must be stopped and must stay stopped after a reboot.
The firewall must hold no port that you opened, and the policy must hold no
port label that you added.

Finish by rebooting `servera` and showing that all three are true.

To check:

- Which file held the port number, and how did you find it?
- What did `semanage port -l` tell you about your chosen port before you changed
  anything? What would you have done if that port had already been labelled for
  another service?
- Start the service before you relabel the port. Which command explains the
  failure, and what does SELinux call a refusal of that kind?
- With the label corrected, `curl` from `workstation` still failed. What was
  left to do?
- Name two ports above 1024 that would have let you skip SELinux altogether,
  and say which type already holds each of them.
- `semanage port` has an option that modifies a binding. Why was it not the one
  for the move to the second port, and which two options did the move need?
- Which option of `semanage port` took a label away again, and which option
  showed you that nothing of yours was left behind?
- Which two `firewall-cmd` commands closed a port, and what would have been
  left behind had you run only the first one?
- Which value is in Apache's configuration at the end, and why is restoring it
  part of handing the borrowed ports back?
- The service had to survive a reboot in the middle and stay dead at the end.
  Which command arranged each, and which command reports each state?
- Reboot `servera`. Is Apache stopped, is the port closed and is the label
  gone?

## 10. A page on a disk of its own

**Objective: RHCSA-5.1, partitions on GPT disks. Also RHCSA-5.5, 10.6, 10.1.**

The module timetable is published as a web page on `servera`. It is kept on a
disk of its own, so that the disk can be handed to somebody else at the end of
the semester with the pages still on it.

Prepare with `lab start storage-partitions`, then `ssh student@servera`.

That gives you `servera` with an unused 5 GiB disk at `/dev/sdb`.

Start with the storage. Put a GPT label on `/dev/sdb` and cut one partition of
about 1 GiB from it, named `timetable`. Give that partition an XFS file system
and mount it on `/timetable`. The mount must come back on its own after a
reboot. Identify the file system in `/etc/fstab` by the value that Red Hat
recommends, not by the device name.

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

## References

[rhlc]: https://access.redhat.com/community/learn

1. Red Hat, ["Red Hat Training & Certification"][rhlc], on the Red Hat Customer
   Portal, which records the closure of the Red Hat Learning Community.
   Retrieved 2026-07-30.
