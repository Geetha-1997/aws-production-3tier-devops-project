resource "aws_vpc" "this" {

  cidr_block = var.vpc_cidr

  enable_dns_support   = var.enable_dns_support

  enable_dns_hostnames = var.enable_dns_hostnames

  tags = {
    Name        = "${var.project_name}-${var.environment}-vpc"
    Environment = var.environment
    Project     = var.project_name
    ManagedBy   = "Terraform"
  }

}