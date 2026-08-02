# Helper resource to generate a unique bucket name suffix
resource "random_string" "bucket_suffix" {
  length  = 6
  special = false
  upper   = false
}

# S3 Bucket
resource "aws_s3_bucket" "app_bucket" {
  bucket        = "${var.environment}-data-bucket-${random_string.bucket_suffix.result}"
  force_destroy = true # Allows terraform destroy to clean it up even if files exist

  tags = {
    Name        = "${var.environment}-s3-bucket"
    Environment = var.environment
  }
}

# Enforce Server-Side Encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "s3_encryption" {
  bucket = aws_s3_bucket.app_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Block public access explicitly (Security Best Practice)
resource "aws_s3_bucket_public_access_block" "s3_block_public" {
  bucket = aws_s3_bucket.app_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}