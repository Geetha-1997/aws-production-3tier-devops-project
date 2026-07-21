# VPC Module

## Description

This Terraform module creates a production-ready AWS Virtual Private Cloud (VPC).

## Features

- Creates a VPC
- Enables DNS Support
- Enables DNS Hostnames
- Applies common tags
- Exports VPC information

## Inputs

| Variable | Description |
|----------|-------------|
| project_name | Project Name |
| environment | Environment |
| vpc_cidr | VPC CIDR |
| enable_dns_support | Enable DNS Support |
| enable_dns_hostnames | Enable DNS Hostnames |

## Outputs

- VPC ID
- VPC ARN
- CIDR Block
- Default Security Group ID
- Default Route Table ID