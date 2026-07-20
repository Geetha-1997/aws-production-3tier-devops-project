# Database Design

## Overview

Amazon RDS MySQL is used as the relational database service for this project.

The database is deployed using a Multi-AZ configuration to ensure High Availability.

---

# Database Engine

- Amazon RDS
- MySQL

---

# Why Amazon RDS?

- Managed Database
- Automated Backups
- Automatic Failover
- Monitoring
- Encryption
- High Availability

---

# Multi-AZ Deployment

Primary Database

↓

Synchronous Replication

↓

Standby Database

If the primary instance fails, AWS automatically promotes the standby instance.

---

# Security

- Private Database Subnets
- Security Groups
- Encryption at Rest
- Encryption in Transit

---

# Backup Strategy

- Automated Daily Backups
- Point-in-Time Recovery
- Manual Snapshots before major changes

---

# Monitoring

Amazon CloudWatch monitors:

- CPU Utilization
- Free Storage
- Database Connections
- Read/Write Latency

---

# Summary

Amazon RDS Multi-AZ provides a reliable, secure, and highly available database layer.
