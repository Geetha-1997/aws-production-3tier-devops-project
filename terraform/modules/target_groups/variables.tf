variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "port" {
  type    = number
  default = 80
}

variable "protocol" {
  type    = string
  default = "HTTP"
}