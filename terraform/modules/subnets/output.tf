output "public_subnet_ids" {

  value = aws_subnet.public[*].id

}

output "public_subnet_arns" {

  value = aws_subnet.public[*].arn

}