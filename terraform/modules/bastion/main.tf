resource "aws_instance" "bastion" {

  ami           = var.ami_id
  instance_type = var.instance_type

  subnet_id = var.public_subnet_id

  vpc_security_group_ids = [
    var.security_group_id
  ]

  key_name = var.key_name

  iam_instance_profile = var.iam_instance_profile

  associate_public_ip_address = true

  tags = merge(

    local.common_tags,

    {
      Name = "${var.project_name}-${var.environment}-bastion"
    }

  )

}