resource "aws_nat_gateway" "this" {

  allocation_id = var.allocation_id
  subnet_id     = var.public_subnet_id

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project_name}-${var.environment}-natgw"
    }
  )

}