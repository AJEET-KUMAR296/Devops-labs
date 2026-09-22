# CI/CD Concepts - L1

## Problem Statement

The objective of this assignment is to understand the difference between:

- Continuous Integration
- Continuous Delivery
- Continuous Deployment

## 1. Continuous Integration

Continuous Integration (CI) is a DevOps practice where developers frequently push their code to shared repository.

When any developers commit new code, so it automatically build application,run testand check errors.So developer can easily get build or fails.

### Example Flow

text
    ↓
Developer
    ↓
Git
    ↓
GitHub
    ↓
Build
    ↓
Automated Tests

---

## 2. Continuous Delivery

Continuous Delivery means that application is automatically,
Developed -> Build -> Tested -> Prepared for Deployment.

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

Note: After testing an application successfully, a DevOps engineer or authorized person approves the production deployment.

---

## 3. Continuous Deployment

Continuous Deployment  is the stage where application is automatically deployed to production.

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

| Feature               | Continuous Delivery         | Continuous Deployment |
| --------------------- | -------------------         | --------------------- |
| Automation            | Automated until production  | Fully automated       |     
| Approval              | Manual approval needed      | No manual approval    |
| Control and risk      | Lower risk                  | Higher automation risk|
| Use Cases             | Controlled releases         | Frequent releases     |
| Customer Feedback     | Slower                      | Faster                |
| Rollback Capability   | Usually manual              | Can be automated      |     

---

# Theoretical CI/CD Pipeline

A simple web application is considered as -

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

# Conclusion

Continuous Integration helps developers regularly integrate, build, and test new code.

Continuous Delivery automatically prepares the application for release but requires manual approval before production deployment.

Continuous Deployment automatically deploys successful changes to production without requiring manual approval.

CI/CD helps development teams automate software delivery, detect errors earlier, and release applications more efficiently.
