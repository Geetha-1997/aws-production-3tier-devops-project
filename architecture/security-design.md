# Security Design

## Overview

Security is one of the most important aspects of this project.

The infrastructure follows the AWS Shared Responsibility Model and the principle of Least Privilege to protect the application, network, and database.

The design ensures that only authorized users and services can access AWS resources.

---

# Security Objectives

- Protect the application from unauthorized access
- Isolate resources using private subnets
- Secure administrative access
- Encrypt communication
- Follow the Principle of Least Privilege
- Monitor and log security events

---

# Network Security

The infrastructure is divided into Public and Private Subnets.

## Public Subnets

Resources:

- Application Load Balancer (ALB)
- Bastion Host
- NAT Gateway

These resources are the only components exposed to the Internet.

---

## Private Application Subnets

Resources:

- Amazon EC2 Application Servers
- Docker Containers

Application servers do not have public IP addresses and can only receive traffic from the Application Load Balancer.

---

## Private Database Subnets

Resources:

- Amazon RDS MySQL (Multi-AZ)

The database is never directly accessible from the Internet.

Only the application servers can connect to the database.

---

# Security Groups

Security Groups act as virtual firewalls for AWS resources.

## Application Load Balancer Security Group

Inbound Rules

- HTTP (80) from Internet
- HTTPS (443) from Internet

Outbound Rules

- Allow traffic to EC2 Application Servers

---

## EC2 Security Group

Inbound Rules

- HTTP (80) from ALB Security Group
- SSH (22) only from Bastion Host Security Group

Outbound Rules

- MySQL (3306) to RDS
- HTTPS (443) for software updates through NAT Gateway

---

## RDS Security Group

Inbound Rules

- MySQL (3306) only from EC2 Security Group

Outbound Rules

- Default AWS-managed outbound rules

The database is isolated from direct Internet access.

---

# Bastion Host

The Bastion Host provides secure administrative access to private EC2 instances.

Developers connect to the Bastion Host first and then access private resources.

Benefits:

- No direct SSH access to private EC2 instances
- Centralized administration
- Reduced attack surface

---

# IAM (Identity and Access Management)

IAM is used to control access to AWS resources.

The following IAM roles will be used:

- EC2 Instance Role
- GitHub Actions Deployment Role
- CloudWatch Monitoring Role

IAM Best Practices:

- Least Privilege
- No Root User Access
- IAM Roles instead of Access Keys
- Multi-Factor Authentication (MFA)

---

# Encryption

## Data in Transit

Communication between clients and the Application Load Balancer is encrypted using HTTPS.

AWS Certificate Manager (ACM) provides SSL/TLS certificates.

---

## Data at Rest

Amazon RDS storage encryption is enabled.

Snapshots and backups are also encrypted.

---

# Monitoring and Logging

Security events are monitored using:

- Amazon CloudWatch
- CloudWatch Alarms
- Amazon SNS Notifications

Logs collected include:

- EC2 metrics
- ALB metrics
- RDS metrics
- Auto Scaling events

---

# High Availability Security

Security controls are deployed across multiple Availability Zones.

Benefits:

- No single point of failure
- Continuous application availability
- Improved resilience

---

# Secrets Management

Sensitive information is never stored in source code.

Examples:

- Database Passwords
- API Keys
- Access Tokens

In a production environment, AWS Secrets Manager or AWS Systems Manager Parameter Store should be used.

---

# AWS Shared Responsibility Model

AWS is responsible for:

- Physical security
- Networking infrastructure
- Data center operations
- Hardware maintenance

The customer is responsible for:

- IAM policies
- Security Groups
- Operating system updates
- Application security
- Data protection

---

# Security Best Practices Implemented

- Principle of Least Privilege
- Private Subnets
- Bastion Host
- Security Groups
- HTTPS using ACM
- IAM Roles
- Encrypted Database
- Multi-AZ Deployment
- Monitoring with CloudWatch
- Alerts using SNS

---

# Future Security Enhancements

The following services can be added in future versions:

- AWS WAF
- AWS Shield
- AWS Secrets Manager
- AWS Systems Manager Session Manager
- AWS Config
- Amazon GuardDuty
- AWS CloudTrail
- AWS KMS
- AWS Inspector

---

# Summary

This security design provides multiple layers of protection by combining network isolation, identity management, encryption, monitoring, and secure administrative access. The implementation follows AWS security best practices and is designed to support a highly available and production-ready application.
