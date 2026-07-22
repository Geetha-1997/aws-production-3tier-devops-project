resource "aws_lb_listener" "http" {

  load_balancer_arn = var.alb_arn

  port     = 80
  protocol = "HTTP"

  default_action {

    type = "redirect"

    redirect {

      port = "443"

      protocol = "HTTPS"

      status_code = "HTTP_301"

    }

  }

}
resource "aws_lb_listener" "https" {

  load_balancer_arn = var.alb_arn

  port = 443

  protocol = "HTTPS"

  ssl_policy = "ELBSecurityPolicy-TLS13-1-2-2021-06"

  certificate_arn = var.certificate_arn

  default_action {

    type = "forward"

    target_group_arn = var.target_group_arn

  }

}