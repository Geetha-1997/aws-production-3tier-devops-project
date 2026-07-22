variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "aws_region" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "availability_zones" {
  type = list(string)
}

variable "public_subnet_cidrs" {
  type = list(string)
}

variable "private_app_subnet_cidrs" {
  type = list(string)
}

variable "private_db_subnet_cidrs" {
  type = list(string)
}

variable "my_ip" {
  type = string
}
variable "bastion_ami" {
  description = "AMI ID for Bastion Host"
  type        = string
}

variable "bastion_instance_type" {
  description = "Bastion Instance Type"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "EC2 Key Pair Name"
  type        = string
}
variable "certificate_arn" {
  description = "ACM Certificate ARN"
  type        = string
}
####################################################
# Application EC2 Variables
####################################################

variable "app_ami" {
  description = "AMI ID for Application Servers"
  type        = string
}

variable "app_instance_type" {
  description = "Application EC2 Instance Type"
  type        = string
  default     = "t3.micro"
}
variable "hosted_zone_id" {
  description = "Route53 Hosted Zone ID"
  type        = string
}

variable "domain_name" {
  description = "Application Domain"
  type        = string
}
variable "notification_email" {

  description = "Email address for SNS notifications"

  type = string

}
variable "db_name" {
  type = string
}

variable "db_username" {
  type = string
}

variable "db_password" {
  type      = string
  sensitive = true
}
