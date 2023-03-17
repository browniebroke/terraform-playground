# Create ECR repos
resource "aws_ecr_repository" "app_ecr_repo" {
  name                 = var.ecr_repo_name
  image_tag_mutability = "IMMUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
}
