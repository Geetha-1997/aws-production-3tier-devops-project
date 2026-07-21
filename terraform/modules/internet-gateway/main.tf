resource "aws_internet_gateway" "this" {

  vpc_id = var.vpc_id

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project_name}-${var.environment}-igw"
    }
  )

}