resource "aws_vpc" "vpc_test" {
  cidr_block = "10.10.0.0/22"

  tags = {
    Name = "VPC_Test"
  }
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.vpc_test.id
  cidr_block              = "10.10.1.0/28"
  map_public_ip_on_launch = "true"
  availability_zone       = "${var.region}a"

  tags = {
    Name = "Subnet_1"
  }
}

resource "aws_subnet" "private" {
  vpc_id                  = aws_vpc.vpc_test.id
  cidr_block              = "10.10.2.0/28"
  map_public_ip_on_launch = "false"
  availability_zone       = "${var.region}a"

  tags = {
    Name = "Subnet_2"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_test.id

  tags = {
    Name = "GW"
  }
}
####PUB ROUTES####
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc_test.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

####PRIVATE ROUTES####
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.vpc_test.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}
