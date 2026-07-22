resource "aws_cloudwatch_metric_alarm" "high_cpu" {

  alarm_name = "${var.project_name}-${var.environment}-HighCPU"

  comparison_operator = "GreaterThanThreshold"

  evaluation_periods = 2

  metric_name = "CPUUtilization"

  namespace = "AWS/EC2"

  period = 300

  statistic = "Average"

  threshold = 80

  dimensions = {

    AutoScalingGroupName = var.autoscaling_group_name

  }

  alarm_description = "Alarm when CPU exceeds 80%"

  alarm_actions = var.sns_topic_arn == "" ? [] : [
    var.sns_topic_arn
  ]

  tags = local.common_tags

}