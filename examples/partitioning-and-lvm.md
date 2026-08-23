# Partitioning and LVM cleanup

These examples supplement RH134 chapter 10, section 1 (managing storage with parted) and chapter 11, section 5 (removing storage layers). They cover RHCSA-5.1 and RHCSA-5.4.

## Partitioning a second disk on a machine of your own

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

## When `lvremove` argues with you

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
