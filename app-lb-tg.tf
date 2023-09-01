# create load balancer target group - app tier
resource "aws_lb_target_group" "three-tier-app-lb-tg" {
  name     = "three-tier-app-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.three-tier-vpc.id

  health_check {
    interval            = 30
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 10
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }
}