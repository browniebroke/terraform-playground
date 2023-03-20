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
  default     = "/"
}

# ECR
variable "ecr_repo_name" {
  description = "Name of the ECR repo"
  default     = "myapp"
}

# ECS
variable "ecs_cluster_name" {
  description = "Name of the ECS cluster"
  default     = "production"
}
variable "app_count" {
  description = "Number of Docker containers to run."
  default     = 2
}
variable "container_name" {
  description = "Name of the container."
  default     = "myapp-container"
}
variable "container_port" {
  description = "The container port to expose."
  default     = 80
}

# logs
variable "log_group_name" {
  default = "/ecs/myapp"
}
variable "log_retention_in_days" {
  default = 30
}
variable "log_stream_name" {
  default = "myapp-log-stream"
}

# rds
variable "rds_db_name" {
  description = "RDS database name"
  default     = "myapp"
}
variable "rds_username" {
  description = "RDS database username"
  default     = "myapp"
}
variable "rds_password" {
  description = "RDS database password"
}
variable "rds_instance_class" {
  description = "RDS instance type"
  default     = "db.t3.micro"
}
