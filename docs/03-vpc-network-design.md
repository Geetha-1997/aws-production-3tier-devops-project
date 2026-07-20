# VPC Network Design

## Region

ap-south-1 (Mumbai)

## VPC

CIDR: 10.0.0.0/16

## Availability Zones

- ap-south-1a
- ap-south-1b

## Public Subnets

| Name | CIDR | AZ | Purpose |
|------|------|----|---------|
| Public-1 | 10.0.1.0/24 | ap-south-1a | ALB, Bastion Host |
| Public-2 | 10.0.2.0/24 | ap-south-1b | ALB, NAT Gateway |

## Private Application Subnets

| Name | CIDR | AZ | Purpose |
|------|------|----|---------|
| App-1 | 10.0.11.0/24 | ap-south-1a | EC2 Application Server |
| App-2 | 10.0.12.0/24 | ap-south-1b | EC2 Application Server |

## Private Database Subnets

| Name | CIDR | AZ | Purpose |
|------|------|----|---------|
| DB-1 | 10.0.21.0/24 | ap-south-1a | RDS Primary |
| DB-2 | 10.0.22.0/24 | ap-south-1b | RDS Standby |

## Design Goals

- High Availability
- High Scalability
- Security
- Fault Tolerance
- Multi-AZ Deployment
- Future Expansion
