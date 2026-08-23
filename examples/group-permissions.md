# Linux Group Permissions and newgrp Lab Example

This lab supplements RH124 Chapter 10, Section 10.07 (Managing Local Group Accounts).

## What you will learn

Configure group permissions so multiple users can collaborate on files while preventing others from accessing them. Use the `newgrp` command to activate group membership in a running session.

## Step-by-step solution

### Step 1: Create the ict257 group

Create a group named `ict257` for the module members:

```bash
sudo groupadd ict257
```

Verify the group was created:

```bash
grep ict257 /etc/group
```

Expected output (the GID may differ):

```
ict257:x:1001:
```

**Note:** An alternative method is `getent group ict257`, which returns the same output. This is shown for reference only and you do not need to run it.

### Step 2: Create two student users

Create two users for the ICT257 module. Do not add them to the group yet. Step 8 adds the membership while one of them is already logged in, because a running session is exactly where `newgrp` matters. Create the two users:

```bash
sudo useradd student1
sudo useradd student2
```

Set passwords for the users:

```bash
echo 'tR7#jN8wL5hX9z' | sudo passwd --stdin student1
echo 'tR7#jN8wL5hX9z' | sudo passwd --stdin student2
```

**Alternative method:** You can also run `sudo passwd student1` and `sudo passwd student2` manually to set passwords interactively.

### Step 3: Create a third student (outside the group)

Create a user who will not be in the ict257 group at any point in this lab:

```bash
sudo useradd student3
echo 'tR7#jN8wL5hX9z' | sudo passwd --stdin student3
```

Verify this user is not in the ict257 group:

```bash
groups student3
```

Expected output:

```
student3 : student3
```

At this stage `groups student1` prints the same shape of output, `student1 : student1`, because nobody has been added to the group yet.

### Step 4: Create the shared folder

Create a directory where the ICT257 group will collaborate:

```bash
sudo mkdir /home/ict257-shared
```

### Step 5: Set group ownership on the shared folder

Set both owner and group ownership on the folder:

```bash
sudo chown root:ict257 /home/ict257-shared
```

**Note:** Always use the `user:group` format when setting ownership. The shorthand `:group` syntax is prone to typos and mistakes.

Verify the ownership:

```bash
ls -ld /home/ict257-shared
```

Expected output:

```
drwxr-xr-x 2 root ict257 4096 Aug 23 12:00 /home/ict257-shared
```

### Step 6: Set permissions (no access for others)

Set permissions so the owner and group have full access, but others have no access:

```bash
sudo chmod 770 /home/ict257-shared
```

Verify the permissions:

```bash
ls -ld /home/ict257-shared
```

Expected output:

```
drwxrwx--- 2 root ict257 4096 Aug 23 12:00 /home/ict257-shared
```

The permission string `rwxrwx---` confirms that owner and group can read, write, and execute, while others have no permissions.

### Step 7: Set the setgid bit so new files inherit the group

Set the setgid bit on the directory. The `g+s` command sets a special permission bit that makes new files and subdirectories created inside this directory automatically inherit the group ownership from the parent directory, rather than taking the creator's primary group.

Without this step, when student1 creates a file, it would be owned by `student1:student1`. With setgid, the file becomes `student1:ict257`, allowing all group members to modify it. The inheritance happens regardless of which groups are active in the creator's session, as Step 8 shows.

```bash
sudo chmod g+s /home/ict257-shared
```

Verify the setgid bit is set:

```bash
ls -ld /home/ict257-shared
```

Expected output:

```
drwxrws--- 2 root ict257 4096 Aug 23 12:00 /home/ict257-shared
```

The `s` in the group permissions (where you would normally see `x` or `-`) indicates the setgid bit is active. This means new files will automatically be owned by the ict257 group.

**Note:** You will learn more about setgid and special permission bits in RH124 Chapter 11, Controlling Access to Files.

### Step 8: Create the report file as one of the group members

Switch to student1 and look at the active groups:

```bash
su - student1
groups
```

Expected output:

```
student1
```

The account has no ict257 membership yet, so the group permissions on the shared folder do not apply. Try to create a file there:

```bash
touch /home/ict257-shared/group-report.md
```

Expected output (permission denied):

```
touch: cannot touch '/home/ict257-shared/group-report.md': Permission denied
```

Membership of the group decides whether you may write at all. Keep this shell open.

