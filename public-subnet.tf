# Public Subnets 
resource "aws_subnet" "three-tier-pub-sub-1" {
  vpc_id            = aws_vpc.three-tier-vpc.id
  cidr_block        = "10.0.0.0/28"
  availability_zone = "eu-west-2a"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "three-tier-pub-sub-1"
  }
}

resource "aws_subnet" "three-tier-pub-sub-2" {
  vpc_id            = aws_vpc.three-tier-vpc.id
  cidr_block        = "10.0.0.16/28"
  availability_zone = "eu-west-2b"
  map_public_ip_on_launch = "true"
  tags = {
    Name = "three-tier-pub-sub-2"
  }
}

