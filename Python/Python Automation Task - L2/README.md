# Python Automation Task - L2

## Disk Space Monitoring and Alert Automation

### 1. Problem Statement

As a DevOps engineer, manually checking disk space on a server is time-consuming. To automate this task, I created a Python script that monitors disk usage and generates a critical alert when the disk usage exceeds 80%.

The script records the current timestamp and disk usage percentage in an `alerts.log` file. It uses Python's built-in modules to collect disk statistics, calculate usage, and write alerts automatically.

### 2. Technologies Used

- **Language:** Python 3
- **Module:** `shutil` – to retrieve disk usage statistics
- **Module:** `datetime` – to capture the current timestamp
- **File Handling:** Python append mode (`a`)
- **Operating System:** Linux
- **Tools:** VS Code, Linux Terminal, Git, GitHub

### 3. Steps Followed

**Step 1: Fetch Disk Statistics**

Used `shutil.disk_usage("/")` to retrieve the total, used, and free disk space in bytes.

**Step 2: Calculate Disk Usage Percentage**

Calculated the used disk space percentage using the formula:

`(used / total) * 100`

Rounded the result to two decimal places using Python's `round()` function.

**Step 3: Capture Timestamp**

Used `datetime.datetime.now()` to get the current date and time, then formatted it using `strftime()`.

**Step 4: Check Disk Usage Threshold**

Used an `if` condition to check whether disk usage exceeds 80%.

**Step 5: Generate and Store Alerts**

If disk usage exceeds 80%, the script generates a critical alert and writes it to `alerts.log` using append mode. This preserves previously recorded alerts.

**Step 6: Test the Script**

Temporarily lowered the threshold to a value below the current disk usage to test alert generation. Verified the log file and restored the threshold to 80%.

### 4. How to Run the Script

**Step 1: Check Python installation**

```
python3 --version
```

## Create file 

```
vi disk_monitor.py
```

## Complete Script
Your disk_monitor.py should now look like this:
```
#!/usr/bin/env python3

import shutil
import datetime

# Get disk information
total, used, free = shutil.disk_usage("/")

print("Total:", total)
print("Used:", used)
print("Free:", free)

# Calculate disk usage percentage
used_percentage = round((used / total) * 100, 2)

print("Disk Usage:", used_percentage, "%")

# Get current timestamp
current_time = datetime.datetime.now()
current_time = current_time.strftime("%Y-%m-%d %H:%M:%S")

# Check disk usage
if used_percentage > 80:

    message = f"[{current_time}] CRITICAL: Disk space running low! Current usage is {used_percentage}%."

    with open("alerts.log", "a") as file:
        file.write(message + "\n")

**Step 2: Run the script**

```
python3 disk_monitor.py
```

**Step 3: View the alert log**

```
cat alerts.log
```

### 6. Expected Output

If disk usage exceeds 80%, the script generates an alert similar to the following:

```
[2026-10-09 11:30:45] CRITICAL: Disk space running low! Current usage is 85.20%.
```

If disk usage is 80% or below, no critical alert is written to the log file.