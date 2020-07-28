provider "aws" {
  region     = var.region
  access_key = var.secret_key
  secret_key = var.secret_id
}

terraform {
  required_providers {
    aws = ">= 1.0.0"
  }
}
