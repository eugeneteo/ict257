# One name, several manual pages

These examples supplement RH124 chapter 3, section 1 (using man pages). Finding the right page is RHCSA-1.11.

## What you will learn

Manual pages use both a name and a section number to identify the correct documentation. When multiple pages share the same name, you need to specify which section you want to avoid reading the wrong documentation.

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
finds. On RHEL 10 that order is the man-db default, `1 n l 8 3 0 2 5`, with
the rest of the numbers behind that. The `SECTION` line in
`/etc/man_db.conf` would override it, but the shipped file has that line
commented out, so the built-in order is what runs. Section 1
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
of names containing it anywhere. Week 3 of the module covers that syntax properly.

The exam gives you the manual pages and no internet, so knowing how to find the
right page is worth practising now. That is RHCSA-1.11.

## Reading a long manual page away from the terminal

Convert a manual page to PDF when you need to study it away from the terminal. The `bash(1)` manual page runs to hundreds of pages and is difficult to read in a terminal pager.

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
`nmtui`, this one will not simply be there.

This is for studying and not for the day. The exam has no internet and no
reason to make a PDF.
