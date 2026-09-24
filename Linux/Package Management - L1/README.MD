# Package Management - L1

## Problem Statement

The objective of this assignment is to understand Linux package management and how software is installed, updated, and maintained using package managers.

This task focuses on:

- Understanding the difference between apt and yum
- Updating the package repository
- Installing curl or wget
- Verifying the installed package

---

## What is Package Management?

Package management is the process of installing, updating, upgrading, and removing software packages in a Linux operating system.

A package manager automatically handles:

- Software installation
- Dependencies
- Package updates
- Package removal
- Repository information

---

## apt vs yum

apt and yum are package management tools used by different Linux distributions.

| Feature | apt | yum |
|---|---|---|
| Full Form | Advanced Package Tool | Yellowdog Updater Modified |
| Used In | Debian, Ubuntu | CentOS, RHEL |
| Package Format | .deb | .rpm |
| Update Repository | apt update | yum check-update |
| Install Package | apt install package | yum install package |
| Remove Package | apt remove package | yum remove package |
| Upgrade Packages | apt upgrade | yum update |

---

### 1. Check Operating System

```bash
cat /etc/os-release
````

This command displays the Linux distribution and version.

---

### 2. Update Packages

For Amazon Linux:

```bash
sudo yum update -y
```

---

### 3. Install curl

```bash
sudo yum install curl -y
```

---

### 4. Check curl Version

```bash
curl --version
```

---

### 5. Install wget

```bash
sudo yum install wget -y
```

---

### 6. Check wget Version

```bash
wget --version
```


If you want only the commands to run in your AWS terminal, use:
---

```bash
cat /etc/os-release
sudo yum update -y
sudo yum install curl -y
curl --version
sudo yum install wget -y
wget --version
````

If `yum` does not work, replace `yum` with `dnf`.
