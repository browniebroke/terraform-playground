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
  default     = "myapp"
}

# ECS
variable "ecs_cluster_name" {
  description = "Name of the ECS cluster"
  default     = "production"
}
variable "amis" {
  description = "Which AMI to spawn."
  default = {
    eu-west-1 = "ami-0557bea45bd2b776b"
    eu-west-2 = "ami-04018f95156d810bc"
    eu-west-3 = "ami-09d6d8f3c2066202b"
    us-east-1 = "ami-083cd4eb32643c8a0"
  }
}
variable "instance_type" {
  description = "The instance type to use."
  default     = "t2.micro"
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

# key pair
variable "ssh_pubkey_url" {
  description = "URL to an SSH public key"
  default     = "https://github.com/browniebroke.keys"
}

# auto scaling
variable "autoscale_min" {
  description = "Minimum autoscale (number of EC2)"
  default     = "1"
}
variable "autoscale_max" {
  description = "Maximum autoscale (number of EC2)"
  default     = "10"
}
variable "autoscale_desired" {
  description = "Desired autoscale (number of EC2)"
  default     = "4"
}

# rds
variable "rds_db_name" {
  description = "RDS database name"
  default     = "myapp-db"
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
  default     = "db.t2.micro"
}
