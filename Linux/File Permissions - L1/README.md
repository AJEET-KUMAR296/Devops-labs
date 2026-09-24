
# File Permissions - L1

## Problem Statement

The objective of this assignment is to understand Linux file permissions and how access can be controlled for the Owner, Group, and Others.

It focuses on understanding numeric permission 755 and modifying a shell script so that only the owner can execute it while everyone can read it.

---

## Understanding Linux File Permissions

File permissions are used to control who can read, write, or execute files in a Linux system.

Permissions help protect files from unauthorized access and allow only the required users or groups to perform specific actions.

Linux permissions are divided into three categories:

| Category | Meaning |
|---|---|
| Owner | User who owns the file |
| Group | Users who belong to the file's group |
| Others | All other users |

There are three basic permissions:

| Permission | Symbol | Numeric Value |
|---|---|---:|
| Read | r | 4 |
| Write | w | 2 |
| Execute | x | 1 |

Permissions are calculated by adding these values.

---

## Steps Followed to Create .sh file in Linux Server

### 1. Create the shell script using vi

```bash
vi script.sh
````

Press `i` to enter Insert mode and add:

```bash
#!/bin/bash

echo "File Permission Demo"

echo "Hostname:"
hostname

echo "Current Directory:"
pwd

echo "File Details:"
ls -l script.sh
```

Save and exit from `vi`:

```text
Esc
:wq
Enter
```

### 2. View the script content

```bash
cat script.sh
```

### 3. Check the current permission

```bash
ls -l script.sh
```

Initial output:

```text
-rw-r--r--. 1 root root 141 Sep 24 06:19 script.sh
```

### 4. Change permission to 755

```bash
chmod 755 script.sh
```

### 5. Verify the new permission

```bash
ls -l script.sh
```

Output:

```text
-rwxr-xr-x. 1 root root 141 Sep 24 06:19 script.sh
```

### 6. Execute the script

```bash
./script.sh
```

Output:

```text
File Permission Demo

Hostname:
ip-172-31-21-90.ec2.internal

Current Directory:
/root

File Details:
-rwxr-xr-x. 1 root root 141 Sep 24 06:19 script.sh
```

## Permission Explanation

`755` means:

```text
Owner  = 7 = Read + Write + Execute
Group  = 5 = Read + Execute
Others = 5 = Read + Execute
```

Permission:

```text
rwxr-xr-x
```
 