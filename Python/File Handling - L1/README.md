# File Handling - L1

## 1. `w` mode vs `a` mode

When opening a file in Python:

### `"w"` — Write mode

```python
open("system_info.txt", "w")
```
Example:

```python
with open("system_info.txt", "w") as file:
    file.write("System check passed")
```

### `"a"` — Append mode

```python
open("system_info.txt", "a")
```
Example:

```python
with open("system_info.txt", "a") as file:
    file.write("System check passed\n")
```
---

# 2. Create the Python Script

Create a file:

```bash
vi test_python.py
```

Put this code inside:

```python
#!/usr/bin/env python3

# Write to the file
with open("system_info.txt", "w") as file:
    file.write("System check passed")

# Read from the file
with open("system_info.txt", "r") as file:
    content = file.read()

# Print the contents
print(content)
```

---

# 3. Understanding the Code

### Write

```python
with open("system_info.txt", "w") as file:
```

Opens `system_info.txt` in **write mode**.

```python
file.write("System check passed")
```

Writes the text into the file.

---

### Read

```python
with open("system_info.txt", "r") as file:
```

Opens the file in **read mode**.

```python
content = file.read()
```

Reads the contents and stores them in the variable `content`.

---

### Print

```python
print(content)
```

Displays the file contents on the terminal.

---

Then run:

```bash
python3 file_handling.py
```

Expected output:

```text
System check passed
```

---

# 5. Verify the File

Run:

```bash
ls -l
```

You should see:

```text
file_handling.py
system_info.txt
```

Check the file:

```bash
cat system_info.txt
```

Output:

```text
System check passed
```

---

 