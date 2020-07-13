data "aws_ami" "aws_linux" {
  owners = ["amazon"]
  most_recent = true

  filter {
    name = "image-id"
    values = ["ami-0ea3405d2d2522162"]
  }
}

resource "aws_instance" "vpc-public" {

  ami = data.aws_ami.aws_linux.id
  instance_type = "t2.micro"
  associate_public_ip_address = true
  subnet_id = aws_subnet.subnet_del_1.id
  vpc_security_group_ids = [aws_security_group.allow-http.id]
  count = 2

  tags = {
    Name = "vpc_${count.index + count.index}_del"
  }

  depends_on = [aws_security_group.allow-http]
}

resource "aws_instance" "vpc-private" {
  ami = data.aws_ami.aws_linux.id
  instance_type = "t2.micro"
  associate_public_ip_address = true
  subnet_id = aws_subnet.subnet_del_2.id
  vpc_security_group_ids = [aws_security_group.allow-http.id]

  tags = {
    Name = "vpc-private"
  }

  depends_on = [aws_security_group.allow-http]
}

resource "aws_security_group" "allow-http" {
  name = "allow-http"
  description = "allow-http"
  vpc_id = aws_vpc.vpc_del.id

  ingress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]

  }
}
