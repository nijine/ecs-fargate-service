resource "aws_cloudwatch_log_group" "main" {
  name              = "${var.name}-logs"
  retention_in_days = var.log_retention_days
}

