output "topic_arn" {

  description = "SNS Topic ARN"

  value = aws_sns_topic.this.arn

}

output "topic_name" {

  description = "SNS Topic Name"

  value = aws_sns_topic.this.name

}