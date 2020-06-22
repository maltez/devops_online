provider "aws" {
  region = var.region

  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_vpc" "name" {
  cidr_block = "10.0.0.0/24"

  tags = {
      Name = "Temp_vpc"
  }
}

resource "aws_subnet" "subnet_1" {
  vpc_id = aws_vpc.name.id
  availability_zone = "eu-west-1a"
  cidr_block = "10.0.0.0/24"

  tags = {
      Name = "My_subnet"
  }
}

variable "region" {
  type = string
  default = "eu-west-1"
}


variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}

output "VPC_ID" {
  value = aws_vpc.name.id
}



