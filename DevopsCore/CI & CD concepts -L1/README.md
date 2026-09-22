# CI/CD Concepts - L1

## Problem Statement

The objective of this assignment is to understand the difference between:

* Continuous Integration
* Continuous Delivery
* Continuous Deployment

The assignment also demonstrates a theoretical CI/CD pipeline for a simple web application and identifies the tools that can be used at each stage.

---

## 1. Continuous Integration

Continuous Integration, or CI, is a DevOps practice where developers frequently merge their code changes into a shared repository.

Whenever new code is pushed, automated build and testing processes can run to check whether the application is working correctly.

### Example Flow

```text
Developer
    ↓
Git
    ↓
GitHub
    ↓
Build
    ↓
Automated Tests
```

### Example Tools

* Git
* GitHub
* GitHub Actions
* Jenkins
* Maven
* PyTest

---

## 2. Continuous Delivery

Continuous Delivery means that after the application is successfully built and tested, it is automatically prepared for release.

However, deployment to the production environment requires manual approval.

### Flow

```text
Code
 ↓
Build
 ↓
Test
 ↓
Staging
 ↓
Manual Approval
 ↓
Production
```

For example, after testing an application successfully, a DevOps engineer or authorized person approves the production deployment.

---

## 3. Continuous Deployment

Continuous Deployment automatically deploys the application to production after all required automated tests are successfully completed.

There is no manual approval before production deployment.

### Flow

```text
Code
 ↓
Build
 ↓
Test
 ↓
Staging
 ↓
Automatic Deployment
 ↓
Production
```

---

## Continuous Delivery vs Continuous Deployment

| Feature               | Continuous Delivery | Continuous Deployment |
| --------------------- | ------------------- | --------------------- |
| Code Integration      | Automated           | Automated             |
| Build                 | Automated           | Automated             |
| Testing               | Automated           | Automated             |
| Staging Deployment    | Automated           | Automated             |
| Production Deployment | Manual              | Automated             |
| Manual Approval       | Required            | Not Required          |

### Main Difference

In Continuous Delivery:

```text
Successful Testing
       ↓
Manual Approval
       ↓
Production
```

In Continuous Deployment:

```text
Successful Testing
       ↓
Automatic Deployment
       ↓
Production
```

---

# Theoretical CI/CD Pipeline

For this assignment, a simple web application is considered.

The theoretical CI/CD pipeline is:

```text
Developer
    ↓
VS Code
    ↓
Git
    ↓
GitHub
    ↓
GitHub Actions / Jenkins
    ↓
Build
    ↓
Automated Testing
    ↓
Docker
    ↓
Staging Environment
    ↓
Manual Approval / Automatic Deployment
    ↓
AWS EC2 / Azure VM
    ↓
Production
    ↓
Monitoring
```

---

## Tools Used at Each Stage

| Stage            | Tool                       | Purpose                                |
| ---------------- | -------------------------- | -------------------------------------- |
| Development      | VS Code                    | Write and modify application code      |
| Version Control  | Git                        | Track source code changes              |
| Repository       | GitHub                     | Store source code remotely             |
| CI/CD Automation | GitHub Actions / Jenkins   | Automate build, testing and deployment |
| Build            | Maven / npm                | Build the application                  |
| Testing          | JUnit / PyTest / Selenium  | Perform automated testing              |
| Containerization | Docker                     | Package the application                |
| Staging          | Docker / Virtual Machine   | Test application before production     |
| Deployment       | AWS EC2 / Azure VM         | Host the application                   |
| Monitoring       | CloudWatch / Azure Monitor | Monitor application performance        |

---

# Steps Followed

## Step 1: Created Project

A new folder named:

```text
CI-CD-Concepts-L1
```

was created and opened using Visual Studio Code.

## Step 2: Created Simple Web Application

An `index.html` file was created to represent a simple web application.

## Step 3: Created Pipeline Script

A PowerShell script named:

```text
pipeline.ps1
```

was created to demonstrate the major CI/CD pipeline stages.

The script represents:

```text
Source Code
    ↓
Build
    ↓
Testing
    ↓
Package
    ↓
Staging
    ↓
Production
```

## Step 4: Executed Script

The pipeline script was executed using:

```powershell
.\pipeline.ps1
```

## Step 5: Verified Output

The script successfully completed all theoretical pipeline stages.

## Step 6: Added Files to Git

The following Git commands were used:

```bash
git status
git add .
git commit -m "Add CI/CD Concepts L1 assignment"
```

## Step 7: Pushed Assignment to GitHub

The assignment was uploaded to GitHub using:

```bash
git push
```

---

# Output

The PowerShell pipeline script displayed the following result:

```text
Starting CI/CD Pipeline

Step 1: Source Code
Application code received from GitHub.

Step 2: Build
Building web application...
Build Successful

Step 3: Testing
Running automated tests...
Tests Passed

Step 4: Package
Preparing application for deployment...

Step 5: Staging
Deploying application to staging environment...

Step 6: Production
Application is ready for production deployment.

CI/CD Pipeline Completed Successfully
```

---

# Repository Structure

```text
CI-CD-Concepts-L1/
│
├── README.md
├── index.html
├── pipeline.ps1
└── screenshots/
    ├── 01-vscode-files.png
    ├── 02-pipeline-output.png
    └── 03-github-repository.png
```

---

# Conclusion

Continuous Integration helps developers regularly integrate, build, and test new code.

Continuous Delivery automatically prepares the application for release but requires manual approval before production deployment.

Continuous Deployment automatically deploys successful changes to production without requiring manual approval.

CI/CD helps development teams automate software delivery, detect errors earlier, and release applications more efficiently.
