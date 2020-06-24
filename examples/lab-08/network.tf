resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "main"
  }
}

resource "aws_subnet" "public" {
  cidr_block = "10.0.0.0/28"
  vpc_id = aws_vpc.main.id
  availability_zone = "${var.region}a"

  tags = {
    Name = "Delete"
  }
}

resource "aws_internet_gateway" "public" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.public.id
  }

  tags = {
    Name = "For delete"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

