# Provider
variable "aws_region" {
  description = "The AWS region to create resources in."
  default     = "eu-west-2"
}
variable "aws_account_id" {
  description = "The AWS account ID."
  default     = "111579726218"
}

# Networking
variable "public_subnet_1_cidr" {
  description = "CIDR Block for Public Subnet 1"
  default     = "10.0.1.0/24"
}
variable "public_subnet_2_cidr" {
  description = "CIDR Block for Public Subnet 2"
  default     = "10.0.2.0/24"
}
variable "private_subnet_1_cidr" {
  description = "CIDR Block for Private Subnet 1"
  default     = "10.0.3.0/24"
}
variable "private_subnet_2_cidr" {
  description = "CIDR Block for Private Subnet 2"
  default     = "10.0.4.0/24"
}
variable "availability_zones" {
  description = "Availability zones"
  type        = list(string)
  default     = ["eu-west-2a", "eu-west-2b"]
}

# load balancer
variable "health_check_path" {
  description = "Health check path for the default target group"
  default     = "/ping/"
}

# ECR
variable "ecr_repo_name" {
  description = "Name of the ECR repo"
  default     = "browniebroke"
}

# ECS
variable "ecs_cluster_name" {
  description = "Name of the ECS cluster"
  default     = "production"
}
variable "amis" {
  description = "Which AMI to spawn."
  default = {
    us-west-1 = "ami-0bd3976c0dbacc605"
  }
}
variable "instance_type" {
  default = "t2.micro"
}
variable "app_count" {
  description = "Number of Docker containers to run"
  default     = 2
}

# logs
variable "log_retention_in_days" {
  default = 30
}

# key pair
variable "ssh_pubkey_file" {
  description = "Path to an SSH public key"
  default     = "~/.ssh/id_rsa.pub"
}
