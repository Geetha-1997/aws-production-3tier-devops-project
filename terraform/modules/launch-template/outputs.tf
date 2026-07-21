output "launch_template_id" {

  description = "Launch Template ID"

  value = aws_launch_template.this.id

}

output "launch_template_latest_version" {

  description = "Latest Version"

  value = aws_launch_template.this.latest_version

}