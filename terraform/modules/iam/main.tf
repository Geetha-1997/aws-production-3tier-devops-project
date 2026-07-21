resource "aws_iam_role" "ec2_role" {

  name = "${var.project_name}-${var.environment}-ec2-role"

  assume_role_policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {

        Action = "sts:AssumeRole"

        Effect = "Allow"

        Principal = {

          Service = "ec2.amazonaws.com"

        }

      }

    ]

  })

  tags = local.common_tags

}

resource "aws_iam_instance_profile" "ec2_profile" {

  name = "${var.project_name}-${var.environment}-instance-profile"

  role = aws_iam_role.ec2_role.name

}