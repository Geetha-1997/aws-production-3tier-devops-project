variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "notification_email" {
  description = "Email address for SNS notifications"
  type        = string
}