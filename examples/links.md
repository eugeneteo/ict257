# Hard and soft links

These examples supplement RH124 chapter 7, section 3 (managing links). That is RHCSA-1.9.

## What you will learn

Hard links and soft links behave differently when you remove or move files. Understanding the difference helps you avoid common mistakes when working with links.

## What `ls -li` proves about a hard link

Create a file and give it a second name to see how hard links work.

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
[student@workstation ~]$ ln file-hlink.txt /dev/shm/file-hlink2.txt
ln: failed to create hard link '/dev/shm/file-hlink2.txt' => 'file-hlink.txt': Invalid cross-device link
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

Week 4 of the module carries the other half of this. There you learn that deleting a file is
governed by the directory holding the name and not by the file. The link count
is what decides whether the data goes with the name.

## The size of a symbolic link is the path inside it

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
