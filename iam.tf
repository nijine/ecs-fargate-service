resource "aws_iam_role" "task" {
  name               = "${var.name}-task-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ecs-tasks.amazonaws.com"
      }
    }
  ]
}
EOF
}

# TODO: make this the default option
data "aws_iam_role" "ecs_exec" {
  name = "ecsTaskExecutionRole"
}
