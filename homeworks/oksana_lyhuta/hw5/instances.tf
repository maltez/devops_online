resource "aws_instance" "bastion-instance" {
  ami           = var.instance-ami
  instance_type = "t2.micro"

  subnet_id = aws_subnet.public-subnet.id

  vpc_security_group_ids = [aws_security_group.allow-ssh.id]

  key_name = "ec2"

  tags = {
    Name = "Bastion instance"
  }
}

resource "aws_instance" "public-instance" {
  ami           = var.instance-ami
  instance_type = "t2.micro"

  subnet_id = aws_subnet.public-subnet.id

  vpc_security_group_ids = [aws_security_group.allow-ssh.id]
  
  key_name = "ec2"

  tags = {
    Name = "Public app instance"
  }
}

resource "aws_instance" "private-instance" {
  ami           = var.instance-ami
  instance_type = "t2.micro"

  subnet_id = aws_subnet.private-subnet.id

  vpc_security_group_ids = [aws_security_group.allow-ssh.id]

  key_name = "ec2"
  
  tags = {
    Name = "Private instance"
  }
}


