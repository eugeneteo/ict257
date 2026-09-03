# Optional reading, week by week

These pages accompany the schedule in [`lessons.md`](lessons.md). None of this is required and none of it is examined. Use a row when a session leaves you wanting the same idea from a second angle. Some exam tips are included here, so read this page at least once.

Worked examples that go with a week sit in [`examples/`](examples/). Each week names its own.

Each row explains what a page is and why it is worth your time. **Objective** names the entry in [`objectives.md`](objectives.md) that it supports. A dash means the page sets context and carries no objective.

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

Two worked examples go with this week: [`examples/manual-pages.md`](examples/manual-pages.md) on finding the right page, and [`examples/links.md`](examples/links.md) on hard and soft links.

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

Three worked examples go with this week: [`examples/password-records.md`](examples/password-records.md) on password hashes and account defaults, [`examples/sudoers.md`](examples/sudoers.md) on reading a sudoers rule, and [`examples/streams.md`](examples/streams.md) on streams and redirection.

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

One worked example goes with this week: [`examples/directory-permissions.md`](examples/directory-permissions.md) on what setgid, the sticky bit and the umask do to a shared directory.

## Week 5: File systems, locating files and processes

| Page | Why it matters |
| --- | --- |
| [Linux process states](https://idea.popcount.org/2012-12-11-linux-process-states/) | Stops a process from the shell and shows the state letter change in `ps`. Afterwards the `STAT` column of `ps aux` reports something you have watched happen. RHCSA-4.4 |

The process states post is from 2012 and it still holds, because the kernel
state names have not moved. It stops short of the full picture. RH124 15.01
also lists the `K` and `I` states and the post does not. Read the post for the
states you can produce yourself, then take the rest from the course table. Most
of the page is about `ptrace`, which no objective asks for.

One worked example goes with this week: [`examples/flatpak-registry-authentication.md`](examples/flatpak-registry-authentication.md) on persisting Flatpak registry credentials without exposing your personal login.

## Week 6: System services, network configuration, name resolution and secure remote access

| Page | Why it matters |
| --- | --- |
| [systemd "static" unit file state](https://bbs.archlinux.org/viewtopic.php?id=147964) | Answers why some units refuse to be enabled. A unit with no `[Install]` section gives `systemctl` nowhere to put the symlink. RHCSA-7.2 |
| [What is the difference between `systemctl mask` and `systemctl disable`?](https://askubuntu.com/questions/816285/what-is-the-difference-between-systemctl-mask-and-systemctl-disable) | Both look like off and they are not the same. A disabled unit still starts when something else pulls it in. A masked unit cannot start at all. RHCSA-7.2, RHCSA-4.9 |
| [RFC 1122](https://datatracker.ietf.org/doc/html/rfc1122) | The document RH124 17.01 names when it defines the four-layer model. Read section 1.1.3 and you will see where the layer names came from and who assigned them. RHCSA-8.1 |
| [How the TCP/IP Protocols Handle Data Communications](https://docs.oracle.com/cd/E18752_01/html/816-4554/ipov-29.html) | Follows one packet down the sending stack and back up the receiving one. Encapsulation stops being a word and becomes a sequence you can recite. RHCSA-8.1 |
| [Benefits of IPv6](https://www.catchpoint.com/benefits-of-ipv6) | Explains why RHEL 10 brings up IPv6 alongside IPv4 without being asked, and where a link-local address comes from. RHCSA-8.1 |
| [Why Authentication Using SSH Public Key is Better than Using Password and How Do They Work?](https://runcloud.io/blog/ssh-public-key-authentication) | Sets out why a key pair beats a password before you type `ssh-keygen`. Afterwards you know which half of the pair is safe to copy to a server. RHCSA-10.3 |
| [OpenSSH: ssh-add / ssh-agent Command Set Maximum Lifetime In Seconds](https://www.cyberciti.biz/faq/unix-linux-appleosx-bsd-ssh-add-agent-command-set-lifetime/) | RH124 19.03 caches your passphrase until you log out. This shows how to expire it sooner with `-t`, and why you would want to. RHCSA-10.3, RHCSA-1.4 |

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

A walkthrough of `nmtui` sits in [`examples/network-and-firewall-tools.md`](examples/network-and-firewall-tools.md).

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

A worked example on why `~/.bashrc` runs both ways sits in [`examples/shell-startup-files.md`](examples/shell-startup-files.md).

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

A worked example on preserving the journal sits in [`examples/journal-persistence.md`](examples/journal-persistence.md).

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

Two worked examples go with this week in [`examples/partitioning-and-lvm.md`](examples/partitioning-and-lvm.md): partitioning with `parted`, and cleaning up an LVM build.

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

Two worked examples go with this week in [`examples/network-and-firewall-tools.md`](examples/network-and-firewall-tools.md): the `firewall-cmd` two-step, and tracing an open port you did not put there.

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
