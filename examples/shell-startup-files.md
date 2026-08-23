# Shell startup files

This example supplements RH134 chapter 1, section 1 (writing simple bash scripts). That is RHCSA-3.3.

## Why `~/.bashrc` runs whichever way you log in

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
