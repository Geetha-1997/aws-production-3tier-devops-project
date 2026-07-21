# Security Groups Module

## Description

Creates four production-ready Security Groups.

## Security Groups

- ALB Security Group
- Bastion Security Group
- Application Security Group
- RDS Security Group

## Security Rules

- Internet → ALB (80, 443)
- Bastion → App (22)
- ALB → App (80)
- App → RDS (3306)

## Outputs

- alb_security_group_id
- bastion_security_group_id
- app_security_group_id
- rds_security_group_id