variable "project_name" {
  description = "Project Name"
  type        = string
}

variable "environment" {
  description = "Environment"
  type        = string
}

variable "allocation_id" {
  description = "Elastic IP Allocation ID"
  type        = string
}

variable "public_subnet_id" {
  description = "Public Subnet ID"
  type        = string
}