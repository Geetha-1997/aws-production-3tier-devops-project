resource "aws_db_subnet_group" "this" {

  name = "${var.project_name}-${var.environment}-db-subnet"

  subnet_ids = var.db_subnet_ids

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project_name}-${var.environment}-db-subnet"
    }
  )
}

resource "aws_db_instance" "this" {

  identifier = "${var.project_name}-${var.environment}-mysql"

  engine = "mysql"

  engine_version = "8.0"

  instance_class = "db.t3.micro"

  allocated_storage = 20

  storage_type = "gp3"

  username = var.db_username

  password = var.db_password

  db_name = var.db_name

  db_subnet_group_name = aws_db_subnet_group.this.name

  vpc_security_group_ids = [
    var.security_group_id
  ]

  skip_final_snapshot = true

  publicly_accessible = false

  deletion_protection = false

  multi_az = false

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project_name}-${var.environment}-mysql"
    }
  )
}