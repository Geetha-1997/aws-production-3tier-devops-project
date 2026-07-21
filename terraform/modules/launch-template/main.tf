resource "aws_launch_template" "this" {

  name_prefix = "${var.project_name}-${var.environment}-"

  image_id = var.ami_id

  instance_type = var.instance_type

  key_name = var.key_name

  update_default_version = true

  vpc_security_group_ids = [
    var.security_group_id
  ]

  iam_instance_profile {

    name = var.iam_instance_profile

  }

  monitoring {

    enabled = true

  }

  metadata_options {

    http_endpoint = "enabled"

    http_tokens = "required"

    http_put_response_hop_limit = 2

  }

  block_device_mappings {

    device_name = "/dev/xvda"

    ebs {

      volume_size = 20

      volume_type = "gp3"

      encrypted = true

      delete_on_termination = true

    }

  }

  user_data = base64encode(file("${path.module}/user_data.sh"))

  tag_specifications {

    resource_type = "instance"

    tags = merge(

      local.common_tags,

      {

        Name = "${var.project_name}-${var.environment}-app-server"

      }

    )

  }

  tags = merge(

    local.common_tags,

    {

      Name = "${var.project_name}-${var.environment}-launch-template"

    }

  )

}