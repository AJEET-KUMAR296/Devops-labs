## 1. Absolute Path vs Relative Path

### Absolute path
An absolute path starts from the root `/`.

Example:

```bash
/project/src/main
```

It tells Linux the **complete location** of `main`.

Another example:

```bash
/home/ec2-user/app_data
```

### Relative path
A relative path starts from your **current directory**.

For example, if you are currently in:

```bash
/project
```

then:

```bash
cd src
```

means go to:

```text
/project/src
```

And:

```bash
cd src/main
```

means:

```text
/project/src/main
```
---

# 2. Hands-on Task

We need to create:

```text
/project
└── src
    └── main
        └── app.log
```

### Step 1 — Check where you are

```bash
pwd
```

You might see:

```text
/home/ec2-user
```

---

### Step 2 — Create the nested directories

Use:

```bash
sudo mkdir -p /project/src/main
```
---

### Step 3 — Give your current user access

If you're using `ec2-user`:

```bash
sudo chown -R $USER:$USER /project
```

You can check:

```bash
ls -ld /project
```

---

### Step 4 — Navigate into `main`

```bash
cd /project/src/main
```

Check your location:

```bash
pwd
```

Expected:

```text
/project/src/main
```

Notice that this is an **absolute path**.

---

### Step 5 — Create `app.log`

```bash
touch app.log
```

Check:

```bash
ls -l
```

You should see something similar to:

```text
-rw-r--r-- 1 ec2-user ec2-user 0 Oct  6 13:00 app.log
```

The `0` means the file is empty.

---

# 3. Navigate Using Relative Paths

Now let's practice the concept.

You are currently here:

```text
/project/src/main
```

Go one directory back:

```bash
cd ..
```

Now:

```bash
pwd
```

Output:

```text
/project/src
```

Go back again:

```bash
cd ..
```

Now:

```text
/project
```

From `/project`, use a **relative path**:

```bash
cd src/main
```

Check:

```bash
pwd
```

Output:

```text
/project/src/main
```

So:

```bash
cd /project/src/main
```

is an **absolute path**.

Whereas:

```bash
cd src/main
```

is a **relative path** when you're currently inside `/project`.

---

# 4. Show the Directory Structure

From `/project`, run:

```bash
cd /project
ls -R
```

Expected:

```text
.:
src

./src:
main

./src/main:
app.log
``` 

If tree is installed, you can also use:

```bash
tree /project
```

---

 