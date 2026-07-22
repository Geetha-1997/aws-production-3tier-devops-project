output "queue_url" {
  description = "URL of the SQS Queue"
  value       = aws_sqs_queue.this.id
}

output "queue_arn" {
  description = "ARN of the SQS Queue"
  value       = aws_sqs_queue.this.arn
}

output "queue_name" {
  description = "Name of the SQS Queue"
  value       = aws_sqs_queue.this.name
}