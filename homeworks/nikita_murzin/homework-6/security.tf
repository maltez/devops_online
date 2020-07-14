resource "aws_security_group" "lb" {
  name        = "tf-ecs-alb"
  description = "Controls access to the ALB"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "ecs_tasks" {
  name        = "tf-ecs-tasks"
  description = "Allow inbound access from the ALB only"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port       = var.app_port
    protocol        = "tcp"
    to_port         = var.app_port
    security_groups = [aws_security_group.lb.id]
  }

  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}