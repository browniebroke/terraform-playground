resource "aws_ecs_cluster" "production" {
  name = "${var.ecs_cluster_name}_cluster"
}

resource "aws_launch_configuration" "ecs" {
  name                        = "${var.ecs_cluster_name}-cluster"
  image_id                    = lookup(var.amis, var.aws_region)
  instance_type               = var.instance_type
  security_groups             = [aws_security_group.ecs.id]
  iam_instance_profile        = aws_iam_instance_profile.ecs.name
  key_name                    = aws_key_pair.production.key_name
  associate_public_ip_address = true
  user_data                   = "#!/bin/bash\necho ECS_CLUSTER='${var.ecs_cluster_name}-cluster' > /etc/ecs/ecs.config"
}

resource "aws_ecs_task_definition" "app" {
  family = "myapp-task"
  # depends_on = [aws_db_instance.production]
  container_definitions = jsonencode([
    {
      name  = var.container_name
      image = "nginx:latest"
      # image     = "${var.aws_account_id}.dkr.ecr.${var.aws_region}.amazonaws.com/${var.ecr_repo_name}:latest"
      essential = true
      cpu       = 10
      memory    = 512
      links     = []
      portMappings = [
        {
          containerPort = var.container_port
          hostPort      = 0,
          protocol      = "tcp"
        }
      ],
      environment = [
        {
          name  = "RDS_DB_NAME"
          value = var.rds_db_name
        },
        {
          name  = "RDS_USERNAME"
          value = var.rds_username
        },
        {
          name  = "RDS_PASSWORD"
          value = var.rds_password
        },
        # {
        #   name  = "RDS_HOSTNAME"
        #   value = aws_db_instance.production.address
        # },
        {
          name  = "RDS_PORT"
          value = "5432"
        },

      ],
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group         = var.log_group_name
          awslogs-region        = var.aws_region
          awslogs-stream-prefix = var.log_stream_name
        }
      }
    }
  ])
}

resource "aws_ecs_service" "production" {
  name            = "${var.ecs_cluster_name}_myapp_service"
  cluster         = aws_ecs_cluster.production.id
  task_definition = aws_ecs_task_definition.app.arn
  iam_role        = aws_iam_role.ecs_service_role.arn
  desired_count   = var.app_count
  depends_on      = [aws_alb_listener.ecs_alb_http_listener, aws_iam_role_policy.ecs_service_role_policy]

  load_balancer {
    target_group_arn = aws_alb_target_group.default_target_group.arn
    container_name   = var.container_name
    container_port   = var.container_port
  }
}
