# Optional reading, week by week

These pages sit alongside the schedule in [`lessons.md`](lessons.md). None of
it is required and none of it is examined. Reach for a row when a session has
left you wanting the same idea from a second angle. I have put some exam tips
in here as well, so do read this page at least.

Each row says what a page is and why it is worth your time. **Objective** names
the entry in [`objectives.md`](objectives.md) that it supports. A dash means the
page sets context and carries no objective.

Some of these pages are old. Where one is still exact, it is here because the
idea has not moved. Where one is wrong for RHEL 10, the note under the table
says so. Read the note.

## Week 1: Getting oriented, the command-line assistant and the shell

Getting oriented, the command-line assistant and the shell.

RH124 01.01 sets context and teaches no skill, so we cover it briefly. Most of
what follows fills that context out, for anyone who wants it.

| Page | Why it is worth your time | Objective |
| --- | --- | --- |
| [The Unix family tree on one diagram](https://en.wikipedia.org/wiki/Unix-like#/media/File:Unix_history-simple.svg) | One picture puts Linux beside BSD, Solaris and macOS and colours each branch by how open its source was. You leave knowing that Linux inherited the habits of Unix without inheriting its code, which is why what you learn on RHEL travels to systems Red Hat never wrote | — |
| [What motivates free software licensing](https://opensource.com/law/13/8/motivation-free-software-licensing) | It separates copyleft licensing from permissive licensing and says what each one is trying to protect. That distinction is why RHEL can be sold under a subscription while its source stays open | — |
| [HashiCorp closes a door](https://www.runtime.news/hashicorp-closes-a-door/) | A company moves eight projects off an open source licence and its founder defends the decision on the record. It turns the licence categories above into commercial pressure, which is the same pressure behind the subscription you register a system against in week 2 | — |
| [Bash prompt generator](https://bash-prompt-generator.org) | Assemble a prompt and watch which escape produces which piece of it. Afterwards you can read the prompt in front of you and say which user you are, which host you are on and whether you hold root | RHCSA-1.1 |

The prompt generator earns its place for the escapes and not for the colours.
RHEL 10 sets `PS1` to `[\u@\h \W]\$ ` in `/etc/bashrc`, so four escapes carry
everything the prompt tells you. Mind the capital in `\W`, which prints the
last part of the working directory where lowercase `\w` prints all of it. And
`\$` prints `#` for root and `$` for everyone else. That is worth knowing
before week 3, when you start switching users. Set `PS1` in your own
`~/.bashrc` and it follows you into every login shell.

The HashiCorp page is one issue of a weekly newsletter. The licensing story
runs at the top and everything under it belongs to that week in 2023. The story
has moved on since. Terraform was forked as OpenTofu within weeks, and IBM
completed its purchase of HashiCorp in February 2025. Read it as a record of
the decision and not as the state of play.

## Week 2: Manual pages, registering systems and the file-system hierarchy

Manual pages, registering systems, the file-system hierarchy and working with
files.

| Page | Why it is worth your time | Objective |
| --- | --- | --- |
| [Searching the manual pages](https://teaching.idallen.com/cst8207/19w/notes/140_man_page_RTFM.html) | The exam is closed book, and the manual pages may be the only documentation you still have. This page teaches the search itself, so you practise `man -k`, the section numbers and how to read a SYNOPSIS line as a grammar | RHCSA-1.11 |
| [One inode, two names](https://en.wikipedia.org/wiki/Hard_link#/media/File:Hard_Link_Illustration.svg) | A single diagram of two directory entries pointing at one inode. Look at it before you read anything longer, because most confusion about links clears up once you have seen this picture | RHCSA-1.9 |
| [Understanding hard and soft links on Linux](https://devconnected.com/understanding-hard-and-soft-links-on-linux/) | It builds links up from inodes, so you learn why a hard link survives the deletion of the original name and a symbolic link does not. It then shows you how to find links already sitting on a system | RHCSA-1.9 |
| [Prefixes for binary multiples](https://physics.nist.gov/cuu/Units/binary.html) | NIST sets kibi, mebi and gibi against kilo, mega and giga in one table. Read it once and the gap between the size printed on a disk and the size your tools report stops looking like an error | — |

The links page is from 2019 and it has not aged, because inodes have not
moved. Its opening section is looser than the rest. It treats a 512-byte disk
sector as a file-system block, and the two are not the same thing. Start at the
section on inodes and filenames. Everything from there on is exact.

Prove the NIST table on your own machine. `df -h` counts in powers of 1024 and
`df -H` counts in powers of 1000, so one disk reports two different sizes. It
pays off again in week 10, when you size partitions and logical volumes of
your own.

### One name, several manual pages

A manual page is addressed by a name and a section number, and the number is
not decoration. Search for a name and you may get several answers. Cut the
descriptions away and what is left is the point.

```
[student@workstation ~]$ man -k ^passwd | cut -d' ' -f1,2
passwd (1)
passwd (1ossl)
passwd (5)
```

Section 1 holds user commands and section 5 holds file formats. So `passwd` in
section 1 is the command that changes a password, and `passwd` in section 5 is
the file that stores account records. Same name, two different things, and the
one you want depends on what you are being asked.

Drop the `cut` and each line carries a one line summary as well, which is worth
reading once. Mind the middle line either way. RHEL 10 answers this search with
a page OpenSSL ships, and its section name is `1ossl` and not `1ssl`.

This is where marks go. Plain `man passwd` does not weigh the sections up
against each other. It walks a fixed order and stops at the first page it
finds. On RHEL 10 that order opens 1, 1p, 8, 2, 3 and reaches 5 a long way
down, and the `SECTION` line in `/etc/man_db.conf` is what sets it. Section 1
therefore wins here, and section 1 is the command. Read that order again and
note that 8 is consulted before 2, so it is not the numbers in sequence. A
student sent to read about the format of the password file opens the wrong
page, sees a command, and reads on without noticing. Ask for the section you
want.

```
[student@workstation ~]$ man 5 passwd
```

RH124 chapter 3 teaches this search as `man -k`, and mentions `apropos` as
another name for the same thing. It also shows `man -f`, which lists the
sections for an exact name and nothing else. The `^` in the search above is a
regular expression anchor, so it matches names beginning with `passwd` instead
of names containing it anywhere. Week 3 covers that syntax properly.

The exam gives you the manual pages and no internet, so knowing how to find
the right page is worth practising now. That is RHCSA-1.11.

### Reading a long manual page away from the terminal

`man -t` turns up once in RH124, in a lab step about printing, and no exercise
asks you to make a PDF. It is here because it is useful. `bash(1)` runs to
hundreds of pages and nobody reads that in a pager.

```
[student@workstation ~]$ man -t bash > /tmp/x
[student@workstation ~]$ file /tmp/x
/tmp/x: PostScript document text conforming DSC level 3.0
[student@workstation ~]$ ps2pdf /tmp/x /tmp/x.pdf
```

`man -t` does not make a PDF. It makes PostScript, which is why the second
command exists. The `file` command is what tells you that, and it is a small
lesson in itself. A file's type is decided by what is inside it and not by the
name you gave it.

One thing to know before you try it. `ps2pdf` arrives with the `ghostscript`
package, which is not installed by default, so install it first. Unlike
`nmtui` in week 6, this one will not simply be there.

This is for studying and not for the day. The exam has no internet and no
reason to make a PDF.

### What `ls -li` proves about a hard link

The diagram in the table above shows the shape of a hard link. This shows the
numbers, and the numbers are the part you have to read. Make a file with
something in it, then give it a second name.

```
[student@workstation ~]$ echo hello > file.txt
[student@workstation ~]$ ln file.txt file-hlink.txt
[student@workstation ~]$ ls -li *.txt
54614180 -rw-r--r--. 2 student student 6 Aug  1 23:45 file-hlink.txt
54614180 -rw-r--r--. 2 student student 6 Aug  1 23:45 file.txt
```

Two numbers carry the lesson. The first column is the inode number, and it is
identical on both rows. There is one file and it has two names. The number
just before the owner is the link count, and it says 2 for the same reason.
Your own inode number will differ, because it is whatever the file system had
free.

So a hard link is not a copy. Nor does it point at a name. Both entries are
equal and neither of them is the original. The count is how the file system
knows how many names are left.

Now remove the name you made first.

```
[student@workstation ~]$ rm file.txt
[student@workstation ~]$ ls -li file-hlink.txt
54614180 -rw-r--r--. 1 student student 6 Aug  1 23:45 file-hlink.txt
[student@workstation ~]$ cat file-hlink.txt
hello
```

Nothing broke. The inode number has not moved, the count is down to 1 and the
six bytes are still there to read. Removing a name removes the name and
decrements the count. Two things have to be true before the storage goes back.
The count has to be zero, and no process may still hold the file open.
`unlink(2)` on your own machine states both. So
delete the last name of a file that a running program is reading and the data
stays where it is until that program closes it. There was no original to lose,
and that is the whole contrast with the other kind of link. A symbolic link
points at a name, so removing that name leaves it dangling.

RH124 07.03 teaches both kinds. It uses `ls -il` for the test above, so that
two names showing one inode number settle the question between them. Its
symbolic link example uses `ls -l` instead, because a symbolic link has no
inode to share and so there is nothing to compare. It also gives you two
limits. A hard link works on a regular file alone, so `ln` refuses a directory.
And a hard link cannot reach across a file system. The course states that
second rule and never shows you what it looks like, so here it is. That is
RHCSA-1.9.

Try to put the second name in `/dev/shm`.

```
[student@workstation ~]$ ln file.txt /dev/shm/file-hlink.txt
ln: failed to create hard link '/dev/shm/file-hlink.txt' => 'file.txt': Invalid cross-device link
```

Read that error instead of guessing at it. Nothing here is a permission and
nothing here is missing. `/dev/shm` is a tmpfs and it is mounted separately
from your home directory, so it is a second file system on every RHEL 10
machine without you building one. Run `df` and it has a line of its own. That
is the check RH124 07.03 puts in front of you, and RH124 14.01 shows `df -h`
again when it identifies the file systems on a machine.

The mechanism from the first block is what costs you this. A directory entry
holds an inode number, and an inode number means something only inside its own
file system. So an entry in one file system cannot name an inode in another.
The number would land on a different file there, or on nothing at all. The
kernel refuses rather than write an entry that points at the wrong thing.

That is the practical reason to reach for a symbolic link. A symbolic link
stores a path and not an inode number, so a file system boundary means nothing
to it. Take that as the rule of thumb rather than a table of differences to
memorise. If the two names have to sit on separate file systems, only one kind
of link can do the job.

Week 4 carries the other half of this. There you learn that deleting a file is
governed by the directory holding the name and not by the file. The link count
is what decides whether the data goes with the name.

### The size of a symbolic link is the path inside it

The other kind of link has no inode to share. It holds a path as its contents,
and everything else about it follows from that one fact. Assume `file.txt` in
your home directory and a `dir` directory beside it. There are three ways to
reach the same place, and two of them turn out to be the same thing.

```
[student@workstation ~]$ pwd
/home/student
[student@workstation ~]$ ln -s ~/file.txt dir/file-s.txt
[student@workstation ~]$ ls -l dir/file-s.txt
lrwxrwxrwx. 1 student student 22 Aug 17 23:17 dir/file-s.txt -> /home/student/file.txt
```

Now build the same link from inside `dir`, with a relative path.

```
[student@workstation ~]$ rm dir/file-s.txt
[student@workstation ~]$ cd dir
[student@workstation dir]$ ln -s ../file.txt file-s.txt
[student@workstation dir]$ ls -l file-s.txt
lrwxrwxrwx. 1 student student 11 Aug 17 23:18 file-s.txt -> ../file.txt
```

And once more from inside `dir`, this time with the tilde.

```
[student@workstation dir]$ rm file-s.txt
[student@workstation dir]$ ln -s ~/file.txt file-s.txt
[student@workstation dir]$ ls -l file-s.txt
lrwxrwxrwx. 1 student student 22 Aug 17 23:19 file-s.txt -> /home/student/file.txt
```

Read the size column. It says 22 twice and 11 once. Count the characters in
`/home/student/file.txt` and you get 22. Count `../file.txt` and you get 11.
The size of a symbolic link is the length of the text it holds, because that
text is the whole of it.

That single fact explains the rest. It is why a symbolic link crosses a file
system where a hard link cannot. A path is text and it reads the same
anywhere, while an inode number does not. It is also why a symbolic link can
end up pointing at nothing. The path is worked out when the link is followed
rather than when it is made, so nothing checks the target at the time.

It is why the first and third commands built one and the same link from
different directories. The shell expands `~` before `ln` runs, so `ln` was
handed `/home/student/file.txt` on both occasions. Only the middle command
stored anything that depends on where you were standing.

One more row to read correctly. The mode says `lrwxrwxrwx` on every symbolic
link and it always will. Those bits are never consulted. What decides whether
you may read the data is the mode on the target, so do not take that row as a
world writable file.

So which path should you store? An absolute path survives the link being moved
and breaks when the target moves. A relative path survives the two being moved
together, which is what happens when a tree is copied, archived or relocated,
and it breaks when the distance between them changes. Neither one is correct.
Relative suits a link and a target that travel as a unit. Absolute suits a
target at an address you control and do not expect to move. RHEL ships plenty
of both, so do not go hunting for a house style.

RH124 07.03 teaches `ln -s`, the `l` at the front of the mode and what happens
when the target goes away. It does not set out this trade-off, and its own
examples are all absolute. One of the RH124 review labs asks you for a short
relative path and never says why. So take the syntax from the course and the
choice from here.

Then go and settle it yourself, because ten minutes in the lab beats a rule
you half remember. Build both links. Move `dir` elsewhere and see which one
still resolves. Put it back, move `file.txt` instead, and see which one breaks
this time.

## Week 3: Editing text, redirecting output, users and groups

Editing text, redirecting output, users and groups.

| Page | Why it is worth your time | Objective |
| --- | --- | --- |
| [Thinking in pipelines](https://effective-shell.com/part-2-core-skills/thinking-in-pipelines/) | It draws the three streams as files with numbers on them, 0 for standard input, 1 for standard output and 2 for standard error, then builds pipelines out of those numbers. Redirection stops being syntax you memorise once you can see where each stream goes | RHCSA-1.2 |
| [Understanding the /etc/shadow file](https://www.cyberciti.biz/faq/understanding-etcshadow-file/) | It walks the colon-separated fields one at a time, including the ageing fields that `chage` writes. Afterwards you can read a shadow entry yourself and check your own work instead of trusting the command that produced it | RHCSA-9.2 |

Read the shadow page beside `man 5 shadow` on a lab system. The manual page
records nine fields and the page describes eight, because it passes over the
reserved field at the end. Correct one other thing as you read. The page
presents yescrypt as a Debian default. RHEL 10 sets `ENCRYPT_METHOD YESCRYPT`
in `/etc/login.defs`, so a password you set in our lab is stored as a `$y$`
hash. The `$6$` example on the page is SHA-512, which is what RHEL used before.
Check `/etc/login.defs` yourself and see.

That site sits behind a bot check, so it may ask you to prove you are a person
before it loads.

### Building a hash you can take apart

A shadow entry is hard to learn from, because you cannot see where any of it
came from. So build one instead. `openssl passwd` takes a password and a salt
and prints the result, which means every field has a known origin.

```
[student@workstation ~]$ echo "redhat" | openssl passwd -stdin -6 -salt iGMT29O4MP5ngN4a
$6$iGMT29O4MP5ngN4a$.1FWXa2f2g6YPLK3ri7NtduRh.xlZjEEK/4p6gL8vj.jl7JmemyG8mKbb02C2ZIXNRRi.DV8M8o2HTxKVgmRo/
```

Three fields, each opened by a dollar sign. First the algorithm, then the salt
you handed in, then the hash. RH124 10.09 takes a real entry apart, and
`crypt(5)` on your own machine lists the formats.

Now the part that catches people out. `-6` asks for SHA-512, which is what
RHEL 9 stored. Look in `/etc/shadow` after running this and your own password
starts `$y$` instead, as the note above says. Neither one is broken. You have
made the older format deliberately, and `openssl passwd` on RHEL 10 has no
yescrypt option at all, so it cannot make the newer one.

What does not carry over is the number of fields. Only the first one is fixed.
The leading letter names the algorithm, and the algorithm then decides what
comes after it. A `6` is SHA-512, a `5` is SHA-256 and a `y` is yescrypt.

SHA-512 gives you three parts, which is what you have just built.

```
$6$salt$hash
```

Yescrypt gives you four, and the extra one sits second.

```
$y$j9T$salt$hash
```

That extra part tunes how hard yescrypt works, and whatever set the password
picked it for you. RH124 10.09 prints it and says plainly that a different
algorithm need not carry such a part at all. So count the dollar signs before
you name anything in a real record. Take the third part of a `$y$` entry for
the hash and you have picked up the salt.

Why is a salt in there at all? Hashing is deterministic, so one password gives
one value every time. Somebody can therefore work out the values for every
common password once, then match a stolen hash against that list in seconds.
The salt is random text folded in before the hashing happens. The same
password then comes out differently on each machine, and a list built anywhere
else buys nothing here. The salt is no secret. It sits in the clear beside the
hash, because the system needs it again to check your next login.

Three practical notes. Neither course teaches `openssl passwd`, so no exercise
will ask for it. It is here because a hash you built yourself is the quickest
way to stop a shadow entry looking like noise. The `passwd (1ossl)` page you
met in week 2 is OpenSSL's command index and not this command, so ask for
`openssl-passwd(1ossl)` when you want the options. And `openssl` is a package
of its own, in BaseOS but in no install group, so a minimal machine wants
`dnf install openssl` first. Your lab machine has it, which is why that search
in week 2 found a `1ossl` page to list.

Last, do not carry the shape of that command into real work. Piping a password
through `echo` writes it into your shell history in plain text. Here you are
demonstrating with a password everybody in the room already knows. Set a real
one with `passwd` and let the tool choose the salt.

### The same record, read two ways

The note above sends you to `man 5 shadow` so you can check your own work. This
is the other end of that. `chage -l` prints the same record in English, and you
may run it on your own account without becoming root.

```
[student@workstation ~]$ chage -l student
Last password change                                    : never
Password expires                                        : never
Password inactive                                       : never
Account expires                                         : never
...output omitted...
```

Three more lines follow the four above. They carry the minimum, the maximum
and the warning period, and on a fresh lab account they read 0, then 99999,
then 7. Every line but two comes from one numbered field of the shadow entry,
and the numbering is the one `shadow(5)` uses. The labels below are shortened,
because the real ones run to half a terminal width.

| Line of `chage -l` | Field in `/etc/shadow` |
| --- | --- |
| Last password change | 3 |
| Password expires | none, worked out |
| Password inactive | none, worked out |
| Account expires | 8 |
| Minimum number of days | 4 |
| Maximum number of days | 5 |
| Number of days of warning | 6 |

Those two exceptions matter. Neither is stored anywhere. Both are dates that
`chage` works out from the numbers that are stored. Expiry is the day of the
last change plus the maximum age. Inactivity is that expiry plus the
inactivity period. The arithmetic is fixed, so leave the stored fields alone
and those two lines read the same next month as they do today. In this listing
the change date is not recorded at all, so nothing counting forward from it can
be worked out either, and both come back as `never`.

Which brings us to that word. Nothing in the file says `never`. The field is
simply empty, and `chage` prints `never` when it finds nothing there. RH124
10.09 says as much of an empty maximum and an empty expiry date. So a student
reading the raw line first meets `::` and wonders what broke. Nothing did.

Setting the expiry shows the gap from the other side.

```
[root@workstation ~]# chage -E $(date -d +180days +%F) student
```

`chage -E` wants a date, and working out what the date will be in 180 days is
nobody's idea of a good time. So `date -d` does the arithmetic and `+%F` hands
it back in the form `chage` accepts. RH124 10.09 pairs those two commands the
same way over a 30 day window. What the file then stores is not a date at all.
Field 8 holds a count of days since 1 January 1970, so the two views sit a long
way apart even when they agree.

That is the habit worth taking from this. Make the change with `chage`, then
read the line back out of `/etc/shadow` and satisfy yourself that the field you
meant to touch is the field that moved.

### Where the defaults come from

The section above reads one account's record. This is the template every new
account is cut from. RH124 10.05 says outright that `useradd` takes its
configuration from `/etc/login.defs`, so this is the answer to a question the
`chage -l` output raises and does not settle. Where did those numbers come from
before anybody set them?

Look at the file with the comments stripped out, because they outnumber the
settings roughly four to one.

```
[student@workstation ~]$ grep -v ^# /etc/login.defs | grep -v ^$
...output omitted...
UMASK           022
HOME_MODE       0700
PASS_MAX_DAYS   99999
PASS_MIN_DAYS   0
...output omitted...
PASS_WARN_AGE   7
UID_MIN                  1000
UID_MAX                 60000
SYS_UID_MIN               201
SYS_UID_MAX               999
...output omitted...
GID_MIN                  1000
GID_MAX                 60000
...output omitted...
ENCRYPT_METHOD YESCRYPT
...output omitted...
```

That pair of greps is worth more than the output it produced. The first drops
comment lines, the second drops blank ones, and what is left is what the file
actually sets. Most configuration files on a RHEL system are mostly comments,
so you will want this often.

Know what it misses before you trust it. `^#` catches a `#` in the first column
only, so an indented comment survives. `^$` catches an empty line only, so a
line holding two spaces survives. Neither one touches a comment written after a
setting on the same line, and a file that marks its comments with something
other than `#` comes through untouched. One expression handles the first two
faults.

```
[student@workstation ~]$ grep -Ev '^[[:space:]]*(#|$)' /etc/login.defs
```

The `-E` asks for extended syntax, which week 7 covers. Even then, open the
file itself before you decide that any filter has shown you all of it.

Now read three of those lines back against the previous section. `PASS_MAX_DAYS`
is where 99999 came from. `PASS_MIN_DAYS` is where 0 came from, and
`PASS_WARN_AGE` is where 7 came from. One file is the template and the other is
the record for one person, which is why editing this changes nothing about
accounts that already exist. RH124 10.09 covers those three parameters.

The UID pair earns a sentence of its own. Regular accounts start at 1000, and
the numbers below that belong to the system. RH124 10.05 sets out the whole
range, with 0 for root, 1 to 200 assigned statically and 201 to 999 handed out
to software that wants an unprivileged identity. Knowing where the boundary
sits means you can read `/etc/passwd` and tell a person from a service without
looking anything up.

One more line, because it is the reason this block is here at all. RHEL 10
sets `ENCRYPT_METHOD YESCRYPT`, which is what the note earlier in this week
told you and what produces a `$y$` hash. Older transcripts of this file show
`SHA512` there, and they are RHEL 9 or earlier. If you go looking for `SHA512`
in your own copy you will find it, on the `HMAC_CRYPTO_ALGO` line, which is
used by a PAM module and has nothing to do with how your password is stored.

### Four times `ALL`, four different questions

RH124 10.03 shows one line, and it is the line that gives you `sudo` at all.

```
%wheel        ALL=(ALL:ALL)       ALL
```

The `%` marks a group rather than a user, so this is a rule about everyone in
`wheel`. What follows answers four questions in a fixed order, and three of the
four answers are spelled the same. That is what makes the line look like an
incantation instead of a sentence.

| Where it sits | The question it answers | What `ALL` says there |
| --- | --- | --- |
| Before the `=` | On which machines does the rule hold? | On every machine that reads this file |
| In the brackets, left of the colon | As which user may the command run? | As anybody |
| In the brackets, right of the colon | With which group may it run? | With any group |
| After the brackets | Which commands are permitted? | Every command |

Read it that way and the point arrives. Each `ALL` is a separate decision, and
each one happens to be the widest answer available to its own question. They
are not one permission written four times.

Now look at your own machine, because RHEL 10 does not ship the line above.
What the `sudo` package installs is shorter.

```
%wheel  ALL=(ALL)  ALL
```

Three answers rather than four. The brackets hold no colon and no group, so the
third question is never put. A command then runs with the primary group of
whichever user it runs as, and the missing half is exactly what would let you
choose something else. The line arrives live rather than commented out, so
membership of `wheel` is still what grants `sudo` on RHEL 10. Run `id` and see
whether you are in it.

Both forms are valid, and you will meet both. RH124 10.03 explains the longer
one. That section is also where the course covers `visudo`, the drop-in
directory beside `/etc/sudoers` and the worked rules that use them, and the lab
in RH124 10.11 puts you to work there. Anything this page leaves out is in
`sudoers(5)` and `visudo(8)` on your own machine. Reading them there is
RHCSA-1.11 practice on a topic that is RHCSA-9.4.

### `NOPASSWD`, and what it costs you

`NOPASSWD` is not a fifth position in the rule. It is a tag fixed to the
command part, so it belongs to the last of the four and travels with it. Read
it as a property of the permission and not of the person holding it. This rule,
for these commands, asks for nothing.

```
backupsvc  ALL=(ALL)  NOPASSWD: ALL
```

You have met the tag already without noticing. The `/etc/sudoers` that RHEL 10
installs carries the same tag on a second `%wheel` line, and that line arrives
commented out. It is there to be found rather than to be used.

Why anyone wants it is easy enough. A job that runs at three in the morning has
nobody at the keyboard, so a prompt protects nothing. It only stops the job. A
backup account or a monitoring account is the ordinary case, and the need is
genuine. RH124 10.03 shows the same tag on an account belonging to a cloud
image, for the same reason.

The cost is not the missing prompt. It is the `ALL` sitting beside it. The tag
reaches exactly as far as the commands it is attached to. Attach it to one
named program and the account gains one thing it can do quietly. Attach it to
`ALL` and whatever reaches that account has the machine, whether that is a
stolen key, a service with a hole in it or somebody who found a screen left
unlocked. Nothing will be asked of them at any stage.

So the answer is not to put the prompt back, because the prompt was never going
to be answered. The answer is to keep the tag well away from `ALL`. RH124 10.03
shows the wide form on a cloud account and says what it costs, so read that
beside this.

### Where the streams go in a pipeline

A pipeline is easier to hold in your head once you count the streams. Every
command has standard input numbered 0, standard output numbered 1 and standard
error numbered 2. A pipe joins one command's stream 1 to the next command's
stream 0.

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

### Sending both streams to the same file

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
[`practice.md`](practice.md) ask you to do.

## Week 4: File permissions, RPM packages and Flatpak applications

| Page | Why it matters |
| --- | --- |
| [Linux File Permissions Illustrated](https://bytebytego.com/guides/linux-file-permission-illustrated/) | One diagram of the ten characters that `ls -l` prints. Afterwards you can point at any position in a mode string and say who it governs. RHCSA-1.10 |
| [setuid, setgid, and the Sticky Bit Explained](https://linuxize.com/post/setuid-setgid-sticky-bit/) | Each special bit does something different on a file and on a directory. That split is the hardest thing in this week, and the page ends in a table you can check yourself against. RHCSA-1.10, RHCSA-10.2 |

The ByteByteGo page is a diagram and a few lines of text. Take the diagram and
leave the rest. It describes read, write and execute for files only. Those
three bits mean different things on a directory, and RH124 11.01 is where you
learn what.

The special permissions page also shows the `find -perm` tests that locate
setuid files across a system. That is the same option RH124 14.05 teaches you
next week. It is where RHCSA-6.5 starts, because you have to find a permission
fault before you can correct it. The page adds one fact the course leaves out.
The kernel ignores setuid and setgid on shell scripts. Set the bit on a script
in the lab environment and watch it do nothing.

### A shared directory, watched from both sides

What follows is a transcript from a lab machine, taken on 1 February 2024,
with the account names changed. Two commands in it fail. Those two are the
ones worth your attention.

Build the directory as root. The group owns it, the group may write to it and
the sticky bit is set.

```
[root@workstation ~]# groupadd analysts
[root@workstation ~]# useradd -G analysts jaya
[root@workstation ~]# useradd -G analysts wenli
[root@workstation ~]# mkdir /srv/team
[root@workstation ~]# chown root:analysts /srv/team
[root@workstation ~]# chmod 775 /srv/team
[root@workstation ~]# chmod +t /srv/team
[root@workstation ~]# ls -ld /srv/team
drwxrwxr-t. 2 root analysts 6 Feb  1 09:14 /srv/team
```

The `t` prints where the other execute bit would. Now log in as the first
account and leave a file behind.

```
[jaya@workstation ~]$ cd /srv/team
[jaya@workstation team]$ touch report1
[jaya@workstation team]$ ls -l report1
-rw-r--r--. 1 jaya jaya 0 Feb  1 09:16 report1
```

Read the group on that file. It says `jaya` and not `analysts`. The group of
the directory did not carry over, so nobody else in the team may write to the
file. A shared directory that shares nothing is the usual complaint here.

Now the second account, and the first failure.

```
[wenli@workstation ~]$ cd /srv/team
[wenli@workstation team]$ touch report2
[wenli@workstation team]$ rm report1
rm: cannot remove 'report1': Operation not permitted
```

That account may write to the directory. Write permission on a directory
normally lets you unlink anything inside it. The sticky bit takes that back.
Only the owner of the file, the owner of the directory and root may remove
anything here.

The second failure comes from trying to correct the group from the wrong
account.

```
[wenli@workstation team]$ chmod g+s /srv/team
chmod: changing permissions of '/srv/team': Operation not permitted
```

`chmod` obeys the owner of a file and nobody else. Membership of `analysts`
is not ownership. Set the bit as root instead.

```
[root@workstation ~]# chmod g+s /srv/team
[root@workstation ~]# ls -ld /srv/team
drwxrwsr-t. 2 root analysts 40 Feb  1 09:19 /srv/team
```

Then make one more file from the second account and compare all three.

```
[wenli@workstation team]$ touch report3
[wenli@workstation team]$ ls -l
-rw-r--r--. 1 jaya  jaya     0 Feb  1 09:16 report1
-rw-r--r--. 1 wenli wenli    0 Feb  1 09:17 report2
-rw-r--r--. 1 wenli analysts 0 Feb  1 09:20 report3
```

Only the file made after the bit went on carries the group. Setgid governs
what happens next and repairs nothing already sitting there. That is the part
students miss, and it is why a shared directory still looks broken after the
bit is set.

Then read the mode on `report3`, because the group name is only half the
story. It says `rw-` for the owner and `r--` for the group. Everyone in
`analysts` may read that file and nobody in `analysts` may write it. Setgid
settled which group owns the file. It said nothing at all about the permission
bits, and those came from the umask, which RHEL 10 leaves at 0022 for every
user.

So a shared directory takes two repairs and not one. Put the content that is
already there right by hand.

```
[root@workstation ~]# chgrp -R analysts /srv/team
[root@workstation ~]# chmod -R g+rwX /srv/team
```

The capital `X` is the reason to write it that way. It adds execute to a
directory, and to any file that already had execute somewhere, and it leaves
an ordinary file alone. Lowercase `x` would mark every file in the tree
runnable, which is not what you meant.

Then settle what happens to the next file, because nothing above touches that.
The accounts working here need a collaborative umask, so `0002` where others
may read and `0007` where they may not. A default ACL on the directory does
the same job and neither course teaches one, so take the umask road in this
module. RH124 11.06 takes it too. That exercise sets `0007` before you start,
which is why its new files come out group writable and the ones above do not.

Two bits, one directory, opposite jobs. Setgid decides the group of new
files. The sticky bit decides who may delete an old one. Neither of them
decides a permission bit, and the umask is what does.

### Read and execute are not the same thing on a directory

On a file, `r` lets you read it and `x` lets you run it. On a directory they
mean something else, and the difference is where marks go missing. Read lets
you list the names inside. Execute lets you reach what those names point at.
You need execute to do almost anything useful, including reading a file you
already know the name of.

The quickest way to see it is to take every permission away and put them back
one at a time. Build a directory with a file in it, then remove the lot.

```
[student@workstation ~]$ chmod 0 dir
[student@workstation ~]$ ls -l dir
ls: cannot open directory 'dir': Permission denied
```

Now grant read on its own. The listing works, and nothing else does.

```
[student@workstation ~]$ chmod 400 dir
[student@workstation ~]$ ls -l dir
ls: cannot access 'dir/file.txt': Permission denied
total 0
-????????? ? ? ? ?            ? file.txt
```

That row of question marks is the lesson. The name came back, because read was
enough to list it. Everything else is unknown, because `ls` has to reach the
file itself to learn its size, its owner and its mode, and reaching it needs
execute. A directory you can list but not enter is a table of contents for a
book you cannot open.

Adding write changes nothing, which surprises people.

```
[student@workstation ~]$ chmod 600 dir
[student@workstation ~]$ rm dir/file.txt
rm: cannot remove 'dir/file.txt': Permission denied
```

Write on a directory is permission to change the list of names in it, and
deleting a file is a change to that list. So write ought to be enough. It is
not, because the kernel has to reach the entry before it can remove it, and
reaching it needs execute. Write without execute is a permission you cannot
use.

Add execute and the same command works.

```
[student@workstation ~]$ chmod 700 dir
[student@workstation ~]$ rm dir/file.txt
[student@workstation ~]$
```

Note what that last command did. The file was owned by `student` and its own
mode never changed throughout. Deleting a file is governed by the permissions
on the directory holding it, not by the permissions on the file. That is why
the sticky bit exists, and it is worth reading this section and the one above
it together.

Three things to carry into the exam. A directory almost always wants `x`
wherever it has `r`, which is why `755` and `750` are so common and `640` on a
directory is a mistake. A row of question marks in a listing means execute is
missing, not that the file is broken. And if you cannot delete a file you own,
look at the directory.

## Week 5: File systems, locating files, processes and system services

| Page | Why it matters |
| --- | --- |
| [Linux process states](https://idea.popcount.org/2012-12-11-linux-process-states/) | Stops a process from the shell and shows the state letter change in `ps`. Afterwards the `STAT` column of `ps aux` reports something you have watched happen. RHCSA-4.4 |
| [systemd "static" unit file state](https://bbs.archlinux.org/viewtopic.php?id=147964) | Answers why some units refuse to be enabled. A unit with no `[Install]` section gives `systemctl` nowhere to put the symlink. RHCSA-7.2 |
| [What is the difference between `systemctl mask` and `systemctl disable`?](https://askubuntu.com/questions/816285/what-is-the-difference-between-systemctl-mask-and-systemctl-disable) | Both look like off and they are not the same. A disabled unit still starts when something else pulls it in. A masked unit cannot start at all. RHCSA-7.2, RHCSA-4.9 |

The process states post is from 2012 and it still holds, because the kernel
state names have not moved. It stops short of the full picture. RH124 15.01
also lists the `K` and `I` states and the post does not. Read the post for the
states you can produce yourself, then take the rest from the course table. Most
of the page is about `ptrace`, which no objective asks for.

The forum answers need a filter. In the Arch thread the correct answer is post
5, not post 3. Static does not mean enabled by something else. It means the
unit file carries no `[Install]` section. Post 2 suggests deleting symlinks by
hand, which is not how you do this on RHEL 10.

The Ask Ubuntu answer is right about the symlinks, and RH124 16.03 confirms
that masking points a unit at `/dev/null`. Its second half is Ubuntu
troubleshooting. Unit files ship under `/usr/lib/systemd/system` on RHEL 10,
not `/lib/systemd/system`, and nothing there is repaired by reinstalling a
package with `apt`. Read down to the paragraph on masking and stop.

For the status output itself, stay with the course. RH124 16.02 has the table
that names every field, and its `chronyd` example is the one to study. The
`Process` line and the `Main PID` line there hold two different numbers, which
is what a service that forks looks like. Answers online tend to say that the
main process is whatever `ExecStart` named, and that example shows why the
short version is not safe.

## Week 6: Network configuration, name resolution and secure remote access

| Page | Why it matters |
| --- | --- |
| [RFC 1122](https://datatracker.ietf.org/doc/html/rfc1122) | The document RH124 17.01 names when it defines the four-layer model. Read section 1.1.3 and you will see where the layer names came from and who assigned them. RHCSA-8.1 |
| [How the TCP/IP Protocols Handle Data Communications](https://docs.oracle.com/cd/E18752_01/html/816-4554/ipov-29.html) | Follows one packet down the sending stack and back up the receiving one. Encapsulation stops being a word and becomes a sequence you can recite. RHCSA-8.1 |
| [Benefits of IPv6](https://www.catchpoint.com/benefits-of-ipv6) | Explains why RHEL 10 brings up IPv6 alongside IPv4 without being asked, and where a link-local address comes from. RHCSA-8.1 |
| [Why Authentication Using SSH Public Key is Better than Using Password and How Do They Work?](https://runcloud.io/blog/ssh-public-key-authentication) | Sets out why a key pair beats a password before you type `ssh-keygen`. Afterwards you know which half of the pair is safe to copy to a server. RHCSA-10.3 |
| [OpenSSH: ssh-add / ssh-agent Command Set Maximum Lifetime In Seconds](https://www.cyberciti.biz/faq/unix-linux-appleosx-bsd-ssh-add-agent-command-set-lifetime/) | RH124 19.03 caches your passphrase until you log out. This shows how to expire it sooner with `-t`, and why you would want to. RHCSA-10.3, RHCSA-1.4 |

RFC 1122 is long and it is a requirements document, not a tutorial. Read the
layering section and stop. Nine later RFCs update it, so treat any detail
outside that section with care.

The Oracle page belongs to a Solaris manual. The layering and encapsulation it
describes are protocol behaviour, so they carry over to RHEL 10 unchanged. Its
worked example uses `rlogin`, which RHEL 10 does not ship and no objective asks
for. Read `ssh` wherever it says `rlogin`.

Catchpoint sells network monitoring, so read the page as a vendor blog with a
real technical body inside it. The address space, link-local and stateless
autoconfiguration sections are the ones that pay off here. Routing, quality of
service and extension headers sit outside this module.

The RunCloud page gets one thing wrong. It says the server encrypts a challenge
that the client then decrypts. OpenSSH does not work that way. Your client
signs data that includes the session identifier, and the server checks that
signature against the public key in `authorized_keys`. The rest of the page
holds up.

The nixCraft page ends by recommending `keychain`. RHEL 10 does not ship it
and neither course teaches it, so skip that section. It also names RSA and DSA
keys, and OpenSSH has since dropped DSA. Take your key types from RH124 19.03.
The site challenges automated requests, so open it in a browser if a link
checker reports a failure. Everything you need about `-t` is also in the
`ssh-add(1)` manual page on your own machine, which is RHCSA-1.11 practice and
needs no network.

### `nmtui`, which the course never mentions

`nmtui` appears nowhere in RH124 and nowhere in RH134. No exercise will ask
for it and no marker expects it. It is still worth ten minutes of your time,
because it is on the exam machine and it can save you a mark.

```
[root@rhel ~]# nmtui
```

It edits NetworkManager connection profiles, which is what `nmcli` edits.
Nothing in the menu is beyond `nmcli` and nothing in it is a separate system.
The gain is narrow and it is real. A long `nmcli` line carrying an address, a
prefix, a gateway and a DNS server is easy to mistype when you are against the
clock, and the menu asks for each field by name. It also shows you the current
settings without you having to recall the query that prints them.

The tool will be there. `NetworkManager-tui` ships in BaseOS on RHEL 10, and
it is a default member of the `core` package group. Every RHEL 10 system gets
`core`, including a minimal install. You may read online that RHEL 10 removed
it. That is wrong, and we checked the package set instead of the claim.

Learn `nmcli` anyway. RHCSA-8.1 and RHCSA-8.2 are what the exam scores, and
RH124 18.01 teaches `nmcli` because that is the tool the exam expects. Chapter
17 names no configuration tool at all, so do not go hunting for one there. A
student who can only drive the menu stops dead the moment a task wants
something the menu does not offer. Use `nmtui` to fill in a long profile
safely and to read back what is set. Do not use it to avoid the command.

Red Hat's own documentation shows the two tools side by side.

| Page | Why it is worth your time |
| --- | --- |
| [Configuring an Ethernet connection](https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/10/html/configuring_and_managing_networking/configuring-an-ethernet-connection) | Red Hat builds one connection profile by several routes, with `nmcli` and with `nmtui` among them. Read those two sections one after the other and you will see that they write the same profile |

### Tools, not readings

The page below is a calculator. Reading it teaches you nothing. The exam gives
you no internet, so do not build a habit on it. Use it to check work you have
already done by hand, then move to `ipcalc`, which RHEL 10 ships in BaseOS and
RH124 17.01 teaches.

| Tool | What it does |
| --- | --- |
| [IP Calculator / IP Subnetting](https://jodies.de/ipcalc?host=203.217.187.35&mask1=30&mask2=) | Prints address, netmask and network in binary beside the decimal, with the prefix boundary marked in the bit string. The one to use while the bitwise AND is still slow |

Krischan Jodies wrote the tool at jodies.de, and it is not the `ipcalc` that
sits on your RHEL machine. The output labels line up closely and the two
programs are different, with different options. Learn the one you will have in
front of you on the day. Other subnet calculators, IPv6 validators and binary
converters are a search away and none of them adds anything to this one.

## Week 7: Shell scripts, regular expressions and scheduled jobs

| Page | What it is |
| --- | --- |
| [Exit Codes With Special Meanings](https://tldp.org/LDP/abs/html/exitcodes.html#EXITCODESREF) | The exit codes the shell has already claimed, and the 128 plus signal number rule behind a status of 130 or 137. RHCSA-3.1, RHCSA-3.4 |
| [Regular Expressions, in the GNU grep manual](https://www.gnu.org/software/grep/manual/html_node/Regular-Expressions.html) | The syntax as the `grep` command on your machine implements it, including where basic and extended expressions part company. RHCSA-1.3 |
| [Dotfiles, and which one runs when](https://samthor.au/2019/dotfiles-highlights/) | Sam Thorogood on the startup files, and why a setting works in one shell and not another. RHCSA-3.3 |

RH134 01.05 teaches the `exit` command and the `$?` variable. It does not tell
you which values are already spoken for. Read the table on that page and stop
there. The author goes on to propose keeping your own codes between 64 and 113.
That is his suggestion and no standard, so ignore it.

The grep manual is on your lab machine too. The `grep` package ships it as an
`info` document, so `info grep` opens the same text. The reader is a separate
package, so install `info` if the command is not found. Reading it there is
practice for RHCSA-1.11, and the local copy matches the version you are
running.

### Why `~/.bashrc` runs whichever way you log in

Bash reads a different startup file depending on how it was started. A login
shell, which is what you get over SSH or at a text console, reads
`~/.bash_profile`. A non-login shell, which is what you get opening a terminal
inside a desktop session, reads `~/.bashrc`. RH134 01.01 draws that
distinction.

So a setting placed in one of them ought to be missing from the other. In
practice it is not, and `~/.bashrc` runs both ways round.

The reason is not something Bash does. It is the file Red Hat ships. Look at
the `~/.bash_profile` on any lab machine and it opens by sourcing `~/.bashrc`
if that file exists. RH134 01.01 prints it. A login shell therefore reads
`~/.bash_profile`, which immediately reads `~/.bashrc`, and both files have
run before you see a prompt.

That is worth knowing for two reasons.

It tells you where to put things. Anything you want in every interactive
shell goes in `~/.bashrc`, and it will be read either way. `~/.bash_profile`
is for the few things that should happen once at login and not again in every
terminal you open.

And it tells you when the arrangement stops holding. Replace `~/.bash_profile`
with your own and drop that block, and a login shell will no longer read
`~/.bashrc`. Your aliases will work in a desktop terminal and vanish over SSH,
which is a confusing afternoon.

One limit on the word always. Both files are for interactive shells. A script
runs in a non-interactive shell and reads neither, which is why a script cannot
see an alias you defined in `~/.bashrc`. RH134 01.01 makes the interactive and
non-interactive split as well, and it is the half people forget.

## Week 8: Recurring jobs, logs, journals and keeping time

| Page | What it is |
| --- | --- |
| [Cron Examples](https://crontab.guru/examples.html) | Worked schedule expressions, each read back to you in plain English. Check that an expression says what you meant before you install it. RHCSA-7.1 |
| [Why omusrmsg is evil, and how it is fixed](https://rainer.gerhards.net/2011/07/why-omusrmsg-is-evil-and-how-it-is-fixed.html) | The author of rsyslog on the `:omusrmsg:` prefix you meet in the default `/etc/rsyslog.conf`. RHCSA-4.7 |

Crontab Guru reads five fields. System jobs in `/etc/cron.d` carry a sixth
field for the user, taught in RH134 04.05. Paste one of those lines in and the
answer comes back wrong. The site belongs to a monitoring vendor. It covers
neither the `at` command nor systemd timer units, and RHCSA-7.1 asks you for
both.

The rsyslog post dates from 2011 and it explains a line RHEL 10 ships today.
Your default `/etc/rsyslog.conf` sends `*.emerg` to `:omusrmsg:*`, and the post
says why a bare user name stopped being enough. Read it once. Leave the rest of
rsyslog to `rsyslog.conf(5)`, and to the HTML manual that arrives with the
`rsyslog-doc` package.

### Making the journal outlive a reboot

By default the journal lives in memory. Reboot the machine and the last boot
is gone. You notice this the first time somebody asks you why a server fell
over.

```
[root@rhel ~]# mkdir /var/log/journal
[root@rhel ~]# journalctl --flush
[root@rhel ~]# systemctl reboot
```

The directory is what does the work. `systemd-journald` reads `Storage=auto`
from `/etc/systemd/journald.conf`, and `auto` means write to disk whenever
`/var/log/journal` is there. You are not switching a feature on. You are
making the place it writes to. Enabling the service is not a step, because
the service already starts on every boot.

`journalctl --flush` moves what is in memory into the new directory at once.
Leave it out and the directory sits empty until the next boot, which reads
like a failure and is not one.

After the machine returns, look at the directory and then read the boot
before this one.

```
[root@rhel ~]# ls /var/log/journal
[root@rhel ~]# journalctl -b -1 -p err
```

`-b -1` selects the previous boot and `-p err` keeps errors and anything
worse. Those two options are the reason to do any of this. A machine that
cannot tell you why it went down is a machine you have to guess about.

## Week 9: SELinux, archives, secure file transfer and tuning profiles

| Page | What it is |
| --- | --- |
| [The SELinux Coloring Book](https://people.redhat.com/duffy/selinux/selinux-coloring-book_A4-Stapled.pdf) | Dan Walsh and Máirín Duffy on type enforcement, MCS and MLS, drawn as cats and dogs. Read it before RH134 06.01. RHCSA-10.5 |
| [CVE-2020-15778](https://access.redhat.com/security/cve/CVE-2020-15778) | Red Hat on the `scp` command injection flaw. It is the reason RH134 08.01 tells you to stay off the legacy SCP protocol. RHCSA-4.10 |

The colouring book is old and that does not matter here. It names no command
and no option, so there is nothing in it to go stale. It draws the labelling
model that RH134 06.01 then states in prose.

Red Hat rates the `scp` flaw Moderate. It records a fix for RHEL 8, marks RHEL
7 as will not fix and carries no entry for RHEL 9 or RHEL 10. On RHEL 10 the
`scp` command transfers over SFTP by default, so what stays exposed is the
legacy protocol you reach with the `-O` option. Use `sftp` or `rsync` and the
question does not arise. The flaw itself is not examinable. It is the reason
behind an instruction the course gives you without explaining it, and RH134
08.01 names this very page in its own list of references.

## Week 10: Partitions, swap, logical volumes and booting

Partitions, swap, logical volumes and booting.

| Page | Why it is worth reading | Objective |
| --- | --- | --- |
| [Linux on 4 KB sector disks: practical advice](https://web.archive.org/web/20210125124010/https://developer.ibm.com/tutorials/l-linux-on-4kb-sector-disks/) | Rod Smith measures what a misaligned partition costs on an Advanced Format disk. RH134 10.01 names 2048 as a safe first sector and says only that it aligns. This puts a number on getting it wrong | RHCSA-5.1 |
| [LVM volume group: what are extents?](https://unix.stackexchange.com/questions/341077/lvm-volume-group-what-are-extents) | The accepted answer explains the unit that LVM actually allocates in. It is why `lvcreate -l` and `lvcreate -L` take different numbers, and why a size rounds up | RHCSA-5.4, RHCSA-6.4 |
| [`bootup(7)`](https://man7.org/linux/man-pages/man7/bootup.7.html) | The systemd boot sequence as RHEL 10 runs it, from firmware through the initial RAM file system to the default target | RHCSA-4.2, RHCSA-7.3 |
| [Configuring and managing logical volumes](https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/10/html/configuring_and_managing_logical_volumes/index) | Red Hat's own LVM guide for RHEL 10. Use it when a `pvs`, `vgs` or `lvs` field means nothing to you | RHCSA-5.2, RHCSA-5.3, RHCSA-5.4 |

The alignment page was written long before RHEL 10, so read it for the
principle and not for the tools it names. RH134 teaches `parted`, which reads
the disk topology itself and warns you when a start position lands badly.

Read `bootup(7)` on your own machine as well, with `man 7 bootup`. That lookup
is what RHCSA-1.11 asks of you, and the exam may leave you nothing else to
work from.

### Partitioning a second disk on a machine of your own

The `parted` command takes a subcommand on the command line, so you do not
have to work interactively. Interactive mode is useful while you are
learning. Once you know what you want, one line per step is faster and it
leaves a record you can read back.

Start with the label. A GPT label needs no primary and extended distinction,
so every partition is simply a partition.

```
[root@rhel ~]# parted /dev/vdb mklabel gpt
```

Now the partitions. Both arguments to `mkpart` are positions on the disk and
neither is a length. This is where students lose marks. A partition that runs
from 1MiB to 301MiB is 300 MiB in size, not 301 MiB.

```
[root@rhel ~]# parted /dev/vdb mkpart data xfs 1MiB 301MiB
[root@rhel ~]# parted /dev/vdb mkpart logs xfs 301MiB 1501MiB
```

Starting at 1MiB keeps the first partition aligned to the underlying storage.
Sector 0 does not. Ending one partition where the next begins leaves no gap.

Wait for the new device files before you use them.

```
[root@rhel ~]# udevadm settle
[root@rhel ~]# lsblk /dev/vdb
```

Be exact about what that first command does, because it is easy to credit it
with more. It watches the udev event queue and returns once the events already
sitting in it have been dealt with. That is the whole of it. It never asks the
kernel to read a partition table again. `parted` is what tells the kernel about
the new table, and `udevadm settle` then holds you back until the device files
have caught up.

`lsblk` shows you the two partitions as children of the disk. If it shows the
disk alone, the kernel has not taken the new table, and waiting on an empty
queue will not mend that. The usual cause is something still holding the
device. Free it, ask for the reread with `partprobe` or with `partx -u`, then
run `lsblk` again. Formatting a device that does not exist yet fails in a way
that reads like a hardware problem and is not one.

Naming the partitions `data` and `logs` costs nothing and the name survives in
the GPT. On a machine with several disks it is worth the two seconds.

### When `lvremove` argues with you

You will make a mess of an LVM build sooner or later and want to start again.
RH134 11.05 gives you the order. Unmount the file system, then `lvremove`,
`vgremove` and `pvremove`, and take the `/etc/fstab` line out while you are
there. Two states the section never reaches are worth knowing. `lvremove`
refuses outright while the volume is open, and a mounted file system holds it
open. On a volume that is merely active it stops and asks you to confirm the
deactivation, which is a prompt you do not want in a script.

```
[root@rhel ~]# lvchange -an /dev/vgdata/lvdata
[root@rhel ~]# lvremove /dev/vgdata/lvdata
```

`lvchange -an` deactivates the volume and takes its device node away, so the
removal goes through with nothing to answer. Neither course teaches
`lvchange`, because in the courseware the build always works. Run `lsblk`
between steps to see where you have got to, since it prints the disks, the
volume group and the logical volumes as one tree.

## Week 11: Boot troubleshooting, firewalls and network file systems

Boot troubleshooting, firewalls, network file systems and installation.

| Page | Why it is worth reading | Objective |
| --- | --- | --- |
| [How to use the chroot command on Linux](https://www.howtogeek.com/441534/how-to-use-the-chroot-command-on-linux/) | Rescue mode drops you at a shell and expects `chroot /mnt/sysroot`. This builds a small root directory by hand, so you can see what that one command moves | RHCSA-4.3 |
| [Mounting file systems on demand](https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/10/html/managing_file_systems/mounting-file-systems-on-demand) | Red Hat's autofs chapter for RHEL 10, covering the master map, direct maps and indirect maps. It matches the file layout RH134 15.03 teaches | RHCSA-6.3 |
| [Automatically installing RHEL](https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/10/html/automatically_installing_rhel/index) | The Kickstart command reference for RHEL 10. Check a directive here before you copy one out of an older example, because several have been withdrawn | No objective |
| [Certified hypervisors and guest operating systems](https://access.redhat.com/articles/certified-hypervisors) | Which hypervisors Red Hat certifies for a RHEL 10 guest. Useful when you build a practice machine of your own outside the lab | No objective |

You will not build a chroot by hand in the exam. Knowing what the command
changes is what stops the rescue steps being a recipe you half remember.

Older Kickstart files circulate widely and most of them are from the RHEL 7
era. A file that installed a system then can fail outright on RHEL 10, so
check each directive and run `ksvalidator` over the result.

### Zones, services and the two-step

Nothing you type at `firewall-cmd` reaches anywhere until `firewalld` is
running, so check the daemon before you blame your rules. Stop the service and
the command has nobody left to speak to. It is a client, it talks to the daemon
over D-Bus, and with the daemon down it exits and tells you so. Adding
`--permanent` changes none of that. There is a separate `firewall-offline-cmd`
for editing the saved configuration while the service is stopped, which is what
an installer uses. In this module, start the service before you try anything
else on this page.

A zone is a named set of rules with interfaces and source addresses attached
to it. The package ships a dozen of them and you will use two.

```
[root@rhel ~]# firewall-cmd --get-zones
[root@rhel ~]# firewall-cmd --get-default-zone
[root@rhel ~]# firewall-cmd --info-zone=public
```

Read the third output as far as the `services` line and stop. What sits below
it, for forwarding, masquerading, port forwarding and rich rules, belongs to
work no objective asks of you. The `firewalld.zones(5)` manual page says what
each shipped zone is for. Look it up there instead of online, because that is
RHCSA-1.11 practice and the exam gives you no browser.

Service names are the other half. A service is a small XML file naming the
ports one application needs.

```
[root@rhel ~]# firewall-cmd --get-services | tr ' ' '\n' | wc -l
[root@rhel ~]# ls /usr/lib/firewalld/services/
```

The count comes back in the hundreds and nobody memorises it. The point is
that `--add-service=nfs` beats remembering which ports NFS wants, and that
you can open the file and read the answer when you need it.

Now watch the two-step work. Run the listing before and after every command.

```
[root@rhel ~]# firewall-cmd --list-services
cockpit dhcpv6-client ssh
[root@rhel ~]# firewall-cmd --permanent --add-service=smtp
success
[root@rhel ~]# firewall-cmd --list-services
cockpit dhcpv6-client ssh
[root@rhel ~]# firewall-cmd --reload
success
[root@rhel ~]# firewall-cmd --list-services
cockpit dhcpv6-client smtp ssh
```

The listing does not move in the middle. `--permanent` writes to the file on
disk and leaves the running firewall alone. `--reload` is what loads the file.
Removal behaves the same way and goes wrong in the same way.

```
[root@rhel ~]# firewall-cmd --permanent --remove-service=smtp
[root@rhel ~]# firewall-cmd --reload
[root@rhel ~]# firewall-cmd --list-services
cockpit dhcpv6-client ssh
```

Miss the reload and you will test a rule that is not loaded. Miss
`--permanent` and your rule disappears at the next boot. Both faults look
exactly like a rule that does not work.

When a port is open, prove that something answers on it. `curl` is the tool
for that, and against a lab server on 443 it stops before it tells you
anything useful. The certificate is self-signed or missing, no local authority
vouches for it and `curl` declines the connection instead of trusting it.

```
[root@rhel ~]# curl -k https://web.example.com
```

The `-k` option skips that check, and `--insecure` is the same option written
out. RH134 14.02 uses it twice in exactly this way and describes it as the way
past strict host checking. So it is not a trick and it needs no apology. It is
the normal move when you want to tell a firewall problem apart from a
certificate problem.

Know what you have switched off. The certificate check is what proves you are
talking to the machine you meant to reach. Without it, anything sitting
between you and the server can answer in its place and you will not know.
Testing your own server, on a lab network, on a port you opened a minute ago,
that costs you nothing. Away from the lab it costs you the guarantee. Reach
for `-k` to answer whether a service is up, then put it down.

### An open port you did not put there

A port is open and you do not know why. That is a question with a fixed shape,
and four commands answer it in order.

```
[root@rhel ~]# firewall-cmd --info-zone=public
[root@rhel ~]# ss -tulnp
[root@rhel ~]# rpm -qf /usr/bin/name
[root@rhel ~]# rpm -qi package
```

Each one answers a different question. The zone listing says what the firewall
allows through, on its `ports` and `services` lines. `ss` says what is
listening and names the process holding the socket. `rpm -qf` takes the path of
that program and names the package it arrived in. `rpm -qi` prints the
description of the package, which is usually where the answer finally is. Most
surprises end there. Nothing is broken and something is simply running, and now
you know what.

Use `ss` and not `netstat`. RH124 17.03 states that `ss` superseded `netstat`,
which arrives in the `net-tools` package. That package sits in the `base`
package group and not in `core`, so a minimal install leaves you with a command
that is not found. `ss` comes from `iproute`, which every install gets. The
options are the same on both and RH124 17.03 tables them, so learn them once.
You meet `ss` in week 6, and this is what it is for.

## Week 12: Containers and image mode

Containers and image mode.

No RHCSA objective covers this week. RH134 17 and 18 teach Podman and image
mode, and the exam asks for neither. Everything below is for interest and for
the work itself. Finish the chapters that carry objectives first.

| Page | Why it is worth reading |
| --- | --- |
| [pivot-root, by Julia Evans](https://wizardzines.com/comics/pivot-root/) | One page showing that a container image is a tarball of a file system, and that running one starts by changing a process root directory. It is the same `chroot` you used in rescue mode |
| [Podman pull "official" images from Docker Hub](https://stackoverflow.com/questions/69162077/podman-pull-official-images-from-docker-hub) | Why a short image name behaves differently under Podman, and what the search list in `/etc/containers/registries.conf` does with it |
| [Why a privileged container in Docker is a bad idea](https://www.trendmicro.com/en_gb/research/19/l/why-running-a-privileged-container-in-docker-is-a-bad-idea.html) | What `--privileged` actually hands over. RH134 18.05 asks you to run the image builder with that flag, so understand the trade before you type it |
| [Podman's new network stack](https://www.redhat.com/en/blog/podman-new-network-stack) | Matthew Heon on why netavark and aardvark replaced CNI. Background for the container networking you get by default on RHEL 10 |

The comic reaches back to week 11 on purpose. Meeting `chroot` twice, once for
repairing a system and once for running a container, is the point.

The privileged container piece was written about Docker in 2019. The risk it
sets out still stands, because `--privileged` gives away the same host access
under Podman.

The network stack post closes by saying CNI stays available as an option.
That part has gone stale. RHEL 10 ships Podman 5, where netavark is the only
backend.
