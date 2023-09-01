# Create Load balancer - app tier
resource "aws_lb" "three-tier-app-lb" {
  name               = "three-tier-app-lb"
  internal           = true
  load_balancer_type = "application"
  
  security_groups    = ["${aws_security_group.app-sg.id}"]
  subnets            = [aws_subnet.three-tier-pvt-sub-1.id, aws_subnet.three-tier-pvt-sub-2.id]

  tags = {
    Environment = "three-tier-app-lb"
  }
}





# Create Load Balancer listener - app tier
resource "aws_lb_listener" "three-tier-app-lb-listner" {
  load_balancer_arn = aws_lb.three-tier-app-lb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.three-tier-app-lb-tg.arn
  }
}

# Register the instances with the target group - app tier
resource "aws_autoscaling_attachment" "three-tier-app-asattach" {
  autoscaling_group_name = aws_autoscaling_group.three-tier-app-asg.name
  lb_target_group_arn   = aws_lb_target_group.three-tier-app-lb-tg.arn
  
}
