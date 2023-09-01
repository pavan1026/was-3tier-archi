resource "aws_security_group" "app-sg" {
  vpc_id      =  aws_vpc.three-tier-vpc.id
  name        = "app-security-group"
  description = "Allow SSH and http and https"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = ["${aws_security_group.web_sg.id}"]
  }
ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = ["${aws_security_group.web_sg.id}"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    #cidr_blocks = [0.0.0.0.0/0]
    security_groups = ["${aws_security_group.web_sg.id}"] 
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    #security_groups = ["${aws_security_group.web_sg.id}"]
  }
  tags = {
    Name = "app-sg"
  }
}