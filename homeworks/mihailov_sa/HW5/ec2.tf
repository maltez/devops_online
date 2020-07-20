data "aws_ami" "aws_linux" {
  owners      = ["amazon"]
  most_recent = true
  filter {
    name   = "image-id"
    values = ["ami-016b213e65284e9c9"]
  }
}

resource "aws_instance" "ec2-public" {
  ami           = data.aws_ami.aws_linux.id
  instance_type = "t2.micro"
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.firewall.id]
  count = 2
  tags = {
    Name = "ec2_1-2"
  }
  depends_on = [aws_security_group.firewall]
}

resource "aws_instance" "ec2-private" {
  ami           = data.aws_ami.aws_linux.id
  instance_type = "t2.micro"
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.private.id
  vpc_security_group_ids      = [aws_security_group.firewall.id]
  tags = {
    Name = "ec2-3"
  }
  depends_on = [aws_security_group.firewall]
}
