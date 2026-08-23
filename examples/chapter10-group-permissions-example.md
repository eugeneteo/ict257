# Linux Group Permissions Lab Example

This lab supplements RH124 Chapter 10, Section 10.8.

## Scenario

Two students in the ICT257 module need to collaborate on a short report. They must share files in a folder where both group members can create and modify content, but other users cannot access the files. A third student from a different module will attempt to access the report to verify that the permissions work correctly.

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

### Step 2: Create two student users and add them to the group

Create two users for the ICT257 module and add them to the group:

```bash
sudo useradd student1
sudo useradd student2

sudo usermod -aG ict257 student1
sudo usermod -aG ict257 student2
```

Set passwords for the users:

```bash
echo 'tR7#jN8wL5hX9z' | sudo passwd --stdin student1
echo 'tR7#jN8wL5hX9z' | sudo passwd --stdin student2
```

**Alternative method:** You can also run `sudo passwd student1` and `sudo passwd student2` manually to set passwords interactively.

Verify the group membership:

```bash
grep ict257 /etc/group
```

Expected output (the GID may differ):

```
ict257:x:1001:student1,student2
```

### Step 3: Create a third student (outside the group)

Create a user who is not in the ict257 group:

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

For comparison, check a group member's groups:

```bash
groups student1
```

Expected output:

```
student1 : student1 ict257
```

This shows that student1 is in both their personal group and the ict257 group, while student3 is only in their personal group.

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

Without this step, when student1 creates a file, it would be owned by `student1:student1`. With setgid, the file becomes `student1:ict257`, allowing all group members to modify it.

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

Switch to student1 and activate the ict257 group membership:

```bash
su - student1
newgrp ict257
```

The `newgrp` command activates the group membership in the current session. Without it, you would need to log out and log back in for the group change to take effect.

Verify your active groups:

```bash
groups
```

Expected output:

```
ict257 student1
```

Create the report:

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
-rw-rw-r-- 1 student1 ict257 234 Aug 23 12:05 /home/ict257-shared/group-report.md
```

Notice that the group ownership is `ict257` (inherited from the directory due to setgid) and permissions are `rw-rw-r--`.

**What it would look like without newgrp:** If you had run `cat > /home/ict257-shared/group-report.md` without first activating the group membership with `newgrp ict257`, the file would look like this:

```
-rw-rw-r-- 1 student1 student1 234 Aug 23 12:05 /home/ict257-shared/group-report.md
```

The group would be `student1` instead of `ict257`, meaning other group members could not modify the file. This is why the `newgrp` command is important even though setgid is set on the directory.

Exit the student1 shell:

```bash
exit
```

### Step 9: Verify that group members can read and modify the file

Test that student2 can read and modify the file:

```bash
su - student2
newgrp ict257
```

Activate the group membership, then read the file:

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

Verify your current groups before appending:

```bash
groups
```

Expected output:

```
ict257 student2
```

If you see only `student2`, you need to run `newgrp ict257` again.

Check the file permissions and ownership:

```bash
ls -l /home/ict257-shared/group-report.md
```

Expected output:

```
-rw-rw-r-- 1 student1 ict257 234 Aug 23 12:05 /home/ict257-shared/group-report.md
```

If you see different permissions or group ownership, the file may have been created incorrectly. Delete and recreate it.

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
ls: cannot access '/home/ict257-shared': Permission denied
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
