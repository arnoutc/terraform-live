provider "aws" {
    region = var.region
}

resource "aws_s3_bucket" "terraform_state" {
    bucket = var.bucket

    # Prevent accidental deletion of this S3 bucket
    lifecycle {
      prevent_destroy = true
    }

}

resource "aws_dynamodb_table" "terraform_locks" {
    name = var.dynamodb
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"

    attribute {
      name = "LockID"
      type = "S"
    }
  
}

resource "aws_kms_key" "pacator_key" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
}

resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state_encryption" {
  bucket = aws_s3_bucket.terraform_state.bucket

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.pacator_key.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_s3_bucket_versioning" "versioning_terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

