resource "aws_vpc" "vpc_del" {
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "vpc_del"
  }
}

resource "aws_subnet" "subnet_del_1" {
  cidr_block = "10.0.0.0/28"
  vpc_id = aws_vpc.vpc_del.id
  availability_zone = "${var.region}a"

  tags = {
    Name = "subnet_del_1"
  }
}

resource "aws_internet_gateway" "public" {
  vpc_id = aws_vpc.vpc_del.id
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc_del.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.public.id
  }

  tags = {
    Name = "route_del"
  }
}

  resource "aws_route_table_association" "public" {
    subnet_id = aws_subnet.subnet_del_1.id
    route_table_id = aws_route_table.public.id
  }

  resource "aws_subnet" "subnet_del_2"{
    cidr_block = "10.0.0.0/28"
    vpc_id = aws_vpc.vpc_del.id
    availability_zone = "${var.region}a"

    tags = {
      Name = "subnet_del_2"
    }
  }

  resource "aws_internet_gateway" "private" {
    vpc_id = aws_vpc.vpc_del.id
  }

  resource "aws_route_table" "private" {
    vpc_id = aws_vpc.vpc_del.id
    route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.private.id
    }

    tags = {
      Name = "route_del"
    }
  }

  resource "aws_route_table_association" "private" {
    subnet_id = aws_subnet.subnet_del_2.id
    route_table_id = aws_route_table.private.id
  }
