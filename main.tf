# conditional defaults

locals {
  exec_role_arn = var.exec_role_arn != "" ? var.exec_role_arn : data.aws_iam_role.ecs_exec.arn
}
