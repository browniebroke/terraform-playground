# Configure the AWS provider
provider "aws" {
  region = var.aws_region
  profile = var.aws_profile_name
}