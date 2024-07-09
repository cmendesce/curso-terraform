resource "aws_security_group" "allow_web" {
  name   = "allow web traffic"
  vpc_id = var.vpc_id

  ingress {
    from_port   = local.http_port
    to_port     = local.http_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = local.https_port
    to_port     = local.https_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_lb" "alb" {
  name               = "default-alb"
  internal           = false
  load_balancer_type = "application"
  subnets            = var.subnet_ids
  security_groups    = [aws_security_group.allow_web.id]
}

resource "aws_lb_target_group" "target_group" {
  name     = "default-tg"
  port     = local.http_port
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_target_group_attachment" "tg_ec2_attachment" {
  target_group_arn = aws_lb_target_group.target_group.arn
  target_id        = aws_instance.nginx.id
  port             = local.http_port
}

resource "aws_lb_listener" "default_listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = local.http_port
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group.arn
  }
}
