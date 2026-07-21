output "nat_gateway_id" {
  description = "NAT Gateway ID"
  value       = aws_nat_gateway.this.id
}

output "nat_gateway_public_ip" {
  description = "NAT Gateway Public IP"
  value       = aws_nat_gateway.this.public_ip
}