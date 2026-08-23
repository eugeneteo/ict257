# Reading a sudoers rule

These examples supplement RH124 chapter 10, section 3 (gaining superuser access). That is RHCSA-9.4.

## What you will learn

Each `ALL` in a sudoers rule answers a different question. Understanding what each position means helps you read rules correctly and avoid security mistakes.

## Four times `ALL`, four different questions

RH124 10.03 shows the line that gives you `sudo` access.

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

## `NOPASSWD`, and what it costs you

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
