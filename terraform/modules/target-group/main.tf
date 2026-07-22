resource "aws_lb_target_group" "this" {

  name = "${var.project_name}-${var.environment}-tg"

  port     = var.port
  protocol = var.protocol

  target_type = "instance"

  vpc_id = var.vpc_id

  health_check {

    enabled = true

    path = "/"

    port = "traffic-port"

    protocol = "HTTP"

    healthy_threshold = 3

    unhealthy_threshold = 3

    timeout = 5

    interval = 30

    matcher = "200"

  }

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project_name}-${var.environment}-tg"
    }
  )
}
