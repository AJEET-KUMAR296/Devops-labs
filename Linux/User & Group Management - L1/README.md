# User and Group Management - L1

## Problem Statement

The objective of this task is to understand how Linux controls user and group access through system configuration files.

Two important files used for this purpose are:

- /etc/passwd
- /etc/group

---

## Purpose of /etc/passwd

The `/etc/passwd` file stores basic information about user accounts available on a Linux system.

Each line represents one user account.

Example:

```text
root:x:0:0:root:/root:/bin/bash
````

The fields represent:

```text
Username : Password Placeholder : User ID : Group ID : Description : Home Directory : Login Shell
```

### Main Purpose

The `/etc/passwd` file is used to store user account information such as:

* Username
* User ID (UID)
* Primary Group ID (GID)
* User description
* Home directory
* Login shell

### Important Note

The actual encrypted password is not stored directly in `/etc/passwd`.

The `x` in the password field indicates that the encrypted password is stored in:

```text
/etc/shadow
```

---

## Purpose of /etc/group

The `/etc/group` file stores information about groups available on the Linux system.

Each line represents one group.

Example:

```text
developers:x:1001:user1,user2
```

The fields represent:

```text
Group Name : Password Placeholder : Group ID : Group Members
```

### Main Purpose

The `/etc/group` file is used to:

* Store group names
* Store Group IDs (GID)
* Maintain group membership
* Control shared access to files and directories

Groups make it easier to manage permissions for multiple users at the same time.

---

## Difference Between /etc/passwd and /etc/group

| File        | Purpose                                       |
| ----------- | --------------------------------------------- |
| /etc/passwd | Stores user account information               |
| /etc/group  | Stores group information and group membership |


## Useful Commands

### Create a Group

```bash
groupadd devteam
````

This command creates a new group named `devteam`.

---

### Create a User

```bash
useradd devuser
```

This command creates a new user named `devuser`.

---

### Set Password for the User

```bash
passwd devuser
```

This command sets or changes the password for `devuser`.

---

### Add User to a Group

```bash
usermod -aG devteam devuser
```

Explanation:

```text
-a = Append the user to an additional group
-G = Specify supplementary group
devteam = Group name
devuser = User name
```

---

### Verify User Group Membership

```bash
groups devuser
```

Output before deleting the user:

```text
devuser : devuser devteam
```

This confirms that `devuser` belongs to the `devteam` group.

---

### Check User Information in /etc/passwd

```bash
grep devuser /etc/passwd
```

This displays the account information of `devuser` from the `/etc/passwd` file.

---

### Check Group Information in /etc/group

```bash
grep devteam /etc/group
```

This displays information about the `devteam` group and its members.

---

### Delete the User

```bash
userdel devuser
```

This deletes the `devuser` account.

After deleting the user, running:

```bash
groups devuser
```

returns:

```text
groups: 'devuser': no such user
```

because the account has already been removed.

````

