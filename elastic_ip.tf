# Create an Elastic IP address for the NAT Gateway
resource "aws_eip" "three-tier-nat-eip" {
  domain        = "vpc"
}
