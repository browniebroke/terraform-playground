# Provider
variable "aws_region" {
  description = "The AWS region to create resources in."
  default     = "eu-west-2"
}
variable "aws_profile_name" {
  description = "The AWS profile to use."
  default     = "perso"
}