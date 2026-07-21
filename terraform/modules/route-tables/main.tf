########################################
# Public Route Table
########################################

resource "aws_route_table" "public" {

  vpc_id = var.vpc_id

  route {

    cidr_block = "0.0.0.0/0"

    gateway_id = var.internet_gateway_id

  }

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project_name}-${var.environment}-public-rt"
    }
  )

}

########################################
# Private Route Table
########################################

resource "aws_route_table" "private" {

  vpc_id = var.vpc_id

  route {

    cidr_block = "0.0.0.0/0"

    nat_gateway_id = var.nat_gateway_id

  }

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project_name}-${var.environment}-private-rt"
    }
  )

}

########################################
# Public Associations
########################################

resource "aws_route_table_association" "public" {

  count = length(var.public_subnet_ids)

  subnet_id = var.public_subnet_ids[count.index]

  route_table_id = aws_route_table.public.id

}

########################################
# Private APP Associations
########################################

resource "aws_route_table_association" "private_app" {

  count = length(var.private_app_subnet_ids)

  subnet_id = var.private_app_subnet_ids[count.index]

  route_table_id = aws_route_table.private.id

}

########################################
# Private DB Associations
########################################

resource "aws_route_table_association" "private_db" {

  count = length(var.private_db_subnet_ids)

  subnet_id = var.private_db_subnet_ids[count.index]

  route_table_id = aws_route_table.private.id

}