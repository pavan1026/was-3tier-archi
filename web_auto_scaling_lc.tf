###### Create a launch configuration for the EC2 instances #####
resource "aws_launch_configuration" "three-tier-web-lconfig" {
  name_prefix                 = "three-tier-web-lconfig"
  image_id                    = "ami-0f3d9639a5674d559"
  instance_type               = "t2.micro"
  key_name                    = "eu-west"
  security_groups             = [aws_security_group.web_sg.id]
  user_data                   = <<-EOF
                                #!/bin/bash
                                sudo yum -y update
                                sudo yum -y install httpd
                                sudo systemctl start httpd.service
                                # Enable Apache to start at boot
                                sudo systemctl enable httpd.service
                                # Create index.html file with your custom HTML
                                sudo echo '
                                "this is aws web-server"
                                
                                ' > /var/www/html/index.html

                                EOF
                                
  associate_public_ip_address = true
  lifecycle {
    prevent_destroy = false
    ignore_changes  = all
  }
}