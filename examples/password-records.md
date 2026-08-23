# Passwords, hashes and account defaults

These examples supplement RH124 chapter 10, sections 5 and 9 (managing local user accounts, and passwords and password ageing). They cover RHCSA-9.1 and RHCSA-9.2.

## Building a hash you can take apart

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
starts `$y$` instead, as the note under the week 3 table in
[`readings.md`](../readings.md) says. Neither one is broken. You have
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
met in [`manual-pages.md`](manual-pages.md) is OpenSSL's command index and not
this command, so ask for `openssl-passwd(1ossl)` when you want the options.
And `openssl` is a package
of its own, in BaseOS but in no install group, so a minimal machine wants
`dnf install openssl` first. Your lab machine has it, which is why that search
in week 2 found a `1ossl` page to list.

Last, do not carry the shape of that command into real work. Piping a password
through `echo` writes it into your shell history in plain text. Here you are
demonstrating with a password everybody in the room already knows. Set a real
one with `passwd` and let the tool choose the salt.

## The same record, read two ways

The note under the week 3 table in [`readings.md`](../readings.md) sends you
to `man 5 shadow` so you can check your own work. This
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

## Where the defaults come from

The section above reads one account's record. This is the template every new
account is cut from. RH124 10.05 says outright that `useradd` takes its
configuration from `/etc/login.defs`, so this is the answer to a question the
`chage -l` output raises and does not settle. Where did those numbers come
from before anybody set them?

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

The `-E` asks for extended syntax, which week 7 of the module covers. Even then, open the
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
sets `ENCRYPT_METHOD YESCRYPT`, which is what the note under the week 3 table
told you and what produces a `$y$` hash. Older transcripts of this file show
`SHA512` there, and they are RHEL 9 or earlier. If you go looking for `SHA512`
in your own copy you will find it, on the `HMAC_CRYPTO_ALGO` line, which is
used by a PAM module and has nothing to do with how your password is stored.
