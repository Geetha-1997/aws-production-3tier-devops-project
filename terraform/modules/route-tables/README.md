# Route Tables Module

## Description

Creates route tables and associates them with public and private subnets.

## Resources Created

- Public Route Table
- Private Route Table
- Public Route
- Private Route
- Public Route Associations
- Private Route Associations

## Inputs

- project_name
- environment
- vpc_id
- internet_gateway_id
- nat_gateway_id
- public_subnet_ids
- private_app_subnet_ids
- private_db_subnet_ids

## Outputs

- public_route_table_id
- private_route_table_id