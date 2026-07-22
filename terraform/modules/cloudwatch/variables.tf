variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "autoscaling_group_name" {
  type = string
}

variable "sns_topic_arn" {
  type    = string
  default = ""
}