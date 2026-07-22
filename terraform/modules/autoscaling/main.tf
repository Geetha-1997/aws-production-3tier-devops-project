resource "aws_autoscaling_group" "this" {

  name = "${var.project_name}-${var.environment}-asg"

  desired_capacity = var.desired_capacity

  min_size = var.min_size

  max_size = var.max_size

  vpc_zone_identifier = var.private_subnet_ids

  target_group_arns = var.target_group_arns

  health_check_type = "EC2"

  launch_template {

    id      = var.launch_template_id
    version = "$Latest"

  }

  tag {

    key                 = "Name"
    value               = "${var.project_name}-${var.environment}-app"
    propagate_at_launch = true

  }

  dynamic "tag" {

    for_each = local.common_tags

    content {

      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true

    }

  }

}