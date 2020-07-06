resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/27"

  tags = {
    Name = "VPC_Test"
  }
}

resource "aws_subnet" "public-subnet" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.0.0/28"
  map_public_ip_on_launch = "true"
  availability_zone       = "eu-west-1a"

  tags = {
    Name = "VPC_Subnet_1"
  }
}

resource "aws_subnet" "private-subnet" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.0.16/28"
  map_public_ip_on_launch = "false"
  availability_zone       = "eu-west-1a"

  tags = {
    Name = "VPC_Subnet_2"
  }
}

resource "aws_internet_gateway" "internet-gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "Internet GW"
  }
}

resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gw.id
  }
}

resource "aws_route_table_association" "public-rta" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.public-rt.id
}
