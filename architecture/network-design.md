# Network Design

## Overview

The network architecture is designed following AWS best practices to provide:

- High Availability
- High Scalability
- Secure Network Isolation
- Fault Tolerance
- Easy Management
- Production-grade Deployment

The entire infrastructure is deployed inside a dedicated Amazon VPC and distributed across two Availability Zones to eliminate single points of failure.

---

# Network Architecture

Internet

↓

Amazon Route 53

↓

Application Load Balancer

↓

Public Subnets

↓

Private Application Subnets

↓

Private Database Subnets

---

# Amazon VPC

## Purpose

Amazon Virtual Private Cloud (VPC) provides an isolated network for all AWS resources.

All application resources are deployed inside the VPC.

## CIDR Block

```
10.0.0.0/16
```

This CIDR block provides sufficient IP addresses for future expansion.

---

# Availability Zones

The infrastructure spans two Availability Zones.

- Availability Zone A
- Availability Zone B

Using multiple Availability Zones improves:

- High Availability
- Fault Tolerance
- Disaster Recovery

---

# Public Subnets

Two public subnets are created.

## Public Subnet A

Purpose:

- Bastion Host
- NAT Gateway
- Internet-facing resources

Example CIDR

```
10.0.1.0/24
```

---

## Public Subnet B

Purpose

- NAT Gateway
- Future expansion

Example CIDR

```
10.0.2.0/24
```

---

# Private Application Subnets

Application servers are deployed inside private subnets.

These servers cannot be accessed directly from the Internet.

Traffic only comes through the Application Load Balancer.

Example CIDRs

Private App Subnet A

```
10.0.11.0/24
```

Private App Subnet B

```
10.0.12.0/24
```

Resources deployed:

- EC2
- Docker Containers
- Auto Scaling Group

---

# Private Database Subnets

Database servers are isolated from the Internet.

Only application servers can communicate with the database.

Example CIDRs

Database Subnet A

```
10.0.21.0/24
```

Database Subnet B

```
10.0.22.0/24
```

Resources

- Amazon RDS MySQL
- Multi-AZ Standby

---

# Internet Gateway

## Purpose

The Internet Gateway allows communication between the Internet and resources located inside public subnets.

Used by:

- Bastion Host
- Application Load Balancer
- NAT Gateway

---

# NAT Gateway

## Purpose

Private EC2 instances require Internet access for:

- Docker image downloads
- Operating System updates
- Package installation
- Software updates

Instead of assigning public IP addresses, Internet access is provided through the NAT Gateway.

This improves security.

---

# Route Tables

## Public Route Table

Destination

```
0.0.0.0/0
```

Target

```
Internet Gateway
```

Associated with

- Public Subnet A
- Public Subnet B

---

## Private Route Table

Destination

```
0.0.0.0/0
```

Target

```
NAT Gateway
```

Associated with

- Private Application Subnets
- Private Database Subnets (only if outbound access is required)

---

# Bastion Host

The Bastion Host is deployed in a public subnet.

Purpose

- Secure SSH access
- Administrative access
- Troubleshooting

Developers connect to the Bastion Host first and then access private EC2 instances.

---

# Application Load Balancer

The Application Load Balancer distributes incoming traffic across multiple EC2 instances.

Benefits

- High Availability
- Load Distribution
- Health Checks
- Fault Tolerance

---

# Auto Scaling

Application servers are deployed inside an Auto Scaling Group.

Benefits

- Automatic scaling
- High Availability
- Reduced downtime
- Cost optimization

---

# Amazon RDS

The application database uses Amazon RDS MySQL.

Deployment Mode

- Multi-AZ

Benefits

- Automatic Failover
- High Availability
- Automated Backups

---

# Security Groups

Three Security Groups are used.

## ALB Security Group

Inbound

- HTTP (80)
- HTTPS (443)

Outbound

- EC2 Security Group

---

## EC2 Security Group

Inbound

- ALB Security Group
- Bastion Host (SSH)

Outbound

- RDS Security Group

---

## RDS Security Group

Inbound

- EC2 Security Group

Outbound

- None

---

# Traffic Flow

User

↓

Route 53

↓

Application Load Balancer

↓

EC2 Auto Scaling Group

↓

Amazon RDS

---

# High Availability Features

- Multi-AZ Deployment
- Application Load Balancer
- Auto Scaling Group
- Amazon RDS Multi-AZ
- Multiple Private Subnets

---

# Security Features

- Private Application Layer
- Private Database Layer
- Bastion Host
- Security Groups
- Network Isolation
- Least Privilege Access

---

# Summary

This network architecture provides a secure, scalable, and highly available environment suitable for hosting production applications on AWS. The design follows AWS best practices by separating public and private resources, implementing redundancy across Availability Zones, and securing access through layered networking controls.
