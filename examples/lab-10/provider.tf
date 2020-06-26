provider "aws" {
  region     = "eu-west-1"
  access_key = var.access_key
  secret_key = var.secret_key
}

terraform {
  backend "s3" {
    bucket         = "xaixvbhuok"
    region         = "eu-west-1"
    key            = "state.tfstate"
    dynamodb_table = "state_lock"
  }
}