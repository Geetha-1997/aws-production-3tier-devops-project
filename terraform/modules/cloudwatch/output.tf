output "cpu_alarm_name" {

  description = "CPU Alarm Name"

  value = aws_cloudwatch_metric_alarm.high_cpu.alarm_name

}

output "cpu_alarm_arn" {

  description = "CPU Alarm ARN"

  value = aws_cloudwatch_metric_alarm.high_cpu.arn

}