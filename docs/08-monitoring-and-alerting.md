# Monitoring and Alerting

## Overview

Amazon CloudWatch is used to monitor the health and performance of the infrastructure.

Amazon SNS sends notifications whenever CloudWatch detects an issue.

---

# Components

- Amazon CloudWatch
- CloudWatch Alarms
- Amazon SNS

---

# Metrics Monitored

EC2

- CPU Utilization
- Memory Usage
- Disk Usage
- Network Traffic

Application Load Balancer

- Request Count
- Healthy Hosts
- Response Time

Amazon RDS

- CPU Utilization
- Storage
- Connections

---

# CloudWatch Alarms

Example alarms:

- CPU > 70%
- Disk > 80%
- Instance Status Check Failed
- RDS Storage Low

---

# SNS Notifications

CloudWatch Alarm

↓

Amazon SNS

↓

Email Notification

---

# Benefits

- Real-time Monitoring
- Early Issue Detection
- Faster Incident Response
- Better Reliability
