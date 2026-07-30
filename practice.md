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

## 4. A port that SELinux has not heard of

**Objective: RHCSA-10.7, manage SELinux port labels. Also RHCSA-10.1.**

A web application on `servera` listens on 82/TCP, and the security team wants
that port back. The application has to move and keep working.

Prepare with `lab start netsecurity-ports`, then `ssh student@servera`.

That gives you Apache installed, configured for 82/TCP and refusing to start.

Move the application to a TCP port above 1024 that SELinux does not already
associate with a web server. Which port is your decision. A `curl` from
`workstation` must then reach the application on the new port. Nothing must
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
- `df -h /vault` reports less than the size of the logical volume. Why?
- Did you leave half the group unallocated? What can you do later with that
  space that you could not do if it were all used up?
- Reboot. Is `/vault` mounted, and what in `/etc/fstab` made that happen?
- If the disk were wanted for something else, what would you have to undo, and
  in what order?

## 8. A login that needs no password

**Objective: RHCSA-10.3, key-based authentication for SSH. Also RHCSA-1.4.**

The `operator1` user connects to `serverb` several times a day and types a
password every time. The password is the weakest part of it.

Prepare with `lab start ssh-keyauth`, then `ssh student@servera`.

That gives you the `operator1` user on both `servera` and `serverb`, with
`redhat` as the password.

Working as `operator1` on `servera`, arrange to log in to `serverb` without
typing a password. The key pair must be kept somewhere other than the default
file name and must be protected by a passphrase. Within one shell session you
should be asked for that passphrase once, however many times you connect.

To check:

- Your key is not in the default file. What did you have to tell `ssh` so that
  it was used at all?
- Log out of `servera` and back in. Are you asked for the passphrase again, and
  why?
- Which file on `serverb` changed, and what does it hold now?
- Compare the permissions on the private key and on the public key. Why do they
  differ?
- Somebody takes a copy of your private key file. What else do they need before
  they can use it?

## References

[rhlc]: https://access.redhat.com/community/learn

1. Red Hat, ["Red Hat Training & Certification"][rhlc], on the Red Hat Customer
   Portal, which records the closure of the Red Hat Learning Community.
   Retrieved 2026-07-30.
