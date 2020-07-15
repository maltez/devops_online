provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

terraform {
  required_providers {
    aws = ">= 1.0.0"
  }
}