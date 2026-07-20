# Deployment Guide

## Overview

This document explains how to deploy the Production-Grade Highly Available & Highly Scalable AWS 3-Tier Infrastructure.

---

# Prerequisites

Before deployment, ensure the following are available:

- AWS Account
- AWS CLI
- Terraform
- Git
- Docker
- Ansible
- GitHub Account
- Visual Studio Code

---

# Step 1: Clone Repository

```bash
git clone https://github.com/<your-username>/aws-production-3tier-devops-project.git
```

Move inside the repository.

```bash
cd aws-production-3tier-devops-project
```

---

# Step 2: Configure AWS CLI

```bash
aws configure
```

Provide:

- Access Key
- Secret Key
- Region
- Output Format

---

# Step 3: Initialize Terraform

```bash
terraform init
```

---

# Step 4: Validate Configuration

```bash
terraform validate
```

---

# Step 5: Review Execution Plan

```bash
terraform plan
```

---

# Step 6: Deploy Infrastructure

```bash
terraform apply
```

Confirm deployment by typing:

```text
yes
```

---

# Step 7: Configure EC2 Instances

Run Ansible playbook.

```bash
ansible-playbook site.yml
```

---

# Step 8: Deploy Docker Application

```bash
docker compose up -d
```

---

# Step 9: Verify Deployment

Check:

- Route53 DNS
- ALB DNS
- EC2 Health
- RDS Status
- CloudWatch
- SNS Notifications

---

# Expected Result

Users should be able to access the application using the Route53 domain.
