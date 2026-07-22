# CloudWatch Module

## Purpose

Creates CloudWatch alarms for production infrastructure.

## Features

- High CPU Alarm
- SNS Notification Integration
- Auto Scaling Monitoring
- Production Tags

## Resources Created

- aws_cloudwatch_metric_alarm

## Inputs

- project_name
- environment
- autoscaling_group_name
- sns_topic_arn

## Outputs

- cpu_alarm_name
- cpu_alarm_arn