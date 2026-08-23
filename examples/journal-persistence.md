# Making the journal survive a reboot

This example supplements RH134 chapter 5, section 7 (preserving the system journal). That is RHCSA-4.8.

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
