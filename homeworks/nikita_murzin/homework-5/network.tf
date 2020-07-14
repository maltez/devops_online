resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "main"
  }
}

resource "aws_internet_gateway" "public" {
  vpc_id = aws_vpc.main.id
}

/*
  Public Subnet
*/
resource "aws_subnet" "public" {
  cidr_block        = "10.0.0.0/24"
  vpc_id            = aws_vpc.main.id
  availability_zone = "${var.region}a"

  tags = {
    Name = "VPC_Subnet_1"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.public.id
  }

  tags = {
    Name = "Public subnet"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

/*
  Private Subnet
*/
resource "aws_subnet" "private" {
  cidr_block        = "10.0.1.0/24"
  vpc_id            = aws_vpc.main.id
  availability_zone = "${var.region}a"

  tags = {
    Name = "VPC_Subnet_2"
  }
}

resource "aws_eip" "private" {
  vpc = true
}

resource "aws_nat_gateway" "private" {
  allocation_id = aws_eip.private.id
  subnet_id     = aws_subnet.public.id
  depends_on    = [aws_internet_gateway.public]

  tags = {
    Name = "Private subnet"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.private.id
  }

  depends_on = [aws_nat_gateway.private]

  tags = {
    Name = "Private subnet"
  }
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}

resource "aws_security_group" "vpc_nat" {
  name        = "vpc_nat"
  description = "Allow traffic to pass from the private subnet to the internet"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [aws_subnet.private.cidr_block]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [aws_subnet.private.cidr_block]
  }

  ingress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 0
    protocol    = "icmp"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "NAT Security group"
  }
}