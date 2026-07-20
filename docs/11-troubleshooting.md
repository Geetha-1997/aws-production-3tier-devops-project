# Troubleshooting Guide

## Common Issues

---

# Terraform Initialization Failed

Possible Causes

- AWS credentials missing
- Internet unavailable

Solution

```bash
aws configure
terraform init
```

---

# Terraform Apply Failed

Possible Causes

- Resource already exists
- IAM permissions missing

Solution

- Review Terraform error logs
- Delete conflicting resources
- Retry deployment

---

# EC2 Instance Not Healthy

Possible Causes

- Security Group issue
- Application not running
- Health Check path incorrect

Solution

- Verify Security Groups
- Restart application
- Review ALB Health Checks

---

# Load Balancer Not Routing Traffic

Possible Causes

- Target Group unhealthy
- Security Group misconfiguration

Solution

- Check Target Group
- Verify Listener Rules

---

# Database Connection Failed

Possible Causes

- Incorrect credentials
- Security Group issue

Solution

- Verify MySQL credentials
- Check inbound rules

---

# Docker Container Not Running

Solution

```bash
docker ps -a

docker logs <container-id>
```

---

# Ansible Playbook Failed

Solution

```bash
ansible-playbook site.yml -vvv
```

---

# CloudWatch Alarm Not Triggering

Check:

- Alarm Threshold
- SNS Subscription
- Metrics Configuration
