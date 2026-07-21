variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "my_ip" {
  description = "Your public IP with CIDR (example: 203.0.113.5/32)"
  type        = string
}