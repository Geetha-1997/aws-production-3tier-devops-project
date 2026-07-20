# Architecture Design

## Region

- ap-south-1 (Mumbai)

## Availability Zones

- ap-south-1a
- ap-south-1b

## VPC

10.0.0.0/16

## Public Subnets

10.0.1.0/24

10.0.2.0/24

## Private Application Subnets

10.0.11.0/24

10.0.12.0/24

## Private Database Subnets

10.0.21.0/24

10.0.22.0/24

## Components

- Internet Gateway
- NAT Gateway
- Bastion Host
- Application Load Balancer
- Auto Scaling Group
- EC2
- Amazon RDS Multi-AZ
- Route 53
- CloudWatch
- SNS
- SQS

## Architecture Goals

- High Availability
- High Scalability
- Security
- Fault Tolerance
- Automation
- Monitoring
