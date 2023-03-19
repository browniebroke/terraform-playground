resource "aws_s3_bucket" "static_bucket" {
  bucket = "browniebroke-static"
}

resource "aws_s3_bucket_acl" "static_bucket_acl" {
  bucket = aws_s3_bucket.static_bucket.id
  acl    = "public-read"
}

resource "aws_s3_bucket" "media_bucket" {
  bucket = "browniebroke-media"
}

resource "aws_s3_bucket_acl" "media_bucket_acl" {
  bucket = aws_s3_bucket.media_bucket.id
  acl    = "public-read"
}
