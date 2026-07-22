#S3 Bucket
resource "aws_s3_bucket" "terraform_state" {

  bucket = var.bucket_name

}
#Enable Versioning
resource "aws_s3_bucket_versioning" "terraform_state" {

  bucket = aws_s3_bucket.terraform_state.id

  versioning_configuration {

    status = "Enabled"

  }

}
#Encrypt the Bucket
resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state" {

  bucket = aws_s3_bucket.terraform_state.id

  rule {

    apply_server_side_encryption_by_default {

      sse_algorithm = "AES256"

    }

  }

}
#Create DynamoDB Table
resource "aws_dynamodb_table" "terraform_lock" {

  name = var.lock_table_name

  billing_mode = "PAY_PER_REQUEST"

  hash_key = "LockID"

  attribute {

    name = "LockID"

    type = "S"

  }

}
