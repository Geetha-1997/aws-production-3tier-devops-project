##############################################
# Main Queue
##############################################

resource "aws_sqs_queue" "this" {

  name = "${var.project_name}-${var.environment}-queue"

  visibility_timeout_seconds = 30

  message_retention_seconds = 345600

  delay_seconds = 0

  receive_wait_time_seconds = 20

  tags = local.common_tags

}