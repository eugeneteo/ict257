# Commands to pair, and forms to remember

Assume that your machines will be rebooted immediately after the end of the
exam. Any changes that are not persistent will not be given marks. Take note
that these command pairings are not exhaustive, and you are advised to take
your own notes as you go through the courseware.

Do these three things.

- **Back up before you edit.** Copy the file first before you edit. Revert from
  the backup file or `diff -Naur original modified` if necessary.
- **Use the persistent form.** One command and a flag decides whether the
  change survives a reboot.
- **Run the second command.** Two commands, and the first alone might not
  reflect the change or the change might not be persistent.

## Use the persistent form

Same command, two forms. The left one is gone after a reboot.

| Command | Runtime only | Persistent | What changes | Objective | Section |
| --- | --- | --- | --- | --- | --- |
| `systemctl` | `systemctl start UNIT` | `systemctl enable --now UNIT` | enables it for boot and starts it now, in one command | RHCSA-7.2, RHCSA-8.3 | RH124 16.03 |
| `nmcli` | `nmcli con up NAME` | `nmcli con mod NAME connection.autoconnect yes`, then `nmcli con up NAME` | comes up at the next boot as well as now | RHCSA-8.1 | RH124 18.01 |
| `hostnamectl` | `hostname NAME` | `hostnamectl hostname NAME` | writes the static name into `/etc/hostname` | RHCSA-8.2 | RH124 18.05 |
| `setsebool` | `setsebool BOOLEAN on` | `setsebool -P BOOLEAN on` | writes the boolean to policy, not just memory | RHCSA-10.8 | RH134 06.05 |
| `firewall-cmd` | `firewall-cmd --add-service=SERVICE` | `firewall-cmd --permanent --add-service=SERVICE`, then `firewall-cmd --reload` | saves the rule to disk, then applies it to the running firewall | RHCSA-8.4, RHCSA-10.1 | RH134 14.01 |

## Run the second command

**Fails how** says what goes wrong if you stop after the first step.

- `persistence`, it works now and is gone after a reboot
- `activation`, it is saved but the running service has not picked it up
- `visibility`, the file is right but a label, cache or generator disagrees

### RH124, weeks 1 to 6

| After you | You must also | Or else | Fails how | Objective | Section |
| --- | --- | --- | --- | --- | --- |
| `umask 0027` | add the umask line to `~/.bashrc` | the old default returns at next login | persistence | RHCSA-10.2 | RH124 11.05 |
| add a `.repo` file with `gpgcheck=1` | `rpm --import <keyurl>` | package installs abort on an untrusted key | visibility | RHCSA-2.1, RHCSA-7.5 | RH124 12.05 |
| add files you need `locate` to find | `updatedb` | `locate` reads a database, not the live disk | visibility | RHCSA-1.8 | RH124 14.05 |
| `systemctl start UNIT` | `systemctl enable UNIT` | the service does not come back after reboot | persistence | RHCSA-7.2, RHCSA-8.3 | RH124 16.03 |
| `systemctl enable UNIT` | `systemctl start UNIT` | nothing is running until the next boot | activation | RHCSA-4.9, RHCSA-7.2 | RH124 16.03 |
| edit `/etc/NetworkManager/system-connections/NAME.nmconnection` | `nmcli con reload` | NetworkManager still holds the old profile | visibility | RHCSA-8.1 | RH124 18.03 |
| `nmcli con mod NAME ...` | `nmcli con up NAME` | the interface keeps its old runtime address | activation | RHCSA-8.1 | RH124 18.04 |
| edit a service configuration file, such as `sshd_config`, `chrony.conf`, `journald.conf` or a file under `/etc/rsyslog.d` | `systemctl reload` that service, or `restart` if it has no reload | the daemon keeps the settings it started with | activation | RHCSA-10.3 | RH124 19.03 |

### RH134, weeks 7 to 12

