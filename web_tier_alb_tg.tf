# Create Load balancer - web tier
resource "aws_lb" "three-tier-web-lb" {
  name               = "three-tier-web-lb"
  internal           = false
  load_balancer_type = "application"
  
  security_groups    = ["${aws_security_group.web_sg.id}"]
  subnets            = [aws_subnet.three-tier-pub-sub-1.id, aws_subnet.three-tier-pub-sub-2.id]

  tags = {
    Environment = "three-tier-web-lb"
  }
}



# Create Load Balancer listener - web tier
resource "aws_lb_listener" "three-tier-web-lb-listner" {
  load_balancer_arn = aws_lb.three-tier-web-lb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.three-tier-web-lb-tg.arn
  }
}

# Register the instances with the target group - web tier
resource "aws_autoscaling_attachment" "three-tier-web-asattach" {
  autoscaling_group_name = aws_autoscaling_group.three-tier-web-asg.name
  lb_target_group_arn   = aws_lb_target_group.three-tier-web-lb-tg.arn
  
}