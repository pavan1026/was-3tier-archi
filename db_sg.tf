resource "aws_security_group" "db" {
  name   = "db-secgroup"
  vpc_id = aws_vpc.three-tier-vpc.id

  # ssh access from anywhere
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups = ["${aws_security_group.app-sg.id}"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
