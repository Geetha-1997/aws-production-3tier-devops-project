variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "launch_template_id" {
  type = string
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "target_group_arns" {
  type = list(string)
}

variable "desired_capacity" {
  type    = number
  default = 2
}

variable "min_size" {
  type    = number
  default = 2
}

variable "max_size" {
  type    = number
  default = 4
}