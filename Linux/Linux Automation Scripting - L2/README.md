# Linux Automation Scripting - L2
## Purpose

This project demonstrates an automated daily backup system using a Bash script and cron on Amazon Linux.

The script compresses the app_data directory into a .tar.gz archive, adds the current date to the filename, and stores the backup in the backups directory.

## Environment

Operating System: Amazon Linux
Shell: Bash
Automation Tool: Cron
```

## Step 0: Check your AWS Linux

Run:

```bash
pwd
```
You'll see something like that `/home/ec2-user`

## Step 1: Environment Setup

```
1. Create `app_data`

```bash
mkdir -p /home/ec2-user/app_data
```

## Step 2: Create the three empty files
Inside app_data dir, then create these files:

```bash
cd app_data
```

```bash
touch /home/ec2-user/app_data/log1.txt
touch /home/ec2-user/app_data/log2.txt
touch /home/ec2-user/app_data/config.yaml
```
or

```bash
touch log1.txt log2.txt config.yaml
```
So you can create like this also but you have to be in correct folder/Dir.

## Step 3: Create backup directory

```bash
mkdir -p /home/ec2-user/backups
```

####  Verify

```bash
ls -l /home/ec2-user/app_data
```

You should see:

```text
config.yaml
log1.txt
log2.txt
```
---

## Step 4: Create the Script

Go to your home directory:

```bash
cd /home/ec2-user
```

Create the script:

```bash
vi daily_backup.sh
```

```bash
#!/bin/bash

SOURCE_DIR="/home/ec2-user/app_data"
DEST_DIR="/home/ec2-user/backups"

DATE=$(date +"%Y-%m-%d")

BACKUP_FILENAME="backup_${DATE}.tar.gz"

if [ ! -d "$SOURCE_DIR" ]; then
    echo "ERROR: Source directory does not exist: $SOURCE_DIR"
    exit 1
fi

tar -czf "$DEST_DIR/$BACKUP_FILENAME" \
    -C "$(dirname "$SOURCE_DIR")" \
    "$(basename "$SOURCE_DIR")"

echo "Backup completed successfully!"
echo "Backup file: $DEST_DIR/$BACKUP_FILENAME"
```

Save:

```text
Esc
:wq
```

#### Check the file

```bash
cat daily_backup.sh
```
---

## Step 5: Core Backup Logic

The important variables are:

```bash
SOURCE_DIR="/home/ec2-user/app_data"
DEST_DIR="/home/ec2-user/backups"
DATE=$(date +%Y-%m-%d)
```

For example, if today's date is September 30, 2026:

```text
DATE = 2026-09-30
```

So the backup filename becomes:

```text
backup_2026-09-30.tar.gz
```

The script creates it inside:

```text
/home/ec2-user/backups/
```

---

## Step 6: Error Handling and Testing

#### Make the script executable by the owner

```bash
chmod u+x daily_backup.sh
```

Check:

```bash
ls -l daily_backup.sh
```

```text
-rwxr--r-- 1 ec2-user ec2-user ... daily_backup.sh
```


#### Run the script

```bash
./daily_backup.sh
```

Expected Output:

```text
Backup completed successfully!
```

Check the backup:

```bash
ls -l /home/ec2-user/backups
```

You should see something like:

```text
backup_2026-09-30.tar.gz
```

#### Check what's inside the backup

```bash
tar -tzf /home/ec2-user/backups/backup_$(date +%Y-%m-%d).tar.gz
```

Expected:

```text
app_data/
app_data/log1.txt
app_data/log2.txt
app_data/config.yaml
```

---
## Step 7: Test your error handling

So script already has:

```bash
if [ ! -d "$SOURCE_DIR" ]; then
    echo "ERROR: Source directory does not exist: $SOURCE_DIR"
    exit 1
fi
```

We can test it.

Temporarily rename the directory:

```bash
mv /home/ec2-user/app_data /home/ec2-user/app_data_test
```

Run:

```bash
./daily_backup.sh
```

You should get:

```text
ERROR: Source directory does not exist: /home/ec2-user/app_data
```

Now restore it:

```bash
mv /home/ec2-user/app_data_test /home/ec2-user/app_data
```

Run again:

```bash
./daily_backup.sh
```

You should get:

```text
Backup completed successfully!
```
---
## Step 8: Cron Automation
### 1. Check whether cron is running

```bash
sudo systemctl status crond
```

If you see:

```text
Active: active (running)
```

you're ready.

### If `crond` is not installed

For Amazon Linux 2023:

```bash
sudo dnf install cronie -y
```

Then:

```bash
sudo systemctl enable --now crond
```

---

## 2. Open your user's crontab

Run:

```bash
crontab -e
```

If it asks for an editor, choose **vi**.

Add this exact line:

```text
0 0 * * * /home/ec2-user/daily_backup.sh
```

This means:

```text
0    0    *    *    *
│    │    │    │    │
│    │    │    │    └── Every day of week
│    │    │    └─────── Every month
│    │    └──────────── Every day
│    └───────────────── 00 hours
└────────────────────── 00 minutes
```

So:

**Every day at 12:00 AM (midnight).**

Save and Exit.

### 3. Verify the cron job

```bash
crontab -l
```

You should see:

```text
0 0 * * * /home/ec2-user/daily_backup.sh
```
 
 
