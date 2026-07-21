# VPC Module

## Purpose

This module creates the Virtual Private Cloud (VPC) for the project.

## Features

- Creates a VPC
- Enables DNS support
- Enables DNS hostnames
- Applies standard tags

## Inputs

| Variable | Description |
|----------|-------------|
| project_name | Name of the project |
| environment | Deployment environment |
| vpc_cidr | CIDR block for the VPC |

## Outputs

| Output | Description |
|---------|-------------|
| vpc_id | VPC ID |
| vpc_cidr | VPC CIDR Block |