# Which way you ought to go: hints for the practice challenges

These hints belong to the optional challenges in
[`practice.md`](practice.md). None of it is required for ICT257. Nothing here
is marked and nothing here appears in an examination.

**No answers are given.** You will not find a command here. You will not find
an option, a configuration line or a file path that settles a question. A hint
names the chapter and section where the material is taught. It may restate the
problem in plainer words. It may name the idea you are missing. The rest is the
exercise. The Cat tells Alice which way to go. He does not walk it for her.

Attempt a challenge properly before you open a hint. Read the task twice. Try
the manual pages. Get something wrong first. A hint opened too early costs you
the part of the work that teaches most. An hour spent stuck is worth more than
five minutes spent reading.

Each challenge below has one, two or three tiers. Each tier stays hidden until
you click it. Open them in order and stop as soon as you can carry on alone.
The easier challenges have fewer tiers, because a pointer is usually enough.
The harder ones have three. The table below says how many each one has.

Section numbers refer to version 10.0 of both courses. "RH134 chapter 11,
section 3" means the third section of the eleventh chapter of Red Hat System
Administration II. [`coverage.md`](coverage.md) maps every objective to its
sections.

## Contents

| # | Challenge | Difficulty | Hints |
| --- | --- | --- | --- |
| 1 | [The pool of tears, and another beside it](#1-the-pool-of-tears-and-another-beside-it) | Doable | 1 tier |
| 2 | [A small door, and one sentence from the Queen](#2-a-small-door-and-one-sentence-from-the-queen) | Moderate | 3 tiers |
| 3 | [Everybody has won, and all must have prizes](#3-everybody-has-won-and-all-must-have-prizes) | Doable | 1 tier |
| 4 | [The bottle marked drink me, and where it came from](#4-the-bottle-marked-drink-me-and-where-it-came-from) | Moderate | 3 tiers |
| 5 | [A cake marked eat me, for one guest only](#5-a-cake-marked-eat-me-for-one-guest-only) | Doable | 1 tier |
| 6 | [Clean cup, move down](#6-clean-cup-move-down) | Moderate | 3 tiers |
| 7 | [The White Rabbit must not be late](#7-the-white-rabbit-must-not-be-late) | Doable | 1 tier |
| 8 | [Who are you, said the Caterpillar](#8-who-are-you-said-the-caterpillar) | Doable | 2 tiers |
| 9 | [Two, Five and Seven paint the roses](#9-two-five-and-seven-paint-the-roses) | Moderate | 3 tiers |
| 10 | [One card in the whole pack](#10-one-card-in-the-whole-pack) | Doable | 1 tier |
| 11 | [A watch that tells the day of the month](#11-a-watch-that-tells-the-day-of-the-month) | Moderate | 3 tiers |
| 12 | [The jury writes it all down](#12-the-jury-writes-it-all-down) | Moderate | 3 tiers |
| 13 | [A caucus race with no winner](#13-a-caucus-race-with-no-winner) | Moderate | 3 tiers |
| 14 | [The Cheshire Cat fades, but the grin stays](#14-the-cheshire-cat-fades-but-the-grin-stays) | Moderate | 3 tiers |
| 15 | [Alice grows, and the bottle is put away](#15-alice-grows-and-the-bottle-is-put-away) | Hard | 3 tiers |
| 16 | [No room, said the Hare, and there was plenty](#16-no-room-said-the-hare-and-there-was-plenty) | Hard | 3 tiers |
| 17 | [The treacle well, and what was drawn from it](#17-the-treacle-well-and-what-was-drawn-from-it) | Hard | 3 tiers |
| 18 | [A door that opens only when asked](#18-a-door-that-opens-only-when-asked) | Doable | 1 tier |
| 19 | [The flamingo lent for the game, and given back](#19-the-flamingo-lent-for-the-game-and-given-back) | Moderate | 3 tiers |
| 20 | [What is the use of a book without pictures](#20-what-is-the-use-of-a-book-without-pictures) | Hard | 3 tiers |
| 21 | [A passage of their own to the garden](#21-a-passage-of-their-own-to-the-garden) | Moderate | 3 tiers |
| 22 | [Begin at the beginning, said the King](#22-begin-at-the-beginning-said-the-king) | Hard | 3 tiers |

## 1. The pool of tears, and another beside it

<details>
<summary>The Cat points the way (where to look in the courseware)</summary>

Everything is in RH124 chapter 9, section 1, including the operator table and
what happens when a redirection meets a pipeline. The typing stage at the end
belongs to RH124 chapter 2, section 5.

</details>

## 2. A small door, and one sentence from the Queen

<details>
<summary>The Cat points the way (where to look in the courseware)</summary>

The whole challenge sits in RH124 chapter 10. Section 3 covers privileged
access and the shape of a rule. Section 7 covers groups. Section 9 covers
password ageing and how the course says to close an account.

</details>

<details>
<summary>The Caterpillar asks back (a question to reframe the task)</summary>

Read the ageing stage as two independent settings on one account. One of them
takes effect at the next login. The other takes effect a fixed number of days
after a password has expired, and nobody has to act for it to bite.

For the leaver, the marker's question is short. You blocked one way in. Name
the way in that is still open, and say what the course recommends instead.

</details>

<details>
<summary>Still down the rabbit hole (concepts, and the stages people fail)</summary>

One command sets every ageing parameter the challenge asks for. RH124 chapter
10, section 9 introduces it with a warning about how to read its name. The same
command reads your work back afterwards.

For the privilege stage, RH124 chapter 10, section 3 prints one restricted rule
as a worked example. Take its shape and change the parts that name the group,
the account the command runs as and the command itself.

A wrong turn to avoid. Test a locked account from a prompt that is already
privileged and you will see no refusal at all. You will conclude that the lock
failed. Both worked examples in the course start somewhere else.

</details>

## 3. Everybody has won, and all must have prizes

<details>
<summary>The Cat points the way (where to look in the courseware)</summary>

RH124 chapter 11, section 5 has the arithmetic, the starting permissions and
the default value. RH134 chapter 1, section 1 covers the rest. It gives the
order in which a login shell reads its startup files. It also says where a
setting that must reach every account belongs.

</details>

## 4. The bottle marked drink me, and where it came from

<details>
<summary>The Cat points the way (where to look in the courseware)</summary>

RH124 chapter 12. Sections 1 and 3 cover querying a package, installing it and
reading the record of what you did. Section 5 covers repository files, the keys
inside them and switching a repository on and off.

</details>

<details>
<summary>The Caterpillar asks back (a question to reframe the task)</summary>

Three separate ideas are in play here, and the challenge tests all three. A
repository can be defined. A repository can be selected for the length of one
command. A repository can be left in a state that outlives the command and the
reboot. Sort the stages of the task into those three ideas before you start.

A marker would ask, for each stage, which of the three you were working in.

</details>

<details>
<summary>Still down the rabbit hole (concepts, and the stages people fail)</summary>

Every key of the repository file you need is demonstrated in RH124 chapter 12,
section 5. The keys are on separate lines and each does one job. That same
section also covers the persistent mechanism.

Reaching a repository for one command only is an option of `dnf` itself, given
on the same line as the upgrade.

The listing command hides a disabled repository until you ask it for
everything. That is why the last stage asks you to run it two ways.

</details>

## 5. A cake marked eat me, for one guest only

<details>
<summary>The Cat points the way (where to look in the courseware)</summary>

RH124 chapter 13, section 1 covers the remotes, and section 3 covers the
applications. The distinction the whole challenge turns on, between something
installed for the machine and something installed for one account, is stated in
both.

</details>

## 6. Clean cup, move down

<details>
<summary>The Cat points the way (where to look in the courseware)</summary>

RH124 chapter 11. Section 1 explains what each permission means on a directory,
which is what the diagnosis stage rests on. Section 5 has the special
permissions. The two extra names come from RH124 chapter 7, section 3.

</details>

<details>
<summary>The Caterpillar asks back (a question to reframe the task)</summary>

Two of the requirements are not ordinary permissions, and both are set on the
directory instead of on the files inside it. One governs the group that a new
file is born with. The other governs who may delete a file in a directory that
several people can write to.

A marker would ask why neither of them reached the file you made first.

</details>

<details>
<summary>Still down the rabbit hole (concepts, and the stages people fail)</summary>

RH124 chapter 11, section 5 gives both in one table, with an octal form and a
symbolic form for each. A long listing shows each of them by replacing a letter
you already know, and it changes case when the underlying letter was absent.

For the diagnosis stage, look again at the parent directory. The permission you
take away has a second name when it applies to a directory, and section 1 gives
that name. Nothing about the file itself changes. That is the point.

</details>

## 7. The White Rabbit must not be late

<details>
<summary>The Cat points the way (where to look in the courseware)</summary>

RH124 chapter 16. Section 1 has the two listings and explains the values of the
state column. Section 3 has the dependency listing, its reverse form, and the
state that puts a unit beyond reach of anybody.

</details>

## 8. Who are you, said the Caterpillar

<details>
<summary>The Cat points the way (where to look in the courseware)</summary>

RH124 chapter 19, section 3 gives a worked client configuration file that does
most of what the first stage asks for. Host key checking and its values,
fingerprints, scanning a key and the two known-hosts files are all in section 1
of the same chapter.

</details>

<details>
<summary>The Caterpillar asks back (a question to reframe the task)</summary>

Two identities are being proved here, and they run in opposite directions. One
of them is yours, and it is what lets you in without a password. The other
belongs to the machine you are reaching, and it is what stops you arriving
somewhere else. Separate the two before you touch anything, and keep asking
which one each stage is about.

Then ask what has to be trusted, and by whom, before a strict client will
connect at all. A marker would ask where that trust is recorded, and whether
one account or the whole machine holds it.

</details>

## 9. Two, Five and Seven paint the roses

<details>
<summary>The Cat points the way (where to look in the courseware)</summary>

RH134 chapter 1. Section 3 covers the interpreter line, positional parameters
and sending a message to the error channel. Section 5 covers exit codes, the
loop, the tests and the arithmetic.

</details>

<details>
<summary>The Caterpillar asks back (a question to reframe the task)</summary>

The script has to work with what the course teaches and nothing more. That is
why the challenge caps the input at ten names. Ask yourself which positional
parameters RH134 chapter 1, section 3 actually teaches you to reach, and
whether that set covers the stated limit.

A marker would ask two things. What the script does when you give it nothing,
and how it decides that a remote service is running without reading any text.

</details>

<details>
<summary>Still down the rabbit hole (concepts, and the stages people fail)</summary>

The tenth parameter catches people. RH134 chapter 1, section 3 prints two
expansions of it side by side, and only one of them is right. The same section
covers the parameter that carries the script name.

The service check turns on an exit code and not on output, and RH134 chapter 1,
section 5 is where exit codes are introduced. That section also separates
numeric comparison from string comparison, and gives the arithmetic form. Read
it whole and decide for yourself which stage of the task needs which.

</details>

## 10. One card in the whole pack

<details>
<summary>The Cat points the way (where to look in the courseware)</summary>

RH134 chapter 2, section 1 has the anchors, the character classes, the counted
multipliers and the table that separates basic syntax from extended syntax.
Manual page sections and searching by keyword are RH124 chapter 3, section 1.
The editor is RH124 chapter 8, section 1.

</details>

## 11. A watch that tells the day of the month

<details>
<summary>The Cat points the way (where to look in the courseware)</summary>

RH134 chapter 3, section 1 for the one-off job and for inspecting the queue.
RH134 chapter 4, section 5 for a recurring job that belongs to the machine
instead of to a person. RH134 chapter 4, section 3 for the tidying.

</details>

<details>
<summary>The Caterpillar asks back (a question to reframe the task)</summary>

A job that belongs to the machine is written differently from a job that
belongs to a person. RH134 chapter 4, section 5 shows the two formats close
enough together to compare.

The tidying is not a job you write. Something already on the system runs it on
a schedule you did not set. Your part is one rule, in one file, in the right
directory. A marker would ask which directory keeps that rule safe from a
package update.

</details>

<details>
<summary>Still down the rabbit hole (concepts, and the stages people fail)</summary>

RH134 chapter 4, section 5 says plainly which file you must never edit, and
names the directory to use instead. Keeping one job to a file is what turns
removal into a single deletion later.

For the tidying rule, RH134 chapter 4, section 3 names the seven columns of the
line and demonstrates several types. Two of the types manage a directory, and
they behave differently when the directory is already there. Choose
deliberately and be ready to say why, because one of them can empty the
directory you have been filling.

The task tells you to restore both intervals afterwards. That instruction is
also the hint for how to prove the cleanup without waiting a week.

</details>

## 12. The jury writes it all down

<details>
<summary>The Cat points the way (where to look in the courseware)</summary>

RH134 chapter 5. Section 5 for reading the journal, section 7 for preserving it
and capping it, section 9 for the clock. The message you send yourself, and the
service that files it, belong to section 3.

</details>

<details>
<summary>The Caterpillar asks back (a question to reframe the task)</summary>

Three of the four reading questions are options of one command. The fourth is
not an option at all, and RH134 chapter 5, section 5 lists the kind of thing it
is near the end.

Preserving the journal needs no editing of any configuration file. The service
decides for itself once one thing exists on disk, and section 7 says why. A
marker would ask why reading the previous boot was pointless before that.

</details>

<details>
<summary>Still down the rabbit hole (concepts, and the stages people fail)</summary>

For the size cap, RH134 chapter 5, section 7 names the parameter prefixes and
says which store each one governs. Choose the prefix that matches the store you
have just created. The service writes its own limits into the journal when it
starts, so your value comes back to you out of the journal itself.

For the clock, section 9 explains which directive names a single source. It
also gives the option on that line that makes the first measurements quickly.
The listing of sources marks the one in use with a single character. The same
section prints the legend for every character it can show.

</details>

## 13. A caucus race with no winner

<details>
<summary>The Cat points the way (where to look in the courseware)</summary>

RH134 chapter 9. Section 1 for the tuning profiles, where the shipped ones
live, where an edited one belongs and how to switch. Section 3 for politeness
values and for who is allowed to change them in which direction. The load
average and the live view are RH124 chapter 15, section 7.

</details>

<details>
<summary>The Caterpillar asks back (a question to reframe the task)</summary>

Politeness runs on a scale whose ends read backwards. A high value means the
process gives way. One command starts work at a chosen value and a different
command changes work that is already running.

The refusal you are asked to record is a rule about direction, not about
ownership. A marker would ask which direction an unprivileged user may move a
value on a process of their own.

</details>

<details>
<summary>Still down the rabbit hole (concepts, and the stages people fail)</summary>

The listing with four named fields is demonstrated in RH134 chapter 9,
section 3. Read the whole section before you write anything, because it also
settles the direction question you were asked to record.

For the profiles, RH134 chapter 9, section 1 covers every question the
challenge puts to you. Work out which of them are separate questions and which
are the same question asked twice. The switch is already persistent when you
make it, so ask what else the reboot might have undone.

</details>

## 14. The Cheshire Cat fades, but the grin stays

<details>
<summary>The Cat points the way (where to look in the courseware)</summary>

RH134 chapter 6. Section 1 for the modes, the configuration file and the
contexts of a process and a file. Section 5 for the setting you have to find.
Section 7 for reading the evidence when something is refused.

</details>

<details>
<summary>The Caterpillar asks back (a question to reframe the task)</summary>

The fix here is not a relabelling. Nothing is in the wrong place. The policy
already knows about this arrangement and ships it switched off, so your job is
to find the switch without being told its name. RH134 chapter 6, section 5
shows how to narrow the list to a manageable size.

A marker would ask why permissive mode is a diagnosis and not a repair.

</details>

<details>
<summary>Still down the rabbit hole (concepts, and the stages people fail)</summary>

The settings can be listed two ways. One listing prints a name and a value. The
other adds a description and a second value, and the two bracketed values are
not the same thing. Work out which is which before you answer the last check
bullet. The stage where you set the switch twice turns on that difference.

A third form of the second listing shows only what you have changed. The
challenge ends by asking what it prints once you have put everything back, and
that is a genuinely open question. Report what your machine actually printed.

</details>

## 15. Alice grows, and the bottle is put away

<details>
<summary>The Cat points the way (where to look in the courseware)</summary>

RH134 chapter 11, section 3 for growing a volume and its file system. Section 5
for taking a physical volume out of a group. The partition work comes from
RH134 chapter 10, section 1, which is also the only place in either course that
the removal subcommand appears.

</details>

<details>
<summary>The Caterpillar asks back (a question to reframe the task)</summary>

Before you change anything, draw the machine as it stands. Physical volumes at
the bottom, then the volume group, then the logical volume, then the file
system on top. Mark on your drawing which of those layers each stage of the
task touches.

A marker would ask two things. What must still be allocated once both of the
old physical volumes have left. And which layer each size report you quote is
actually measuring.

</details>

<details>
<summary>Still down the rabbit hole (concepts, and the stages people fail)</summary>

These are the stages people fail.

**Sizing the new physical volume.** Work the number out on paper before you cut
the partition. If you get it wrong, the move stage fails and the command after
it refuses as well. That failure is the lesson of the challenge, so do not look
for a way around it.

**The file system.** RH134 chapter 11, section 3 is the whole of this stage.
Read it and count how many separate acts it asks of you. The same section
covers XFS and ext4, so compare the two commands and note what each one expects
to be handed.

**The order of retirement.** RH134 chapter 11, section 5 presents the commands
in one order. Do not memorise it. Work out from what each one does why no other
order can succeed. Taking the partitions off the disk comes after all of them.
RH134 chapter 10, section 1 warns that the subcommand acts at once, with no
confirmation.

</details>

## 16. No room, said the Hare, and there was plenty

<details>
<summary>The Cat points the way (where to look in the courseware)</summary>

RH134 chapter 11, section 1 for building the three LVM layers and for the two
ways of sizing a volume. RH134 chapter 10, section 3 for swap, for its line in
the mount table and for priority.

</details>

<details>
<summary>The Caterpillar asks back (a question to reframe the task)</summary>

The disk must carry no partition table at all. RH134 chapter 11, section 1
permits this in a single sentence and then never demonstrates it. You are
working from one line of prose. Every worked example does the opposite.

The retreat is the harder half. Undo the swap in the reverse of the order you
built it. A marker would ask what would have failed at the next boot had you
left one of those steps out.

</details>

<details>
<summary>Still down the rabbit hole (concepts, and the stages people fail)</summary>

These are the stages people fail.

**The whole-disk physical volume.** Every worked demonstration in RH134 chapter
11 cuts a partition before anything else. The permission you need sits in a
short note beside them. Find that note and trust it.

**Sizing the volume.** RH134 chapter 11, section 1 gives two forms with a
worked example of each. One is in bytes. The other is in a unit of the volume
group's own. Read the extent size off the machine before you convert between
them. Percentage forms you may have met elsewhere are not taught here, so do
not reach for them.

**The two mount table lines.** One field differs in kind between them. Ask what
that field normally holds, and then ask whether swap can have one at all. RH134
chapter 10, section 3 settles it, and also gives the field that sets priority.
For the order of the retreat, ask what a line that names a device which has gone
would do at the next boot. That question settles the order for you.

</details>

## 17. The treacle well, and what was drawn from it

<details>
<summary>The Cat points the way (where to look in the courseware)</summary>

RH134 chapter 10, section 1 for the disk label, the partitions, the two file
systems and the mount table. RH134 chapter 7, section 1 for the archives. RH134
chapter 8, sections 1 and 3 for the three ways of moving a file to `serverb`.

</details>

<details>
<summary>The Caterpillar asks back (a question to reframe the task)</summary>

Sort the requirements into three piles before you begin. Some of them are about
how a file system is identified and checked. Some are about what an archive
carries besides the file contents. Some are about how a transfer behaves. Each
pile is answered in a different section of the courseware.

A marker would ask why the last field of your two mount table lines is not the
same value.

</details>

<details>
<summary>Still down the rabbit hole (concepts, and the stages people fail)</summary>

These are the stages people fail.

**The last field of the mount table lines.** RH134 chapter 10, section 1 says
what that field is for, and gives a value for each of these two file systems by
name. Work out from what the field controls why the two differ.

**The extended attributes.** RH134 chapter 7, section 1 lists the kinds of
extended attribute the archiving command can be told to carry. The check bullet
asks you to name two kinds you did not use, so read all of them and ask which
are on by default.

**Listing a compressed archive.** RH134 chapter 7, section 1 settles this in
one sentence near the end. Find it, then say in your own words what the command
relies on instead.

For the final transfer, read RH134 chapter 8, section 3 in full. It says which
options it regards as standard, and it covers the rehearsal that the challenge
asks you for. Rehearse first, every time, on every machine you will ever
administer.

</details>

## 18. A door that opens only when asked

<details>
<summary>The Cat points the way (where to look in the courseware)</summary>

RH134 chapter 15, section 3 covers both files and both kinds of map. It also
covers the mount options and the wildcard form that this challenge forbids.
Section 1 of the same chapter explains why a plain mount table entry is a poor
choice when the storage sits across a network.

</details>

## 19. The flamingo lent for the game, and given back

<details>
<summary>The Cat points the way (where to look in the courseware)</summary>

RH134 chapter 14. Section 3 for port labels, including the options that add,
remove, modify and list them. Section 1 for the firewall, and for the
difference between what is in force now and what comes back after a reboot.

</details>

<details>
<summary>The Caterpillar asks back (a question to reframe the task)</summary>

The hard part is choosing the port, and the challenge makes you do it twice. A
port that another service already owns will not do. Neither will a port that
already carries the label you were going to add, because then you would have
added nothing. Inspect ranges as well as single numbers.

A marker would ask, after every stage, what the listing of local changes shows.

</details>

<details>
<summary>Still down the rabbit hole (concepts, and the stages people fail)</summary>

These are the stages people fail.

**Choosing.** RH134 chapter 14, section 3 prints the ports that already carry
the web server's label. Any of those would let you skip the whole exercise, so
read the list before you choose, and avoid every entry on it.

**The move.** One option of the labelling command modifies a binding, and it is
the wrong one here. It changes which label sits on a port. It will not shift a
service from one port number to the next. Two other options do the move between
them.

**The rollback.** Nothing is handed back until it is gone from the policy, from
the firewall and from the application's own configuration file. The listing of
local changes proves the first. The zone listing proves the second. And a
service that is stopped is not the same thing as a service that stays stopped.

</details>

## 20. What is the use of a book without pictures

<details>
<summary>The Cat points the way (where to look in the courseware)</summary>

RH134 chapter 10, section 1 for the disk, the file system and the mount table
entry. RH134 chapter 6, section 3 for labelling that belongs to the policy
instead of to the file. RH134 chapter 14, section 1 for the firewall.

</details>

<details>
<summary>The Caterpillar asks back (a question to reframe the task)</summary>

Four layers stand between a browser on another machine and a file on a disk.
The storage has to be there. The service has to be running and pointed at the
right place. The policy has to permit the read. The network has to let the
request through. Test each layer on its own, in an order of your choosing, and
write down what you expect before you look.

A marker would ask, for each failure you meet, which single layer could have
produced it.

</details>

<details>
<summary>Still down the rabbit hole (concepts, and the stages people fail)</summary>

These are the stages people fail.

**The first field of the mount table entry.** RH134 chapter 10, section 1 says
what Red Hat prefers there and why. It also names two commands that report the
value. The reason matters more than the value.

**The two ways of setting a context.** RH134 chapter 6, section 3 demonstrates
both. The challenge asks you to relabel afterwards precisely so that the wrong
choice reveals itself. Read the section and work out in advance which one will
still be standing.

**Reading the refusal.** RH134 chapter 6, section 7 names the log file that
carries the summary, and the command that the summary itself tells you to run.
Take that command's advice carefully. The same section warns that it can be
technically correct and still wrong for your situation.

**Persistence.** More than one thing has to survive the reboot, and each has
its own way of being made to survive it. Write the list down before you reboot,
not afterwards.

</details>

## 21. A passage of their own to the garden

<details>
<summary>The Cat points the way (where to look in the courseware)</summary>

RH124 chapter 18. Section 1 covers changing a profile from the command
line. Section 3 covers editing the profile file by hand and making the change
take effect. Section 5 covers names and the commands that test them. The zones
are RH134 chapter 14, section 1.

</details>

<details>
<summary>The Caterpillar asks back (a question to reframe the task)</summary>

The profile is already there and is configured for an address it never
receives. You change that profile. You do not add another one. Besides the
address itself, one further setting has to change, and the challenge asks you
to say what would go wrong without it.

A marker would ask which of the three name lookup commands actually reads the
file you edited, and why the other two do not.

</details>

<details>
<summary>Still down the rabbit hole (concepts, and the stages people fail)</summary>

These are the stages people fail.

**The setting beside the address.** RH124 chapter 18, section 1 states in a box
what goes wrong when you leave it alone. Read the box, then ask how many times
that warning applies to this task.

**The hand edit.** Two commands follow it and they do different jobs. RH124
chapter 18, section 3 works through the whole sequence and shows the state of
the machine after each step. Ask which piece of state is still stale after the
file has been saved, and which piece changes only later.

**The zone.** RH134 chapter 14, section 1 tabulates what each shipped zone
permits, so choose one that genuinely permits more than the default does. The
harder half is the value you hand to the option that attaches traffic to a
zone. Decide first how wide a match you want, then find out from that section
what form the value takes.

</details>

## 22. Begin at the beginning, said the King

<details>
<summary>The Cat points the way (where to look in the courseware)</summary>

RH134 chapter 12. Section 1 for the boot menu editor and for making a kernel
argument stick. Section 3 for targets, for the default target and for shutting
down properly. The argument that relaxes SELinux is named in RH134 chapter 6,
section 1. Switching accounts is RH124 chapter 10, section 3.

</details>

<details>
<summary>The Caterpillar asks back (a question to reframe the task)</summary>

The same change is made twice, once for a single boot and once for every boot.
The point of the challenge is that you see the difference. The single boot goes
through the menu editor. The persistent one goes through a command on the
running system.

Ask the machine to print everything it knows about one boot entry. Several
fields come back, and more than one of them looks like a way of naming the
entry. Compare them, then work out which of them the persistent command is
willing to accept.

A marker would ask what the SELinux configuration file said while the argument
was in force.

</details>

<details>
<summary>Still down the rabbit hole (concepts, and the stages people fail)</summary>

These are the stages people fail.

**The persistent change.** RH134 chapter 12, section 1 shows the fields of a
boot entry and shows where to read them off the machine. It also shows the
option that takes an argument away again, which is fussy about what you hand
it. Read the worked example there before you guess.

**The targets.** RH134 chapter 12, section 3 covers both the repair targets and
the graphical one. It gives a table and it gives a dependency listing. Compare
what each target is said to need with what it is said to want, and predict from
that what your machine will do. Then record what it actually did.

**Switching accounts.** RH124 chapter 10, section 3 covers both forms and what
separates them. Read it, then decide which form each half of that stage is
asking you for.

</details>
