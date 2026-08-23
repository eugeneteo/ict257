# Directory permissions

These examples supplement RH124 chapter 11, sections 1 and 5 (controlling access to files, and managing default permissions). They cover RHCSA-1.10 and RHCSA-10.2.

## What you will learn

Special permission bits like setgid and the sticky bit control how new files inherit permissions and who can delete files in shared directories. Understanding these bits helps you avoid common permission problems.

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
bits, and those came from the umask in force in that shell. A fresh login
shell on RHEL 10 usually gets 002 rather than 022, because `/etc/bashrc`
grants 002 to every ordinary user whose private group carries their own name,
which would make the file group writable. The 644 above is what a 022 umask
produces, such as when a shell reached by `su` without the dash carries the
setting of the shell before it.

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

## Read and execute are not the same thing on a directory

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
