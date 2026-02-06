resource "aws_lb" "my_lb" {
  name = "strapi-alb"
  load_balancer_type = "application"
  subnets = var.public_subnet_ids
  security_groups = [ var.alb_sg_id ]
}

resource "aws_lb_target_group" "tg" {
  name = "strapi-tg"
  port = 1337
  protocol = "HTTP"
  vpc_id = var.vpc_id

  health_check {
    path = "/"
    matcher = "200-399"
  }
}

resource "aws_lb_target_group_attachment" "attach" {
  target_group_arn = aws_lb_target_group.tg.arn
  target_id = var.instance_id
  port = 1337
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.my_lb.arn
  port = 80
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}