Open a second terminal on the same machine as root (or with sudo), and add both students to the group:

```bash
sudo usermod -aG ict257 student1
sudo usermod -aG ict257 student2
```

Verify the group membership from that second terminal:

```bash
grep ict257 /etc/group
```

Expected output (the GID may differ):

```
ict257:x:1001:student1,student2
```

Return to the student1 shell from before and check its groups again:

```bash
groups
```

Expected output:

```
student1
```

Nothing has changed for this session. A running shell reads `/etc/group` when it starts and never rereads it, so the membership added a moment ago is not active here. Logging out and back in would pick it up. The `newgrp` command activates it without logging out:

```bash
newgrp ict257
groups
```

Expected output:

```
ict257 student1
```

The ict257 group is now the primary group of this shell, and the write permission works. Create the report:

```bash
cat > /home/ict257-shared/group-report.md
```

Then type the following content (press Enter after each line):

```
# ICT257 Group Report

This report is a collaborative effort by the ICT257 student group.

## Authors
- student1
- student2

## Content
This document demonstrates proper group permissions configuration.
```

Press `Ctrl+D` to save and exit when you are done typing.

Set the correct permissions on the file so group members can modify it (you are still student1, so you own the file and can change permissions):

```bash
chmod 664 /home/ict257-shared/group-report.md
```

Verify the file was created and check its permissions:

```bash
ls -l /home/ict257-shared/group-report.md
```

Expected output:

```
-rw-rw-r-- 1 student1 ict257 203 Aug 23 12:05 /home/ict257-shared/group-report.md
```

The group ownership is `ict257`. Notice where that came from: the setgid bit on the directory, not the `newgrp` command. `newgrp` let student1 write to the directory at all, by activating the group membership in a session that predated it. Had student1 logged in after the membership was added, the file would have carried the same `ict257` group with no `newgrp` at all, because setgid inheritance does not depend on which groups are active.

Leave both shells. You are two shells deep as student1, so run `exit` twice: once to leave the `newgrp` shell, once to leave the student1 session.

### Step 9: Verify that group members can read and modify the file

Log in as student2:

```bash
su - student2
groups
```

Expected output:

```
student2 ict257
```

No `newgrp` is needed here. This session started after the membership was added, so it picked the group up at login. That is the alternative to `newgrp` from Step 8.

Read the file:

```bash
cat /home/ict257-shared/group-report.md
```

Expected output (the file contents):

```
# ICT257 Group Report

This report is a collaborative effort by the ICT257 student group.

## Authors
- student1
- student2

## Content
This document demonstrates proper group permissions configuration.
```

Check the file permissions and ownership:

```bash
ls -l /home/ict257-shared/group-report.md
```

Expected output:

```
-rw-rw-r-- 1 student1 ict257 203 Aug 23 12:05 /home/ict257-shared/group-report.md
```

Append content to the file:

```bash
echo "## Updated by student2" >> /home/ict257-shared/group-report.md
```

Verify the modification:

```bash
tail -3 /home/ict257-shared/group-report.md
```

Expected output:

```
## Content
This document demonstrates proper group permissions configuration.
## Updated by student2
```

The file has grown by 23 bytes:

```bash
ls -l /home/ict257-shared/group-report.md
```

Expected output:

```
-rw-rw-r-- 1 student1 ict257 226 Aug 23 12:05 /home/ict257-shared/group-report.md
```

Exit the student2 shell:

```bash
exit
```

### Step 10: Verify that the outsider cannot access the file

Test that student3 (who is not in the ict257 group) cannot access the file:

```bash
su - student3
```

Attempt to read the file:

```bash
cat /home/ict257-shared/group-report.md
```

Expected output (permission denied):

```
cat: /home/ict257-shared/group-report.md: Permission denied
```

Attempt to list the directory:

```bash
ls /home/ict257-shared/
```

Expected output (permission denied):

```
ls: cannot open directory '/home/ict257-shared': Permission denied
```

Exit the student3 shell:

```bash
exit
```

The permission restrictions work correctly: only members of the ict257 group can access the shared folder and its files.

## Cleanup

To remove all users, the group, and the shared folder:

```bash
sudo userdel -r student1
sudo userdel -r student2
sudo userdel -r student3
sudo groupdel ict257
sudo rm -rf /home/ict257-shared
```

Verify the cleanup:

```bash
grep ict257 /etc/group
```

Expected output (no output means the group no longer exists):

```
```
