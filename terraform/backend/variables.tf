variable "bucket_name" {

  description = "Terraform State Bucket"

  type = string

}

variable "lock_table_name" {

  description = "Terraform Lock Table"

  type = string

}

variable "aws_region" {

  type = string

}