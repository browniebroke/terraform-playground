resource "aws_s3_bucket" "static_bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_acl" "static_bucket_acl" {
  bucket = aws_s3_bucket.static_bucket.id
  acl    = var.bucket_acl
}
