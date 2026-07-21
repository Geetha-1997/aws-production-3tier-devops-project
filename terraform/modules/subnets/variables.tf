variable "project_name" {
  description = "Project Name"
  type        = string
}

variable "environment" {
  description = "Environment"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "availability_zone_1" {
  description = "First Availability Zone"
  type        = string
}

variable "availability_zone_2" {
  description = "Second Availability Zone"
  type        = string
}

variable "public_subnet_1_cidr" {
  type = string
}

variable "public_subnet_2_cidr" {
  type = string
}

variable "private_app_subnet_1_cidr" {
  type = string
}

variable "private_app_subnet_2_cidr" {
  type = string
}

variable "private_db_subnet_1_cidr" {
  type = string
}

variable "private_db_subnet_2_cidr" {
  type = string
}