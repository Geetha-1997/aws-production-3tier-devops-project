# Terraform

## Overview

This directory contains the Infrastructure as Code (IaC) for the Production-Grade AWS 3-Tier DevOps Project.

Terraform is used to provision and manage AWS resources in a repeatable, version-controlled, and automated way.

## Project Structure

```text
terraform/
├── backend/
├── environments/
├── modules/
├── main.tf
├── provider.tf
├── variables.tf
├── outputs.tf
├── versions.tf
└── terraform.tfvars.example
```

## Modules

The infrastructure is divided into reusable modules.

- VPC
- Subnets
- Internet Gateway
- NAT Gateway
- Route Tables
- Security Groups
- Bastion Host
- ALB
- EC2
- Auto Scaling
- RDS
- Route53
- CloudWatch
- SNS
- SQS
- IAM

Each module will contain:

```text
main.tf
variables.tf
outputs.tf
```
