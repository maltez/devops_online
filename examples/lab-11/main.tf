variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}

provider "aws" {
  region = "eu-west-1"
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/24"
}

output "vpc" {
  value = aws_vpc.main.id
}
