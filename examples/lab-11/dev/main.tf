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

data "terraform_remote_state" "base" {
  backend = "local"

  config = {
    path = "../terraform.tfstate"
  }
}

resource "aws_subnet" "dev" {
  cidr_block = "10.0.0.0/26"
  vpc_id = data.terraform_remote_state.base.outputs.vpc
}