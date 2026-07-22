# Auto Scaling Module

## Purpose

Creates an Auto Scaling Group for application servers.

## Resources

- AWS Auto Scaling Group

## Inputs

- launch_template_id
- private_subnet_ids
- target_group_arns
- desired_capacity
- min_size
- max_size

## Outputs

- autoscaling_group_name
- autoscaling_group_arn