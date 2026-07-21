# Subnets Module

## Description

Creates six production-ready subnets across two Availability Zones.

### Public Subnets
- Public Subnet 1
- Public Subnet 2

### Private Application Subnets
- Private App Subnet 1
- Private App Subnet 2

### Private Database Subnets
- Private DB Subnet 1
- Private DB Subnet 2

## Inputs

- project_name
- environment
- vpc_id
- availability_zones
- public_subnet_cidrs
- private_app_subnet_cidrs
- private_db_subnet_cidrs

## Outputs

- public_subnet_ids
- private_app_subnet_ids
- private_db_subnet_ids