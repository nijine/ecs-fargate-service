resource "aws_ecs_task_definition" "task" {
  family                   = var.name
  container_definitions    = var.container_definitions
  task_role_arn            = aws_iam_role.task.arn
  execution_role_arn       = local.exec_role_arn
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.cpu
  memory                   = var.memory
}

resource "aws_ecs_service" "awsvpc" {
  name            = var.name
  cluster         = aws_ecs_cluster.apps.id
  task_definition = aws_ecs_task_definition.task.arn
  desired_count   = var.desired_count
  launch_type     = "FARGATE"

  load_balancer {
    target_group_arn = aws_lb_target_group.main[0].arn
    container_name   = var.name
    container_port   = 80
  }

  network_configuration {
    subnets          = var.subnet_ids
    security_groups  = [aws_security_group.lb_sg.id]
    assign_public_ip = true
  }
}

resource "aws_ecs_cluster" "apps" {
  name = "${var.name}-cluster"
}

resource "aws_ecs_cluster_capacity_providers" "apps-fargate-provider" {
  cluster_name = aws_ecs_cluster.apps.name

  capacity_providers = ["FARGATE"]
}

