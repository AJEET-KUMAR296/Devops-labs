
# Shell Commands - L1

## Problem Statement

The objective of this assignment is to understand commonly used Linux text-processing commands.

This task focuses on the primary use cases of:

- grep
- awk
- sed

These commands are widely used in Linux and DevOps for searching, filtering, extracting, and modifying text from files and command output.

---

## 1. grep

grep is mainly used to search for specific text or patterns inside files or command output.

### Primary Use Cases

- Search for a word inside a file
- Find matching lines
- Search log files
- Filter command output
- Perform case-insensitive searches

### Basic Syntax

```bash
grep "pattern" filename
````

### Example

```bash
grep "error" application.log
```

This command displays all lines containing the word `error`.

### Case-Insensitive Search

```bash
grep -i "error" application.log
```

The `-i` option ignores uppercase and lowercase differences.

### Example with Command Output

```bash
ps aux | grep nginx
```

This can be used to search for an Nginx process from the running process list.

---

## 2. awk

awk is mainly used to process structured text and extract specific columns or fields.

It is especially useful when working with output that contains multiple columns.

### Primary Use Cases

* Extract specific columns
* Process structured text
* Generate simple reports
* Perform calculations
* Filter data based on conditions

### Basic Syntax

```bash
awk '{print $1}' filename
```

Here:

```text
$1 = First column
$2 = Second column
$3 = Third column
```

### Example

```bash
awk '{print $1}' employees.txt
```

This displays only the first column from the file.

### Example Using /etc/passwd

```bash
awk -F: '{print $1}' /etc/passwd
```

Explanation:

```text
-F:     Use : as the field separator
$1      Print the first field
```

This command displays usernames from `/etc/passwd`.

---

## 3. sed

sed stands for Stream Editor.

It is mainly used to search, replace, delete, or modify text automatically.

### Primary Use Cases

* Replace text
* Modify configuration files
* Delete specific lines
* Print selected lines
* Automate text editing

### Basic Syntax

```bash
sed 's/old/new/' filename
```

### Example

Suppose `file.txt` contains:

```text
Welcome to Linux
```

Run:

```bash
sed 's/Linux/DevOps/' file.txt
```

Output:

```text
Welcome to DevOps
```

The original file is not changed unless the `-i` option is used.

### Modify the File Directly

```bash
sed -i 's/Linux/DevOps/' file.txt
```

The `-i` option updates the file directly.

---

## Simple Example

Suppose a file named `users.txt` contains:

```text
101 Ajit DevOps
102 Rahul Developer
103 Aman DevOps
```

### Using grep

```bash
grep "DevOps" users.txt
```

Output:

```text
101 Ajit DevOps
103 Aman DevOps
```

### Using awk

```bash
awk '{print $2}' users.txt
```

Output:

```text
Ajit
Rahul
Aman
```

### Using sed

```bash
sed 's/DevOps/Cloud/g' users.txt
```

Output:

```text
101 Ajit Cloud
102 Rahul Developer
103 Aman Cloud
```

---

## Hands-On Tasks

### 1. Create the log file

```bash
vi server.log
```

Press `i` to enter insert mode, then add these exactly 10 lines:

```text
2026-09-28 10:00:01 INFO Server started successfully
2026-09-28 10:01:12 INFO User login successful
2026-09-28 10:02:20 WARNING CPU usage is high
2026-09-28 10:03:15 ERROR Database connection failed
2026-09-28 10:04:10 INFO Backup started
2026-09-28 10:05:45 ERROR Failed to connect to API
2026-09-28 10:06:30 INFO Backup completed
2026-09-28 10:07:25 WARNING Memory usage is high
2026-09-28 10:08:40 ERROR Application timeout occurred
2026-09-28 10:09:50 INFO Server is running normally
```

Then save and exit:

### 2. Check the file

```bash
cat server.log
```

### 3. Extract only `ERROR` lines using `grep`

```bash
grep "ERROR" server.log
```

Expected output:

```text
2026-09-28 10:03:15 ERROR Database connection failed
2026-09-28 10:05:45 ERROR Failed to connect to API
2026-09-28 10:08:40 ERROR Application timeout occurred

You can also show the line numbers:

```bash
grep -n "ERROR" server.log
```

Output:

```text
4:2026-09-28 10:03:15 ERROR Database connection failed
6:2026-09-28 10:05:45 ERROR Failed to connect to API
9:2026-09-28 10:08:40 ERROR Application timeout occurred
```

You can also save the result as a log:

```bash
grep "ERROR" server.log > error-logs.txt
```

Check it:

```bash
cat error-logs.txt
```

Output:

```text
2026-09-28 10:03:15 ERROR Database connection failed
2026-09-28 10:05:45 ERROR Failed to connect to API
2026-09-28 10:08:40 ERROR Application timeout occurred
```