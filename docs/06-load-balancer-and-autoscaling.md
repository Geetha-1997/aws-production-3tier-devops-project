# Load Balancer and Auto Scaling

## Overview

The Application Load Balancer (ALB) and Auto Scaling Group (ASG) together ensure that the application remains highly available, fault tolerant, and scalable.

---

# Objectives

- Distribute incoming traffic across multiple EC2 instances.
- Automatically scale the application based on demand.
- Improve fault tolerance.
- Eliminate single points of failure.

---

# Application Load Balancer (ALB)

## Purpose

The ALB receives all incoming HTTP/HTTPS requests and distributes them across healthy EC2 instances.

## Features

- Layer 7 Load Balancer
- Path-based routing
- Host-based routing
- SSL termination
- Health checks
- High Availability

---

# Request Flow

Internet

↓

Route 53

↓

Application Load Balancer

↓

EC2 Instance 1

EC2 Instance 2

↓

Amazon RDS

---

# Health Checks

The ALB continuously monitors EC2 instances.

If an instance becomes unhealthy:

- Traffic is stopped.
- Auto Scaling replaces the failed instance.

---

# Auto Scaling Group

## Purpose

Automatically launch or terminate EC2 instances based on application demand.

---

# Scaling Policies

Scale Out

- CPU Utilization > 70%
- Launch additional EC2 instance

Scale In

- CPU Utilization < 30%
- Terminate unnecessary instance

---

# Benefits

- High Availability
- Elastic Scalability
- Cost Optimization
- Automatic Recovery

---

# Deployment Across Availability Zones

Availability Zone A

- EC2 Instance
- Auto Scaling

Availability Zone B

- EC2 Instance
- Auto Scaling

This ensures uninterrupted service even if one Availability Zone fails.

---

# Summary

Using ALB and ASG together provides a highly available, scalable, and resilient application architecture.
