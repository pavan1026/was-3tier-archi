# Create a launch configuration for the EC2 instances
resource "aws_launch_configuration" "three-tier-app-lconfig" {
  name_prefix                 = "three-tier-app-lconfig"
  image_id                    = "ami-0f3d9639a5674d559"
  instance_type               = "t2.micro"
  key_name                    = "eu-west"
  security_groups             = [aws_security_group.app-sg.id]
  user_data                   = <<-EOF
                                #!/bin/bash

                                sudo dnf update -y
                                sudo dnf install mariadb105-server -y
                                sudo systemctl start mariadb
                                sudo systemctl enable mariadb
                                EOF
                                
  associate_public_ip_address = false
  #lifecycle {
   # prevent_destroy = false
    #ignore_changes  = all
  #}
  
}