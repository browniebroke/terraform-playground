resource "aws_ecs_cluster" "production" {
  name = "${var.ecs_cluster_name}-cluster"
}

resource "aws_ecs_task_definition" "app" {
  family                   = "myapp-task"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  # See this page for allowed values as CPU and memory:
  # https://docs.aws.amazon.com/AmazonECS/latest/userguide/task_definition_parameters.html#task_size
  cpu                = 256
  memory             = 512
  execution_role_arn = aws_iam_role.ecs_task_role.arn

  # depends_on = [aws_db_instance.production]
  container_definitions = jsonencode([
    {
      name  = var.container_name
      image = "nginx:latest"
      # image     = "${var.aws_account_id}.dkr.ecr.${var.aws_region}.amazonaws.com/${var.ecr_repo_name}:latest"
      essential = true
      portMappings = [
        {
          containerPort = var.container_port
          hostPort      = var.container_port,
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

  runtime_platform {
    operating_system_family = "LINUX"
    cpu_architecture        = "X86_64"
  }
}

resource "aws_ecs_service" "production" {
  name            = "${var.ecs_cluster_name}-myapp-service"
  cluster         = aws_ecs_cluster.production.id
  task_definition = aws_ecs_task_definition.app.arn
  desired_count   = var.app_count
  depends_on      = [aws_alb_listener.ecs-alb-http-listener, aws_iam_role_policy.ecs-service-role-policy]
  launch_type     = "FARGATE"

  network_configuration {
    subnets         = [aws_subnet.private-subnet-1.id, aws_subnet.private-subnet-2.id]
    security_groups = [aws_security_group.ecs.id]
  }

  load_balancer {
    target_group_arn = aws_alb_target_group.default-target-group.arn
    container_name   = var.container_name
    container_port   = var.container_port
  }
}
