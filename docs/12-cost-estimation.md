# Cost Estimation

## Overview

This project is designed for learning and demonstration purposes.

---

# Estimated AWS Services

| Service | Quantity |
|----------|----------|
| VPC | 1 |
| Internet Gateway | 1 |
| NAT Gateway | 1 |
| Route Tables | 4 |
| Public Subnets | 2 |
| Private Subnets | 4 |
| Bastion Host | 1 |
| Application Load Balancer | 1 |
| EC2 Instances | 2 |
| Auto Scaling Group | 1 |
| Amazon RDS | 1 Multi-AZ |
| Route53 Hosted Zone | 1 |
| CloudWatch | Enabled |
| SNS | 1 |
| SQS | 1 |

---

# Estimated Monthly Cost

Learning Environment:

Approximately **$40–80 USD/month** depending on usage.

Production Environment:

Cost depends on:

- Traffic
- EC2 Size
- Database Size
- NAT Gateway Usage
- Data Transfer
- Storage

---

# Cost Optimization

- Use Auto Scaling
- Stop unused resources
- Delete idle Elastic IPs
- Use AWS Budgets
- Monitor Cost Explorer
