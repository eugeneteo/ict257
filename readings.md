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
`\u`, `\h`, `\w` and `\$` are the ones in the default RHEL prompt, and `\$` is
the one that prints `#` for root and `$` for everyone else. That is worth
knowing before week 3, when you start switching users. Set `PS1` in your own
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
pays off again in week 5, when you start creating file systems of your own.

## Week 3: Editing text, redirecting output, users and groups

Editing text, redirecting output, users and groups.

| Page | Why it is worth your time | Objective |
| --- | --- | --- |
| [Thinking in pipelines](https://effective-shell.com/part-2-core-skills/thinking-in-pipelines/) | It draws standard input, standard output and standard error as three files with numbers on them, then builds pipelines out of those numbers. Redirection stops being syntax you memorise once you can see where each stream goes | RHCSA-1.2 |
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
bit is set. Fix the older files with `chgrp -R` and be done.

Two bits, one directory, opposite jobs. Setgid decides the group of new
files. The sticky bit decides who may delete an old one.

## Week 5: File systems, locating files, processes and system services

| Page | Why it matters |
| --- | --- |
| [Linux process states](https://idea.popcount.org/2012-12-11-linux-process-states/) | Stops a process from the shell and shows the state letter change in `ps`. Afterwards the `S` column reports something you have watched happen. RHCSA-4.4 |
| [systemd "static" unit file state](https://bbs.archlinux.org/viewtopic.php?id=147964) | Answers why some units refuse to be enabled. A unit with no `[Install]` section gives `systemctl` nowhere to put the symlink. RHCSA-7.2 |
| [What is the difference between `systemctl mask` and `systemctl disable`?](https://askubuntu.com/questions/816285/what-is-the-difference-between-systemctl-mask-and-systemctl-disable) | Both look like off and they are not the same. A disabled unit still starts when something else pulls it in. A masked unit cannot start at all. RHCSA-7.2, RHCSA-4.9 |
| [What is the difference between Process and Main PID in the output of `systemctl`?](https://unix.stackexchange.com/questions/378019/what-is-the-difference-between-process-and-main-pid-in-the-output-of-systemctl) | `systemctl status` prints more than one process and you have to read which is which. Main PID is the one `ExecStart` launched. RHCSA-4.9 |

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

## Week 6: Network configuration, name resolution and secure remote access

| Page | Why it matters |
| --- | --- |
| [RFC 1122: Requirements for Internet Hosts, Communication Layers](https://datatracker.ietf.org/doc/html/rfc1122) | The document RH124 17.01 names when it defines the four-layer model. Read section 1.1.3 and you will see where the layer names came from and who assigned them. RHCSA-8.1 |
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
RH124 17.01 and 17.03 teach `nmcli` because that is the tool the exam expects.
A student who can only drive the menu stops dead the moment a task wants
something the menu does not offer. Use `nmtui` to fill in a long profile
safely and to read back what is set. Do not use it to avoid the command.

Red Hat's own documentation shows the two tools side by side.

| Page | Why it is worth your time |
| --- | --- |
| [Configuring an Ethernet connection](https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/10/html/configuring_and_managing_networking/configuring-an-ethernet-connection) | Red Hat builds one connection profile by several routes, with `nmcli` and with `nmtui` among them. Read those two sections one after the other and you will see that they write the same profile |

### Tools, not readings

The pages below are calculators. Reading them teaches you nothing. The exam
gives you no internet, so do not build a habit on any of them. Use them to
check work you have already done by hand, then move to `ipcalc`, which RHEL 10
ships in BaseOS and RH124 17.01 teaches.

| Tool | What it does |
| --- | --- |
| [IP Calculator / IP Subnetting](https://jodies.de/ipcalc?host=203.217.187.35&mask1=30&mask2=) | Prints address, netmask and network in binary beside the decimal, with the prefix boundary marked in the bit string. The one to use while the bitwise AND is still slow |
| [IP Subnet Calculator](https://www.calculator.net/ip-subnet-calculator.html) | Covers IPv4 and IPv6. Use it to check a host range and a broadcast address |
| [Binary to Decimal Converter](https://www.rapidtables.com/convert/number/binary-to-decimal.html) | Converts one octet at a time. Its calculation steps show the working, so check yours against them |
| [IPv6 Address Validator](http://sqa.fyicenter.com/1000334_IPv6_Address_Validator.html) | Expands and compresses an IPv6 address. Use it to test your own `::` compression against the rules in RH124 17.01 |

Krischan Jodies wrote the tool at jodies.de, and it is not the `ipcalc` that
sits on your RHEL machine. The output labels line up closely and the two
programs are different, with different options. Learn the one you will have in
front of you on the day.

## Week 7: Shell scripts, regular expressions and scheduled jobs

| Page | What it is |
| --- | --- |
| [Exit Codes With Special Meanings](https://tldp.org/LDP/abs/html/exitcodes.html#EXITCODESREF) | The exit codes the shell has already claimed, and the 128 plus signal number rule behind a status of 130 or 137. RHCSA-3.1, RHCSA-3.4 |
| [Regular Expressions, in the GNU grep manual](https://www.gnu.org/software/grep/manual/html_node/Regular-Expressions.html) | The syntax as the `grep` command on your machine implements it, including where basic and extended expressions part company. RHCSA-1.3 |

RH134 01.05 teaches the `exit` command and the `$?` variable. It does not tell
you which values are already spoken for. Read the table on that page and stop
there. The author goes on to propose keeping your own codes between 64 and 113.
That is his suggestion and no standard, so ignore it.

The grep manual is on your lab machine too, as `info grep`. Reading it there is
practice for RHCSA-1.11, and the local copy matches the version you are
running.

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
behind an instruction the course gives you without explaining it.

## Week 10: Partitions, swap, logical volumes and booting

Partitions, swap, logical volumes and booting.

| Page | Why it is worth reading | Objective |
| --- | --- | --- |
| [Linux on 4 KB sector disks: practical advice](https://web.archive.org/web/20210125124010/https://developer.ibm.com/tutorials/l-linux-on-4kb-sector-disks/) | Rod Smith measures what a misaligned partition costs on an Advanced Format disk. RH134 10.01 gives you 2048 as a safe first sector without saying why. This is why | RHCSA-5.1 |
| [The gen on disc partition alignment](https://jdebp.uk/FGA/disc-partition-alignment.html) | Jonathan de Boyne Pollard takes apart the cylinder alignment rule that older partitioning guides still repeat. Read it so you can recognise that advice as dead when you meet it | RHCSA-5.1 |
| [LVM volume group: what are extents?](https://unix.stackexchange.com/questions/341077/lvm-volume-group-what-are-extents) | The accepted answer explains the unit that LVM actually allocates in. It is why `lvcreate -l` and `lvcreate -L` take different numbers, and why a size rounds up | RHCSA-5.4, RHCSA-6.4 |
| [`bootup(7)`](https://man7.org/linux/man-pages/man7/bootup.7.html) | The systemd boot sequence as RHEL 10 runs it, from firmware through the initial RAM file system to the default target | RHCSA-4.2, RHCSA-7.3 |
| [Configuring and managing logical volumes](https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/10/html/configuring_and_managing_logical_volumes/index) | Red Hat's own LVM guide for RHEL 10. Use it when a `pvs`, `vgs` or `lvs` field means nothing to you | RHCSA-5.2, RHCSA-5.3, RHCSA-5.4 |

Both alignment pages cover the same ground, and one of them is enough. They
were written long before RHEL 10, so read them for the principle and not for
the tools they name. RH134 teaches `parted`, which reads the disk topology
itself and warns you when a start position lands badly.

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

Register the new device files before you use them.

```
[root@rhel ~]# udevadm settle
[root@rhel ~]# lsblk /dev/vdb
```

`lsblk` shows you the two partitions as children of the disk. If it shows the
disk alone, the kernel has not caught up and `udevadm settle` is the command
you missed. Formatting a device that does not exist yet fails in a way that
reads like a hardware problem and is not one.

Naming the partitions `data` and `logs` costs nothing and the name survives in
the GPT. On a machine with several disks it is worth the two seconds.

### When `lvremove` argues with you

You will make a mess of an LVM build sooner or later and want to start again.
RH134 11.05 gives you the order. Unmount the file system, then `lvremove`,
`vgremove` and `pvremove`, and take the `/etc/fstab` line out while you are
there. One state the section never reaches is a logical volume that is
unmounted and still active. `lvremove` refuses to touch it.

```
[root@rhel ~]# lvchange -an /dev/vgdata/lvdata
[root@rhel ~]# lvremove /dev/vgdata/lvdata
```

`lvchange -an` deactivates the volume and takes its device node away, after
which the removal goes through. Neither course teaches `lvchange`, because in
the courseware the build always works. Run `lsblk` between steps to see where
you have got to, since it prints the disks, the volume group and the logical
volumes as one tree.

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

Nothing you type at `firewall-cmd` takes effect until `firewalld` is running,
so check the daemon before you blame your rules. A stopped daemon will accept
a permanent rule and enforce none of it.

A zone is a named set of rules with interfaces and source addresses attached
to it. The package ships about ten of them and you will use two.

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

### Why port 8888 is open on workstation

The classroom workstation listens on a port that no exercise ever asked for.
That is a small mystery, and running it to ground is the skill.

```
[root@workstation ~]# firewall-cmd --info-zone=public
[root@workstation ~]# ss -tulnp | grep 8888
[root@workstation ~]# rpm -qf /usr/bin/conmon
[root@workstation ~]# rpm -qi conmon
```

The zone listing carries `8888/tcp` on its `ports` line. `ss` names the
process holding the socket, which is `conmon`. `rpm -qf` names the package the
program came from, and `rpm -qi` prints the description, which calls `conmon`
the monitoring program for OCI container runtimes. Podman starts one for each
container it runs. Nothing is broken. Something is simply running, and you now
know what.

Four commands, and each answers one question. What is open, what is listening,
which package put it there and what that package is for. Practise the chain on
any port you did not expect, because the exam environment will show you one.

Use `ss` and not `netstat` here. RH124 17.03 states that `ss` superseded
`netstat`, which arrives in the `net-tools` package and is not installed for
you, so an older note leaves you with a command that is not found. The five
options carry over unchanged. `-t` for TCP, `-u` for UDP, `-l` for listening
sockets, `-n` for numbers in place of names and `-p` for the process behind
each one. You meet `ss` in week 6, and this is what it is for.

### When `showmount` tells you nothing

You have an NFS server and you do not know what it exports. The obvious
command is `showmount`, and on a modern server it fails.

```
[root@rhel ~]# showmount -e files.example.com
clnt_create: RPC: Unable to receive
```

Read that failure carefully, because it is not what it looks like. The server
is up. The network is fine. `showmount` asks the `rpcbind` service on port 111
which port the NFS service is using, and an NFSv4-only server does not run
`rpcbind`. There is nothing listening to answer the question. You have proved
which protocol version the server speaks. You have not found a fault.

NFSv4 answers a different question instead. Every export hangs off a single
tree, and the root of that tree is itself mountable. Mount it and look.

```
[root@rhel ~]# mkdir /mnt/exports
[root@rhel ~]# mount -t nfs files.example.com:/ /mnt/exports
[root@rhel ~]# ls -R /mnt/exports
```

What you get back is the shape of the server, and it is browseable. Nothing
under it is mounted yet. Changing into one of those directories mounts the
export it stands for.

When you know which export you want, unmount the tree and mount that one
export on the mount point it should have.

```
[root@rhel ~]# umount /mnt/exports
[root@rhel ~]# mkdir /data/reports
[root@rhel ~]# mount -t nfs files.example.com:/reports /data/reports
```

Two habits are worth forming here. Use `/mnt` to look and use a real mount
point to work, because `/mnt` is a scratch space and something else will want
it. And if the exam asks for a mount, it wants the mount to survive a reboot,
so the `/etc/fstab` entry is part of the task and not an extra.

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
| [Podman in Action, chapter 1](https://livebook.manning.com/book/podman-in-action/chapter-1/43) | Daniel Walsh on what makes Podman different from Docker, which is that it runs without a daemon and can run without root |

The comic reaches back to week 11 on purpose. Meeting `chroot` twice, once for
repairing a system and once for running a container, is the point.

The privileged container piece was written about Docker in 2019. The risk it
sets out still stands, because `--privileged` gives away the same host access
under Podman.

The network stack post closes by saying CNI stays available as an option.
That part has gone stale. RHEL 10 ships Podman 5, where netavark is the only
backend.

Only the opening of the Manning chapter is free to read. That much carries the
point worth taking, so stop when the page stops.
