data "aws_ami" "aws_linux" {
  owners      = ["amazon"]
  most_recent = true

  filter {
    name   = "image-id"
    values = ["ami-0ea3405d2d2522162"]
  }
}

resource "aws_instance" "ec2-1" {
  ami           = data.aws_ami.aws_linux.id
  instance_type = "t2.micro"

  associate_public_ip_address = true
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.vpc_nat.id]

  tags = {
    Name = "Public: Ec2-1"
  }

  depends_on = [aws_security_group.vpc_nat]
}

resource "aws_instance" "ec2-2" {
  ami           = data.aws_ami.aws_linux.id
  instance_type = "t2.micro"

  associate_public_ip_address = true
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.vpc_nat.id]

  tags = {
    Name = "Public: Ec2-2"
  }

  depends_on = [aws_security_group.vpc_nat]
}

resource "aws_instance" "ec2-3" {
  ami           = data.aws_ami.aws_linux.id
  instance_type = "t2.micro"

  associate_public_ip_address = true
  subnet_id                   = aws_subnet.private.id
  vpc_security_group_ids      = [aws_security_group.vpc_nat.id]

  tags = {
    Name = "Private: Ec2-3"
  }

  depends_on = [aws_security_group.vpc_nat]
}