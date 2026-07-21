output "internet_gateway_id" {

  description = "Internet Gateway ID"

  value = aws_internet_gateway.this.id

}

output "internet_gateway_arn" {

  description = "Internet Gateway ARN"

  value = aws_internet_gateway.this.arn

}