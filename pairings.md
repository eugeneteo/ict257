# Commands to pair, and forms to remember

Assume that your machines will be rebooted immediately after the exam ends. Red Hat requires configurations to persist after reboot. These command pairings are not exhaustive, so take your own notes as you go through the courseware.

Use this routine for changes that must survive a reboot.

- **Copy the file first.** Back up before you edit, and revert from the backup
  if necessary.
- **Persistent form, not the runtime one.** One command and a flag decides
  whether the change survives a reboot.
- **Reload, or run whatever the second command is.** Two commands, and the
  first alone might not reflect the change or the change might not be
  persistent.

## Use the persistent form

The runtime form changes the current state. It does not by itself make a
setting persistent.

| Command | Runtime only | Persistent | What changes | Objective |
| --- | --- | --- | --- | --- |
| `systemctl` | `systemctl start UNIT` | `systemctl enable --now UNIT` | enables it for boot and starts it now, in one command | RHCSA-7.2, RHCSA-8.3 |
| `nmcli` | `nmcli con up NAME` | `nmcli con mod NAME connection.autoconnect yes`, then `nmcli con up NAME` | sets autoconnect for later boots, then activates it now | RHCSA-8.1 |
| `hostnamectl` | `hostname NAME` | `hostnamectl hostname NAME` | writes the static name into `/etc/hostname` | RHCSA-8.2 |
| `setsebool` | `setsebool BOOLEAN on` | `setsebool -P BOOLEAN on` | writes the boolean to policy, not just memory | RHCSA-10.8 |
| `firewall-cmd` | `firewall-cmd --add-service=SERVICE` | `firewall-cmd --permanent --add-service=SERVICE`, then `firewall-cmd --reload` | saves the rule to disk, then applies it to the running firewall | RHCSA-8.4, RHCSA-10.1 |

## Run the second command

**Fails how** says what goes wrong if you stop after the first step.

- `persistence`, it works now and is gone after a reboot
- `activation`, it is saved but the running service has not picked it up
- `visibility`, the file is right but a label, cache or generator disagrees

### RH124, weeks 1 to 6

| After you | You must also | Or else | Fails how | Objective |
| --- | --- | --- | --- | --- |
| `umask 0027` | add the umask line to `~/.bashrc` | the old default returns at next login | persistence | RHCSA-10.2 |
| add a `.repo` file with `gpgcheck=1` | `rpm --import <keyurl>` | package installs abort on an untrusted key | visibility | RHCSA-2.1, RHCSA-7.5 |
| add files you need `locate` to find | `updatedb` | `locate` reads a database, not the live disk | visibility | RHCSA-1.8 |
| `systemctl start UNIT` | `systemctl enable UNIT` | the service does not come back after reboot | persistence | RHCSA-7.2, RHCSA-8.3 |
| `systemctl enable UNIT` | `systemctl start UNIT` | nothing is running until the next boot | activation | RHCSA-4.9, RHCSA-7.2 |
| edit `/etc/NetworkManager/system-connections/NAME.nmconnection` | `nmcli con reload` | NetworkManager still holds the old profile | visibility | RHCSA-8.1 |
| `nmcli con mod NAME ...` | `nmcli con up NAME` | the interface keeps its old runtime address | activation | RHCSA-8.1 |
| edit a service configuration file, such as `sshd_config`, `chrony.conf`, `journald.conf` or a file under `/etc/rsyslog.d` | `systemctl reload` that service, or `restart` if it has no reload | the daemon keeps the settings it started with | activation | RHCSA-10.3 |

### RH134, weeks 7 to 12

| After you | You must also | Or else | Fails how | Objective |
| --- | --- | --- | --- | --- |
| `export EDITOR=nano`, though vim is the default and it is better | add the export to `~/.bash_profile` | the variable is lost at the next login | persistence | RHCSA-3.3 |
| edit a `.timer` unit under `/etc/systemd/system` | `systemctl daemon-reload` | systemd still has the stale unit cached | visibility | RHCSA-7.1 |
| create `/etc/tmpfiles.d/NAME.conf` | `systemd-tmpfiles --create /etc/tmpfiles.d/NAME.conf` | the described directory does not exist yet | activation | RHCSA-7.1 |
| `mkdir /var/log/journal` | `journalctl --flush` | the journal still lives only in memory | activation | RHCSA-4.8 |
| `setenforce 0` | set `SELINUX=` in `/etc/selinux/config` | the mode reverts on reboot | persistence | RHCSA-10.4 |
| `chcon -t TYPE /path` | `semanage fcontext -a -t TYPE '/path(/.*)?'`, then `restorecon -Rv /path` | a relabel wipes a context set by hand | persistence | RHCSA-10.5, RHCSA-10.6 |
| `semanage fcontext -a -t TYPE '/path(/.*)?'` | `restorecon -Rv /path` | existing files keep their wrong labels | visibility | RHCSA-10.5, RHCSA-10.6 |
| create a partition with `parted` | `udevadm settle` | the device file under `/dev` may not exist yet | visibility | RHCSA-5.1 |
| `mount /dev/sdb1 /mnt` | add the device to `/etc/fstab` | the mount is gone after reboot | persistence | RHCSA-5.5, RHCSA-6.1 |
| `lvremove /dev/vg/lv` | remove the volume's line from `/etc/fstab` | the next boot stops in emergency mode waiting for a device that is gone | persistence | RHCSA-5.4, RHCSA-5.5 |
| `semanage port -a -t ssh_port_t -p tcp PORT` for a new sshd port | `firewall-cmd --permanent --add-port=PORT/tcp`, then `firewall-cmd --reload`, then `systemctl restart sshd` | the label is right and the door is still shut, so the new port refuses connections | activation | RHCSA-10.7, RHCSA-8.3 |
| edit `/etc/fstab` | `findmnt --verify`, then `systemctl daemon-reload`, then `mount -a` | a bad entry can stop the next boot, and nothing is mounted until you do | activation | RHCSA-5.5, RHCSA-6.1 |
| `swapon /dev/sdb2` | add a `swap` line to `/etc/fstab` | the swap area is inactive after reboot | persistence | RHCSA-5.6 |
| `lvextend -L +SIZE /dev/vg/lv` | `xfs_growfs MOUNTPOINT` or `resize2fs /dev/vg/lv` | the filesystem still reports the old size | activation | RHCSA-6.4 |
| `systemctl isolate TARGET` | `systemctl set-default TARGET` | the old target is used at next boot | persistence | RHCSA-4.2, RHCSA-7.3 |
| reset the root password from the rescue prompt | `touch /.autorelabel` | unlabelled files leave SELinux wrong at boot | visibility | RHCSA-4.3 |
| `firewall-cmd --permanent --add-service=NAME` | `firewall-cmd --reload` | the running firewall still blocks the traffic | activation | RHCSA-8.4, RHCSA-10.1 |
| `firewall-cmd --add-service=NAME` without `--permanent` | `firewall-cmd --runtime-to-permanent` | the rule vanishes on reboot or reload | persistence | RHCSA-8.4, RHCSA-10.1 |
| correct a port label after `httpd` fails to bind | `systemctl restart httpd` | the daemon does not retry the failed bind by itself | activation | RHCSA-10.7 |
| write `/etc/auto.master.d/NAME.autofs` and its map file | `systemctl enable --now autofs` | nothing mounts on demand, now or after reboot | activation | RHCSA-6.3 |

## Before you finish a task

Ask what happens to it at the next reboot. If you are not sure, reboot the
machine and check. Red Hat grades whether the configuration persists.
