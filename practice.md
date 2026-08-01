# Optional practice challenges

The following challenges take the RHCSA Practice series that Tudor Raduta ran
in the [Red Hat Learning Community][rhlc] as a starting point. It closed on
31 March 2026,<sup>[1][rhlc]</sup> so I cannot link the posts any more. I wrote
these with my virtual teaching assistants, Claude Opus 5 and GPT-5.6 Sol.
Opus 5 drafted the new challenges. GPT-5.6 Sol checked that each one can be
solved and rewrote the ones that could not. The published text is the work of
both. If you find a mistake in one, please
[open an issue](https://github.com/eugeneteo/ict257/issues/new).

None of this is required for ICT257. They run in the Red Hat Academy lab, on
top of the guided exercises and not in place of them. Each challenge names the
`lab start` command that prepares its machine, so run that on `workstation`
first. The lab is disposable, so reset it if you break something.

No answers or walkthroughs are given. Check your work with the questions at the
end of each task, then reboot and check each required result again. See
[`pairings.md`](pairings.md) for the commands most often forgotten.

If you work through any of these, I strongly encourage you to commit your
answers to GitHub or write about them on a blog. Explaining a solution is how
you find out whether you understood it, and it gives you something to show for
the work.

## Contents

| # | Challenge | Ready | Difficulty | Objectives | Prepare with |
| --- | --- | --- | --- | --- | --- |
| 1 | [The pool of tears, and another beside it](#1-the-pool-of-tears-and-another-beside-it) | week 3 | Doable | RHCSA-1.2, 1.1 | nothing |
| 2 | [A small door, and one sentence from the Queen](#2-a-small-door-and-one-sentence-from-the-queen) | week 3 | Moderate | RHCSA-9.4, 9.1, 9.3, 9.2 | `lab start users-password` |
| 3 | [Everybody has won, and all must have prizes](#3-everybody-has-won-and-all-must-have-prizes) | week 4 | Doable | RHCSA-10.2, 1.10 | `lab start perms-default` |
| 4 | [The bottle marked drink me, and where it came from](#4-the-bottle-marked-drink-me-and-where-it-came-from) | week 4 | Moderate | RHCSA-2.1, 2.2, 7.5 | `lab start software-dnf` |
| 5 | [A cake marked eat me, for one guest only](#5-a-cake-marked-eat-me-for-one-guest-only) | week 4 | Doable | RHCSA-2.3, 2.4 | `lab start flatpak-configure` |
| 6 | [Clean cup, move down](#6-clean-cup-move-down) | week 5 | Moderate | RHCSA-6.5, 1.8, 1.9, 1.10 | `lab start perms-cli` |
| 7 | [The White Rabbit must not be late](#7-the-white-rabbit-must-not-be-late) | week 5 | Doable | RHCSA-7.2, 4.9, 8.3 | `lab start services-identify` |
| 8 | [Who are you, said the Caterpillar](#8-who-are-you-said-the-caterpillar) | week 6 | Doable | RHCSA-10.3, 1.4 | `lab start ssh-keyauth` |
| 9 | [Two, Five and Seven paint the roses](#9-two-five-and-seven-paint-the-roses) | week 7 | Moderate | RHCSA-3.3, 3.1, 3.2, 3.4 | `lab start scripts-loops` |
| 10 | [One card in the whole pack](#10-one-card-in-the-whole-pack) | week 7 | Doable | RHCSA-1.3, 1.7, 1.11 | `lab start regexes-regex` |
| 11 | [A watch that tells the day of the month](#11-a-watch-that-tells-the-day-of-the-month) | week 8 | Moderate | RHCSA-7.1 (at and cron only), 1.2 | `lab start scheduling-cron` |
| 12 | [The jury writes it all down](#12-the-jury-writes-it-all-down) | week 8 | Moderate | RHCSA-4.7, 4.8, 7.4 | `lab start logs-systemd` |
| 13 | [A caucus race with no winner](#13-a-caucus-race-with-no-winner) | week 9 | Moderate | RHCSA-4.4, 4.5, 4.6 | `lab start tuning-nice` |
| 14 | [The Cheshire Cat fades, but the grin stays](#14-the-cheshire-cat-fades-but-the-grin-stays) | week 9 | Moderate | RHCSA-10.4, 10.5, 10.8 | `lab start selinux-booleans` |
| 15 | [Alice grows, and the bottle is put away](#15-alice-grows-and-the-bottle-is-put-away) | week 10 | Hard | RHCSA-6.4, 5.1, 5.2, 5.3 | `lab start lvm-extend` |
| 16 | [No room, said the Hare, and there was plenty](#16-no-room-said-the-hare-and-there-was-plenty) | week 10 | Hard | RHCSA-5.4, 5.2, 5.3, 5.6 | `lab start lvm-create` |
| 17 | [The treacle well, and what was drawn from it](#17-the-treacle-well-and-what-was-drawn-from-it) | week 10 | Hard | RHCSA-6.1 (XFS and ext4 only), 1.6, 4.10, 5.5 | `lab start archive-manage` |
| 18 | [A door that opens only when asked](#18-a-door-that-opens-only-when-asked) | week 11 | Doable | RHCSA-6.2, 6.3, 4.9 | `lab start nfsclient-autofs` |
| 19 | [The flamingo lent for the game, and given back](#19-the-flamingo-lent-for-the-game-and-given-back) | week 11 | Moderate | RHCSA-10.7, 10.1 | `lab start netsecurity-ports` |
| 20 | [What is the use of a book without pictures](#20-what-is-the-use-of-a-book-without-pictures) | week 11 | Hard | RHCSA-5.1, 5.5, 10.6, 10.1 | `lab start storage-partitions` |
| 21 | [A passage of their own to the garden](#21-a-passage-of-their-own-to-the-garden) | week 11 | Moderate | RHCSA-8.1, 8.2, 8.4 | `lab start net-edit` |
| 22 | [Begin at the beginning, said the King](#22-begin-at-the-beginning-said-the-king) | week 11 | Hard | RHCSA-7.6, 4.1, 4.2, 4.3, 7.3, 1.5 | `lab start boot-grub` |


Every objective is listed in [`objectives.md`](objectives.md). The difficulty is
relative to the others. None of them is a five minute job.

## 1. The pool of tears, and another beside it

**Objective: RHCSA-1.2, input and output redirection. Also RHCSA-1.1.**

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

Then the typing. Write one of the command lines above across two lines, so that
the shell shows you its second prompt before it runs anything. Then run two of
the commands on one line, separated so that both run in turn. Then bring back
an earlier command from the list the shell keeps, without retyping it.

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
- Which character continued a command onto a second line? Which command lists
  what you have run, and which form brought one back without retyping it?

## 2. A small door, and one sentence from the Queen

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

## 3. Everybody has won, and all must have prizes

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

## 4. The bottle marked drink me, and where it came from

**Objective: RHCSA-2.1, RPM repositories. Also RHCSA-2.2 and 7.5.**

A tool is wanted on `servera` for one job. It comes from a repository the team
runs itself. A later build of the same package sits in a second repository that
must stay switched off until somebody asks for it.

Prepare with `lab start software-dnf`, then `ssh student@servera`.

That gives you `servera` with the two Red Hat repositories enabled and nothing
of your own configured.

Start with the survey. Without installing anything, find the package that owns
`/usr/bin/nmap`, read its summary and record which repository would supply it.
Then install it, prove it works, and take it off again.

Then read the record. Both of those went into a log the machine keeps. Find the
two entries, and open the later one so that you can name every package it
touched.

Then the first repository of your own. Write a file under `/etc/yum.repos.d`
by hand. Give the repository an id of `rht`, a name of your own choosing and
a base URL over HTTP on the classroom package server `repo.example.com`, at
the path `/rhel10.0/x86_64/rhcsa-practice/rht`. Signatures are not checked
here. Install `rht-system` from it, then say which repository the installed
copy came from and which version it carries.

Then the second repository, switched off. Write a second file for the sibling
path `/rhel10.0/x86_64/rhcsa-practice/errata` on the same server, defined but
not searched. `dnf repolist` must leave it out. Then upgrade `rht-system` from
it with one command that reaches it for that command only. Do not edit either
file and do not enable the repository. Afterwards the installed copy must name
the second repository and carry the later version.

Finish with the withdrawal. Remove `rht-system`. Switch the first repository
off with a command, leaving its file in place. Reboot, then show that both
repositories are still defined and neither is enabled.

To check:

- Which command named the package that owns `/usr/bin/nmap`? Which one gave
  you its version and its repository without installing it?
- Which command lists the two transactions, and which one opens a single
  transaction in full? What does the Altered column count?
- Take your `rht` file apart. Which line names the repository to `dnf`, which
  one points at the packages and which one turns signature checking off?
- Which command lists your repository and its status? Which option of that
  command also shows repositories that are switched off?
- Run `dnf list rht-system` after the install. Which field tells you where the
  copy on disk came from, and what marks it?
- Which single option let one command use the errata repository without
  enabling it? What is the difference between that option and the command that
  enables a repository for good?
- After the upgrade, what does `dnf list rht-system` report for the version and
  the repository? Compare both with what it said before.
- Which command switched the first repository off persistently? Name the file
  it changed and the line it wrote.
- Reboot `servera`. Does `dnf repolist` list either of your repositories? Does
  `dnf repolist all`?

## 5. A cake marked eat me, for one guest only

**Objective: RHCSA-2.3, Flatpak repositories. Also RHCSA-2.4.**

Two desktop applications are being trialled on `workstation`. One is for
everybody who logs in. The other is for you alone, and it must not be offered
to anybody else.

Prepare with `lab start flatpak-configure`. Everything here runs on
`workstation`, so open a terminal there and stay on it.

That gives you `workstation` with Flatpak installed and the Red Hat remote
repository configured.

Start with the survey. Report which packages provide Flatpak, which remote
repositories the machine holds and where the system-wide configuration of them
lives. The Red Hat remote needs an account that the classroom does not have, so
switch it off without deleting it.

Then the remote for everybody. Add the classroom repository at
`http://flatpak.lab.example.com/myrepo.flatpakrepo` under a short name of your
choosing, so that every account on the machine can see it. Signatures are not
verified here. Write the command so that running it a second time leaves an
existing remote of that name alone. List what the remote holds.

Then the application for everybody. Install one application from it so that any
account can run it. Show where the copy on disk came from, and name the runtime
that arrived with it.

Then the application for you alone. Install a second application so that only
`student` has it. One command must now list both, with a column that tells them
apart.

Then hold one back. Stop the account-only application from being updated, run
an update and show that it was passed over. Then release it again.

Finish with the withdrawal. Take the account-only application off, together
with the data it left behind. Then switch the remote off without deleting it,
and show that the application for everybody survives that. Turn the remote back
on, then delete it and everything that came from it.

To check:

- Which file describes the Red Hat remote, and which directory holds it? What
  does that directory tell you about who the remote is for?
- Write out the command that added the classroom remote. Which part made it
  system-wide, which part turned signature checking off and which part makes it
  safe to run twice?
- Which two commands list the remotes for everybody and the remotes for you
  alone? Which listing does the classroom remote appear in?
- Which column of `flatpak list` separates the two applications, and what does
  it say for each?
- Which command showed you the runtime that an application depends on? Why did
  installing one application pull in something else?
- What did `flatpak update` print for the application you held back? Which
  command held it back and which released it?
- Uninstalling leaves a data directory behind by default. Where is it, and
  which option removes it as well?
- You switched the remote off before deleting it. What is the practical
  difference between those two, for software already installed?

## 6. Clean cup, move down

**Objective: RHCSA-6.5, file permission problems. Also RHCSA-1.8 to 1.10.**

Two consultants file reports into one directory on `servera`. Files keep
arriving with the wrong group, and one consultant keeps deleting the other's
work. Nobody outside the pair may see any of it.

Prepare with `lab start perms-cli`, then `ssh student@servera`.

That gives you the `consultants` group with `consultant1` and `consultant2` in
it, both with `redhat` as their password.

Start with the directory. Create `/shared/reports`, owned by `root` and by the
`consultants` group. Members of that group must create files in it and delete
their own. No other account may list it or enter it. As `consultant1`, put one
file in it now, before you go any further, and record its group owner.

Then the group that follows the directory. Every file created in
`/shared/reports` from now on must belong to `consultants`, whoever creates it.
Arrange that, then create one file as each consultant and check the group owner
of both.

Then the file that was there first. The file you left behind at the start still
carries the old group. Explain why the new arrangement did not reach it, then
bring it into line with one command.

Then the deletion that must not happen. `consultant2` must not be able to
delete a file that `consultant1` owns, while still deleting its own. Arrange
that and prove both halves as `consultant2`.

Then the failure to diagnose. Take one permission away from `/shared` so that
`consultant2` can no longer reach a file it owns inside `/shared/reports`.
Change nothing on `reports` and nothing on the file. Say which permission you
removed and what it does on a directory. Put it back.

Then two names for one file. Give `consultant1` a name in its home directory
that reaches `/shared/reports` in one step. Give it a second name for one
report that keeps the report readable after the original name is removed. Show
the count that tells the two kinds apart, remove the original of each and say
what is left.

Finish by rebooting and checking that the arrangement still holds.

To check:

- Which special permission makes files inherit the group of the directory?
  Where does it appear in `ls -ld`, and which letter replaces which?
- The file you made first still had the wrong group. Which command corrected
  it, and why did the special permission not reach back to it?
- Which special permission stopped `consultant2` deleting another user's file?
  Where does it appear in a long listing?
- Which permission did you remove from `/shared`? What is that permission
  called on a directory, and why did the file itself not have to change?
- Compare `ls -l` for your two extra names. Which one shows a count above one,
  and which one shows an arrow?
- Remove the original report. Which of the two names still gives you the
  contents, and why does the other one not?
- Reboot `servera`. Do the two special permissions survive? Which command shows
  you both at once?

## 7. The White Rabbit must not be late

**Objective: RHCSA-7.2, services at boot. Also RHCSA-4.9 and 8.3.**

A handover note says which services on `servera` must be running tomorrow and
which must not. One of them has to be put beyond reach, because a colleague
keeps starting it by hand.

Prepare with `lab start services-identify`, then `ssh student@servera`.

That gives you `servera` with its usual services running, including `sshd` and
`chronyd`.

Start with the survey. Produce two listings: one of the service units that are
loaded and active, and one of every installed service unit file with its state.
Say what the second holds that the first does not, and say where the values of
the state column are documented.

Then the two schedulers. Report whether `crond` and `atd` are running and
whether each starts at boot, naming the command for each question. Then arrange
that `atd` runs now and at every boot, and that `crond` runs now but not at the
next boot. Use one command where one command will do.

Then the service put beyond reach. Choose `rsyslog`. Make it impossible to
start, by hand or at boot. Try to start it and record what you are told. Show
what its state has become in the listing of unit files, and name the file the
change created.

Then the dependencies. Show which units have to start before `sshd`, and show
which units depend on `NetworkManager`. Say what disabling `NetworkManager`
would do to the second list. Do not disable it.

Then reboot. Report the state of `crond`, `atd` and `rsyslog` afterwards, and
say for each one why it is in that state. Report the same for `sshd` and
`chronyd`, the two network services the machine came with, which must still
start on their own. Check whether any unit failed on the way up.

Finish by putting `servera` back as you found it. Every one of the three must
end running and starting at boot, and nothing may be left beyond reach.

To check:

- Which two commands produced your two listings? Why does a service that is
  installed but never started appear in only one of them?
- Which command answers "is it running now" and which answers "does it start at
  boot"? What does each print?
- `crond` is running but will not start at boot. Which command left it in that
  state, and what does the boot-time part of the change actually remove?
- What happened when you tried to start `rsyslog`? Which file did the change
  create, and what does it point at?
- Compare a disabled service with the one you put beyond reach. Which of the
  two can still be started by hand?
- Which command listed what must start before `sshd`? Which option of it turned
  the question round for `NetworkManager`?
- After the reboot, which of the five services is running? Explain the three you
  set, and name the command that proves the two network services still start on
  their own.
- Which command lists units that failed during startup? Did anything fail?
- Everything is back as you found it. Which two commands did you use to prove
  that, and what did each print for the three services?

## 8. Who are you, said the Caterpillar

**Objective: RHCSA-10.3, key-based authentication for SSH. Also RHCSA-1.4.**

The `operator1` user on `servera` reaches `serverb` many times a day, under two
different accounts there. Neither login should require a password.

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

## 9. Two, Five and Seven paint the roses

**Objective: RHCSA-3.3, process script inputs. Also RHCSA-3.1, 3.2 and 3.4.**

The same three questions get asked of every machine before a change window.
Somebody has been typing them out one host at a time. The answer is one script
that takes the list of machines from whoever runs it.

Prepare with `lab start scripts-loops`. Everything here runs on `workstation`,
which can already reach `servera` and `serverb` as `student` over SSH.

That gives you `workstation` with `servera` and `serverb` reachable and nothing
of your own written.

Start with the skeleton. Create an executable script in `~/bin`, with the first
line that names the interpreter. Run it by its name alone, from a directory
that is not `~/bin`, and say why the name alone is enough.

Then the arguments. The script takes between one and ten machine names. Called
with none, it must print a line telling the reader how to call it, send that
line to standard error and not to standard output, and leave with an exit code
of your choosing that is not zero. The line must carry the name of the script
as it was run, taken from the shell and not typed in.

Then the loop. For every name you were given, connect over SSH and collect two
things into variables: the short host name that the machine reports for itself,
and whether `sshd` is active there.

Then the decision. For each machine, print one message if the short host name
matches the name you passed and a different one if it does not. Print a third
if the service is not active there. Count the machines that passed everything.

Then the exit code. The script leaves with `0` when every machine passed and
with a code of your choosing that is not zero when any did not. Run it three
ways and read the exit code each time: with `servera` and `serverb`, with no
arguments at all, and with one name that no machine answers to.

Finish with the report. The last line the script prints says how many machines
were checked and how many passed, with the arithmetic done in the shell.

To check:

- Which positional parameters formed the list for the loop? Why did the tenth
  need braces, and which parameter gave you the script name?
- Called with no arguments, which test decided that? Write it out and say what
  the operator checks.
- How did you send the usage line to standard error? Show the redirection, and
  say how you proved it went there and not to standard output.
- Which construction captured the output of a command into a variable? Write
  out one of your two.
- Your check on the service uses an exit code, not text. Which command produced
  the code, which variable held it, and which operator compared it?
- Which two comparison operators did you use, one for numbers and one for
  strings? Why can you not use one for both?
- Show the arithmetic that counted the machines that passed. Which form did the
  shell need?
- Run the script three ways and report the exit code each time. Which line of
  the script produced each one?

## 10. One card in the whole pack

**Objective: RHCSA-1.3, regular expressions. Also RHCSA-1.7 and 1.11.**

Apache on `servera` has a configuration file of several hundred lines, most of
them comment. You have to answer several questions about it, then leave a note
of how you did it.

Prepare with `lab start regexes-regex`, then `ssh student@servera`.

That gives you `servera` with Apache installed and running, and its
configuration at `/etc/httpd/conf/httpd.conf`.

Start with the noise. Show the configuration file without the comments and
without the blank lines, using a single expression and one option that turns a
match into a rejection. Count what is left.

Then the anchors. List only the lines of that file that begin with a directive,
with no leading space of any kind. Then list only the lines that end in a
digit. Say which character does each job and why the expressions should be
protected from the shell.

Then the multipliers. Find the lines of the file that carry a number of exactly
two digits, and then the lines that carry a number of three or more. Use the
counted form, not a string of repeated wildcards.

Then the two syntaxes. Write one expression matching either of two directive
names, first in the basic syntax and then in the extended one. Run both against
the file and show that they agree.

Then the pipeline and the tree. Apply an expression to the output of a command
instead of a file, to name the processes the web server runs under. Then search
every file under `/etc/httpd` for a directive, ignoring case.

Then the documentation. Without leaving the machine, find the manual page that
lists the character classes you used and the one that describes the options of
the search command. Name the section number of each, and the command that
searches manual pages by keyword.

Finish with the note. Create a file in your home directory holding one line per
expression, with a short description of each. Use the editor, and use its own
search to reach a directive in the configuration file while you work.

To check:

- Write out the expression that removed comments and blank lines. Which option
  turned the match into a rejection, and how does the bracket work?
- Which character anchors a match to the start of a line and which to the end?
  Which of your expressions could the shell change without quotation marks,
  and how?
- Write out the counted multiplier you used. How does it differ between the
  basic and the extended syntax?
- Which expression did you apply to the output of a command? Which character
  joined the two, and why does the search command need no file name there?
- Which option searched the whole directory tree, and which one ignored case?
  How do you tell from the output which file each match came from?
- Which manual page lists the character classes, and which section holds it?
  Which command finds a manual page by keyword when you do not know the name?
- In the editor, which key starts a search inside a file and which one repeats
  it? Which keys write the file and which leave it without saving?

## 11. A watch that tells the day of the month

**Objective: Part of RHCSA-7.1, `at` and `cron`. Also RHCSA-1.2.**

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

## 12. The jury writes it all down

**Objective: RHCSA-4.7, logs and journals. Also RHCSA-4.8 and 7.4.**

Something went wrong on `servera` overnight and nobody can say what. The
journal is thrown away at every reboot, and the clock follows whatever source
the image shipped with, so the times in the log files are not to be trusted.

Prepare with `lab start logs-systemd`, then `ssh student@servera`.

That gives you `servera` with its journal held in memory only.

Start with the reading. Answer four questions from the journal, one command
each. Which entries came from the process the kernel started first. Which
entries carry a priority of warning or worse. Which entries belong to `sshd`.
Which entries were written in the last ten minutes. Say which option answered
each question.

Then one entry in full. Take one of the entries you found and show it with
every field the journal holds for it, not the single line. Name two fields that
the short form hides.

Then the preservation. Arrange that the journal survives a reboot. Reboot, then
show the directory that now holds it and the file names inside. Say which
setting made this work without your editing any configuration file.

Then the limit. Cap the space the preserved journal may use, using a file of
your own in a drop-in directory so that `/etc/systemd/journald.conf` stays as
it is. Apply it without a reboot, then find the line the journal service writes
about its own limits and read your value back from it.

Then the boots. Show the entries from the boot before the current one, and say
which option and which argument did that. Explain why the same command would
have told you nothing before you preserved the journal.

Then the clock. Point the machine at `classroom.example.com` as its time
source, with the option that makes the first measurements quickly. Turn
synchronisation on and prove that the machine is now following that source,
naming the command that shows which source is in use and the character that
marks it.

Finish with a message of your own. Send one line to the log at a priority you
choose, then find it twice: once through the journal and once in a file under
`/var/log`. Say which service put it in the file.

To check:

- Which four options of `journalctl` answered the four questions? Which option
  shows one entry with every field, and name two fields the short form hides.
- Which directory did you create to preserve the journal, and which command
  moved the current journal into it? What are the files inside called?
- Which file did you write for the size limit, and which parameter did you
  set? Which command applied it without a reboot, and which line reports it?
- Which option showed the previous boot? What does a negative argument to it
  mean, and why was it useless before?
- Which file names the time source and which option did you add to the line?
  Which command lists the sources, and which character marks the one in use?
- Your own message reached both the journal and a file. Which service wrote the
  file, which file was it, and which rule sent it there?

## 13. A caucus race with no winner

**Objective: RHCSA-4.4, heavy processes. Also RHCSA-4.5 and 4.6.**

A colleague reports that `servera` has gone slow. Something is eating the
processors, and the machine is running under a tuning profile chosen for a
different job.

Prepare with `lab start tuning-nice`, then `ssh student@servera`.

That gives you `servera` idle, with nothing of yours running on it.

Start with the baseline. Record how many processors the machine has, and the
load average over the last one, five and fifteen minutes. Say what the load
figure counts and what it means to divide it by the processor count.

Then the load. Start enough background work to saturate every processor, using
a command that never finishes. Wait, then read the load average again and
compare it with the baseline. Show a live view sorted by processor use, and
name the key that sorted it.

Then the heavy ones. Produce a listing that gives, for each of those processes,
the identifier, the share of processor it is using, its politeness value and
its command name, in one command. Say which column carries the politeness
value.

Then the politeness. Start one more piece of the same work, but polite from the
start, at a value of your choosing above zero. Compare its share of processor
with the others after a minute. Then make one of the earlier processes politer
than it was, and show the change. Then try, as `student` and without escalating,
to make it less polite again, and record what you are told.

Then the profile. Report the active tuning profile and where its definition
lives, then check that the running machine matches it. Read the definition of
one other profile, note two settings that differ, and switch to it so that the
change survives a reboot. Confirm the switch.

Then the tidy up. Stop every piece of the work you started, by command name and
not by identifier, and show that nothing of yours is left. Report the load
average again and say why it does not fall at once.

Finish by rebooting, then confirm which profile is active and that no work of
yours came back.

To check:

- Which command counted the processors, and which one gave you the three load
  figures? What does a figure of one per processor mean?
- Write out the listing command with its four fields. Which column carries the
  politeness value and what is its default?
- Which command starts a process already polite, and which one changes a
  process that is running?
- As `student`, try to make a process less polite. What are you told, and which
  users may do it?
- Which command reports the active profile, and which one checks that the
  running machine matches it? Where do the shipped profiles live?
- Which command stopped all the work at once by name? Name a second command
  that would have done the same job.
- Reboot `servera`. Which profile is active, and why did the change survive?
  Which directory would you have copied a profile into to edit it?

## 14. The Cheshire Cat fades, but the grin stays

**Objective: RHCSA-10.4, SELinux modes. Also RHCSA-10.5 and 10.8.**

A web page on `servera` is refused and nobody knows why. Before anything is
changed, the evidence has to be gathered, and whatever is done in the end must
leave SELinux enforcing.

Prepare with `lab start selinux-booleans`, then `ssh student@servera`.

That gives you `servera` with Apache installed and its configuration for user
directories switched off.

Start with the survey. Report the mode SELinux is running in and the mode its
configuration file asks for, naming both commands and the file. Say why one of
the three values that file mentions is no longer allowed.

Then the arrangement. Turn on the Apache feature that publishes a directory
from each account's home, and start the service. Put one page in the right
place under the `student` home directory and give the directories the search
permission that a web server needs to walk down to it. Fetch the page from
`servera` itself with `curl`, so that no firewall stands in the way. It will
fail.

Then the labels. Before changing anything, record three things: the context of
the running web server processes, the context of the page you created and the
context of the directory the server normally serves from. Name the command for
each. Say which field of a context matters here and what that field is called.

Then the proof. Put SELinux into permissive mode for the running system only,
without touching the configuration file. Fetch the page again. Say what the
result tells you, then put the mode back and confirm that the file was never
changed. Explain why permissive is a diagnosis and not a fix.

Then the switch. Find the setting in the policy that permits what you want,
without being told its name. Turn it on for the running system only, fetch the
page and see it work. Reboot. Fetch it again and watch it fail. Then set it
properly and prove it across a second reboot. Then list only the settings
whose value differs from the value the policy ships with. Yours must be the
only one there.

Finish by putting everything back. The setting returns to its shipped value,
the service is stopped and stays stopped, and SELinux is enforcing. Prove all
three after a final reboot.

To check:

- Which command reports the current mode and which file holds the mode for the
  next boot? Which command shows the context of a running process, and of a
  file?
- Compare the context of your page with the context of the directory Apache
  normally serves from. Which field differs, and what is that field called?
- Which command put SELinux into permissive mode for the running system only?
  What did the fetch return afterwards, and what did that prove?
- Which two commands list the policy settings and their values, and how did
  you narrow the list?
- Which command turned the setting on for the running system only? What
  happened to it at the reboot, and which option made it survive the second?
- Which command lists only the settings that differ from the shipped values?
  What does it show once you have put everything back?

## 15. Alice grows, and the bottle is put away

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

## 16. No room, said the Hare, and there was plenty

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
- Does `lsblk` show any partitions on `/dev/sdb`? Should it?
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

## 17. The treacle well, and what was drawn from it

**Objective: Part of RHCSA-6.1, XFS and ext4. Also RHCSA-1.6, 4.10 and 5.5.**

Configuration on `servera` is to be copied off the machine every week. The
copies need somewhere of their own to sit while they are made, and they must
end up on `serverb`, where the machine that made them cannot reach them.

Prepare with `lab start archive-manage`, then `ssh student@servera`.

That gives you `servera` with a spare disk at `/dev/sdb` and nothing on it.

Start with the storage. Put a GPT label on `/dev/sdb` and cut two partitions of
about 1 GiB each. Give one an XFS file system and the other an ext4 file
system. Mount them on `/staging` and `/holding`. Both must come back after a
reboot, and neither may be named by its device file in `/etc/fstab`. The two
lines use different values in the final field. Work out why.

Then the archives. From `/etc`, make three archives into `/staging`, one
uncompressed and two compressed by different algorithms. Compare the three
sizes. List the contents of one compressed archive without uncompressing it,
and say why you did not have to name the algorithm to do that.

Then the awkward part. The contexts that SELinux keeps on files are not in your
archives. Make a fourth archive of `/etc/ssh` that does carry them, then list
it. Extract it into an empty directory under `/holding` and check that nothing
outside that directory was touched.

Then the transfer. Copy the compressed archive you like best to `serverb` and
leave it in the `student` home directory there. Do it twice, once with a
command that opens a session and takes instructions, and once with a command
that takes source and destination on one line.

Then the second run. Change one file under `/etc`, remake the archive, and
bring the whole of `/staging` across to `serverb` again with a command that
copies only what has changed. Run it once to say what it would do and once for
real. Say what the difference in output tells you.

Finish by rebooting `servera` and showing that both file systems come back at
the right places, and that the archives are still there.

To check:

- Which command labelled the disk and cut the partitions? Which command did you
  run afterwards so that the device files appeared?
- Which two commands made the file systems? Which value did you put in the
  first field of `/etc/fstab`, and which command gave it to you?
- The last field of the two `/etc/fstab` lines differs. What is that field for,
  and what does each file system need there?
- Which command listed a compressed archive without uncompressing it? Why did
  the option naming the algorithm not matter there?
- Which option carried the SELinux contexts into an archive? Name two other
  kinds of extended attribute that are left out by default.
- Which two commands moved a file to `serverb`? Which one opens a session, and
  which subcommand of it sends a file up, not down?
- Which command copied only the changes? Which two options did you use for the
  usual case, and which one made it say what it would do without doing it?
- Reboot `servera`. Are both file systems mounted? Which command shows you the
  type of each and where it came from?

## 18. A door that opens only when asked

**Objective: RHCSA-6.2, network file systems. Also RHCSA-6.3 and 4.9.**

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

Then the service itself. Report whether the automounter is running and whether
it starts at boot, naming the command that answers each question. Stop it,
then try to reach a key and say what you get. Start it again and try once
more.

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
- Which two commands report whether the automounter is running and whether it
  starts at boot? What does each print?
- With the automounter stopped, what happens when you reach a key? Does the
  directory under `/feeds` still exist?
- After removing `weekly`, why did you restart `autofs`? Which key still works?
- A plain `/etc/fstab` entry mounts at boot and stays mounted. Name two problems
  that causes when the server is across a network.

## 19. The flamingo lent for the game, and given back

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

## 20. What is the use of a book without pictures

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

## 21. A passage of their own to the garden

**Objective: RHCSA-8.1, IPv4 and IPv6 addresses. Also RHCSA-8.2 and 8.4.**

`servera` and `serverb` are each given a second network card for traffic that
must not share the main network. Both address families are wanted on it, each
machine needs a name the other can use, and nothing but the pair may reach the
services on that link.

Prepare with `lab start net-edit`, then `ssh student@servera`.

That gives you both machines with a second interface whose profile is
configured for DHCP and does not come up.

Start with the survey. On `servera`, name the second interface, its hardware
address and the profile that is bound to it. Say how you can tell from one
listing that the profile is not active. Do the same on `serverb`.

Then the addresses. Give `servera` the address `172.24.250.30` and `serverb`
the address `172.24.250.40`, both with a 24 bit prefix and no gateway, by
changing the existing profile and not by adding a new one. Add an IPv6 address
from the documentation range to each as well, on the same profile. Both
families must come up on their own after a reboot. Prove that each machine
reaches the other on both families.

Then one change made by hand. Make one further change to `servera` by editing
the profile file under `/etc/NetworkManager/system-connections` instead of
using the command. Then make it take effect without a reboot, in two steps.
Name both.

Then the names. Arrange that `ping serverb-link` on `servera` reaches
`serverb` on the new address, and that `ping servera-link` on `serverb` reaches
`servera`. Do it without a name server. Say which command tests the answer the
way an ordinary program would see it, and which two commands would ignore your
arrangement altogether.

Then the restriction. On `serverb`, arrange that traffic arriving from
`servera` on the new network is handled by a zone that permits more than the
default, while everything else keeps the default treatment. Show which zones
are in use and what each one permits. Make the arrangement survive a reboot.

Finish by rebooting both machines, then checking every address, both names and
the zone arrangement without touching anything first.

To check:

- Write out the command that set the IPv4 address on the existing profile.
  Which setting had to change besides the address, and what would happen if it
  did not?
- Which file did you edit by hand, and what is its name based on? Which two
  commands did you run afterwards, and what does each one do?
- Which file carries the two names? Which command resolves a name the way an
  ordinary program does, and which two commands go straight to a name server
  and ignore that file?
- Which command reports the zone a machine treats as its default, and which one
  lists the zones that have an interface or a source attached?
- Which option attached the traffic from `servera` to a zone, and what did you
  give it? Why is a prefix length part of that value?
- Which option made the firewall change permanent, and which command applied it
  to the running firewall? What happens if you use the first without the second?

## 22. Begin at the beginning, said the King

**Objective: RHCSA-7.6, bootloader. Also RHCSA-4.1 to 4.3, 7.3 and 1.5.**

`servera` has to be brought up in three different ways this week: once with
SELinux relaxed for a single boot, once in a state where almost nothing is
running, and once as usual. Nothing but the last of the three may be left
behind.

Prepare with `lab start boot-grub`. Work from the `servera` console in the lab
interface, because you cannot see the boot menu over SSH.

That gives you `servera` booting normally, with more than one entry in its boot
menu.

Start with the survey. Record four things: the target the machine starts in,
the index of the boot menu entry it uses, the kernel arguments that entry
carries, and the SELinux mode. Name the command for each.

Then one boot only. Reboot, interrupt the countdown, and edit the entry so that
this boot alone brings SELinux up relaxed. Log in and show that the mode has
changed while the file that sets it has not. Reboot again with no changes and
show that the mode is back.

Then the same thing made to stick. Add the same argument to the default entry
from the running system, so that it applies at every boot. Reboot and show that
it did. Then take it off again and reboot once more to prove that it is gone.

Then a different target for one boot. Reboot, interrupt the countdown and start
the machine in the target that repairs a system. You will be asked for a
password. Log in there, say which file systems are mounted and whether the root
file system is writable, then let the boot carry on to the usual target.

Then the default target. Change the target the machine starts in to the
graphical one and reboot. Report what the machine reports about its default,
what kind of login you actually get and why the two do not disagree. Then set
it back.

Then the accounts. In the usual target, log in at the console as `student` and
then reach another account two ways, once carrying your own environment across
and once starting a fresh one. Say which of the two you get with no option, and
which one the course tells you to prefer.

Finish by shutting the machine down properly and starting it again from the lab
interface. Confirm the target, the boot entry, the kernel arguments and the
SELinux mode all match what you recorded at the start.

To check:

- Which key opens the editor in the boot menu, which line did you add to, and
  which keys start the boot afterwards?
- Which argument relaxed SELinux, and which command reported the result? What
  does the configuration file say while that argument is in force?
- Which command added the argument to the default entry for good? Which option
  took it away again, and which argument did that option need?
- In the target that repairs a system, which command listed the mounted file
  systems? Was the root file system writable, and what would you have run if
  it were not?
- Which command reports the default target and which one changes it? Which two
  commands reach another account, and which of them starts a fresh login?

## References

[rhlc]: https://access.redhat.com/community/learn

1. Red Hat, ["Red Hat Training & Certification"][rhlc], on the Red Hat Customer
   Portal, which records the closure of the Red Hat Learning Community.
   Retrieved 2026-07-30.
