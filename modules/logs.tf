resource "aws_cloudwatch_log_group" "django-log-group" {
  name              = var.log_group_name
  retention_in_days = var.log_retention_in_days
}

resource "aws_cloudwatch_log_stream" "django-log-stream" {
  name           = var.log_stream_name
  log_group_name = aws_cloudwatch_log_group.django-log-group.name
}
