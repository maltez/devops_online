resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "Main"
  }
}

#Public subnet config
resource "aws_subnet" "public" {
  cidr_block        = "10.0.0.0/28"
  vpc_id            = aws_vpc.main.id
  availability_zone = "${var.region}a"

  tags = {
    Name = "To delete"
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
    Name = "To delete"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

#Private subnet config
resource "aws_subnet" "private" {
  cidr_block        = "10.0.0.16/28"
  vpc_id            = aws_vpc.main.id
  availability_zone = "${var.region}a"

  tags = {
    Name = "Private subnet"
  }
}

#NAT for Private subnet
resource "aws_eip" "nat" {
  vpc = true
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public.id
  depends_on    = [aws_internet_gateway.public]
  tags = {
    Name = "NAT gateway"
  }

}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}
