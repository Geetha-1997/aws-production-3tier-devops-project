output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.this.id
}

output "vpc_arn" {
  description = "VPC ARN"
  value       = aws_vpc.this.arn
}

output "vpc_cidr" {
  description = "VPC CIDR"
  value       = aws_vpc.this.cidr_block
}

output "default_security_group_id" {
  description = "Default Security Group ID"
  value       = aws_vpc.this.default_security_group_id
}

output "default_route_table_id" {
  description = "Default Route Table ID"
  value       = aws_vpc.this.default_route_table_id
}