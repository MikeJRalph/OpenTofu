resource "aws_s3_bucket" "buck" {
  bucket = var.bucket_name
  tags   = var.tags
}