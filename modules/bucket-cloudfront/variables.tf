variable "origin_name" {
  description = "The name of the Cloudfront origin"
}

variable "bucket_name" {
  description = "The name of S3 bucket"
}

variable "bucket_acl" {
  description = "The ACL of S3 bucket"
  default     = "public-read"
}
