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

variable "availability_zones" {
  description = "Availability Zones"

  type = list(string)
}

variable "public_subnet_cidrs" {
  description = "Public Subnet CIDRs"

  type = list(string)
}

variable "private_app_subnet_cidrs" {
  description = "Private App Subnet CIDRs"

  type = list(string)
}

variable "private_db_subnet_cidrs" {
  description = "Private Database Subnet CIDRs"

  type = list(string)
}