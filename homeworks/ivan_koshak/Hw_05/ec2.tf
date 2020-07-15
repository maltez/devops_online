data "aws_ami" "aws_linux" {
  owners      = ["amazon"]
  most_recent = true

  filter {
    name   = "image-id"
    values = ["ami-0ea3405d2d2522162"]
  }
}

resource "aws_instance" "main" {
  ami           = data.aws_ami.aws_linux.id
  instance_type = "t2.micro"

  associate_public_ip_address = true
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.allow_ping.id]

  tags = {
    Name = "To delete"
  }

  depends_on = [aws_security_group.allow_ping]
}

resource "aws_security_group" "allow_ping" {
  name        = "allow_ping"
  description = "Allow icmp"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