| After you | You must also | Or else | Fails how | Objective | Section |
| --- | --- | --- | --- | --- | --- |
| `export EDITOR=nano` | add the export to `~/.bash_profile` | at the next login the default returns, and the default is `vim` | persistence | RHCSA-3.3 | RH134 01.01 |
| edit a `.timer` unit under `/etc/systemd/system` | `systemctl daemon-reload` | systemd still has the stale unit cached | visibility | RHCSA-7.1 | RH134 04.01 |
| create `/etc/tmpfiles.d/NAME.conf` | `systemd-tmpfiles --create /etc/tmpfiles.d/NAME.conf` | the described directory does not exist yet | activation | RHCSA-7.1 | RH134 04.04 |
| `mkdir /var/log/journal` | `journalctl --flush` | the journal still lives only in memory | activation | RHCSA-4.8 | RH134 05.07 |
| `setenforce 0` | set `SELINUX=` in `/etc/selinux/config` | the mode reverts on reboot | persistence | RHCSA-10.4 | RH134 06.01 |
| `chcon -t TYPE /path` | `semanage fcontext -a -t TYPE '/path(/.*)?'`, then `restorecon -Rv /path` | a relabel wipes a context set by hand | persistence | RHCSA-10.5, RHCSA-10.6 | RH134 06.03 |
| `semanage fcontext -a -t TYPE '/path(/.*)?'` | `restorecon -Rv /path` | existing files keep their wrong labels | visibility | RHCSA-10.5, RHCSA-10.6 | RH134 06.03 |
| create a partition with `parted` | `udevadm settle` | the device file under `/dev` may not exist yet | visibility | RHCSA-5.1 | RH134 10.01 |
| `mount /dev/sdb1 /mnt` | add the device to `/etc/fstab` | the mount is gone after reboot | persistence | RHCSA-5.5, RHCSA-6.1 | RH134 10.01 |
| edit `/etc/fstab` | `findmnt --verify`, then `systemctl daemon-reload`, then `mount -a` | a bad entry can stop the next boot, and nothing is mounted until you do | activation | RHCSA-5.5, RHCSA-6.1 | RH134 12.06 |
| `swapon /dev/sdb2` | add a `swap` line to `/etc/fstab` | the swap area is inactive after reboot | persistence | RHCSA-5.6 | RH134 10.03 |
| `lvextend -L +SIZE /dev/vg/lv` | `xfs_growfs MOUNTPOINT` or `resize2fs /dev/vg/lv` | the filesystem still reports the old size | activation | RHCSA-6.4 | RH134 11.03 |
| `systemctl isolate TARGET` | `systemctl set-default TARGET` | the old target is used at next boot | persistence | RHCSA-4.2, RHCSA-7.3 | RH134 12.03 |
| reset the root password from the rescue prompt | `touch /.autorelabel` | unlabelled files leave SELinux wrong at boot | visibility | RHCSA-4.3 | RH134 13.01 |
| `firewall-cmd --permanent --add-service=NAME` | `firewall-cmd --reload` | the running firewall still blocks the traffic | activation | RHCSA-8.4, RHCSA-10.1 | RH134 14.01 |
| `firewall-cmd --add-service=NAME` without `--permanent` | `firewall-cmd --runtime-to-permanent` | the rule vanishes on reboot or reload | persistence | RHCSA-8.4, RHCSA-10.1 | RH134 14.01 |
| `semanage port -a -t TYPE -p tcp PORT` | `systemctl restart httpd` | the daemon never retries its failed bind | activation | RHCSA-10.7 | RH134 14.04 |
| write `/etc/auto.master.d/NAME.autofs` and its map file | `systemctl enable --now autofs` | nothing mounts on demand, now or after reboot | activation | RHCSA-6.3 | RH134 15.03 |
| `bootc upgrade` | reboot, or use `bootc upgrade --apply` | the staged image is not booted into | activation | — | RH134 18.07 |

## Before you finish a task

Ask what happens to it at the next reboot. If you are not sure, reboot the
machine and check. That is how the exam is graded, so it is worth doing in
practice.